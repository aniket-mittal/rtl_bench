#!/usr/bin/env python3
"""Convert RTL-BenchLS Task 3 (repository-issue fixing) into standard task JSONs (schema_version 1).

Input : sources/rtl-benchls/data/repo_issue_108_cases.json (108 real GitHub issue fixes)
Output: taskgen/build/rtl-benchls-task3/rtl-benchls__task3__<case>[__<module>].json  (kind = "repair")

Standard library only. Idempotent: the output directory is cleared and rewritten on every run.
Needs git, yosys and iverilog, and network access to github.com the first time (repositories are
cloned once, bare, into ~/.cache/rtl_bench_repos/<owner>__<repo>; override with --cache).

What the benchmark does (sources/rtl-benchls/rtlbenchls/runner.py, run_task3): the model gets the
issue title + body and the buggy file(s) at base_commit, must output the corrected module, and a
commercial LEC/SEC tool compares that against the file(s) at head_commit (the merged fix). Here the
formal comparison is Yosys (miter + sat -tempinduct, see harness/rtltask.py), so each task needs a
top module that Yosys and iverilog can elaborate. For every case:

  1. The patched RTL files (patches[].filename, minus testbench / DV / formal paths) are read at
     base_commit and head_commit. Modules whose text changed (ignoring comments and whitespace)
     are the candidate tops.
  2. For a candidate top, the files it needs are collected from base_commit (and head_commit, for
     anything the fix newly depends on): modules it instantiates, packages it references, files it
     `include`s, recursively. Only module definitions reachable from the top pull in more modules.
     Testbench / DV / formal / simulation-only paths are never used.
  3. Files that differ between base_commit and head_commit are editable (starter = base version,
     reference = head version). All other files are read-only and taken from base_commit.
  4. The top must elaborate in Yosys (`hierarchy -check -top`, `proc`) and compile in iverilog -g2012
     for both versions, with identical port lists. If the changed module itself does not qualify
     (for example the fix changed its ports), its nearest instantiating ancestors are tried.
  5. Yosys equivalence of base vs head at that top (60 s): proven equivalent => dropped (the fix does
     not change behavior there, so the task cannot be graded). The result is stored in
     provenance.base_vs_head.

File layout in a task (the harness compiles every .v/.sv under rtl/ in sorted path order, and both
Yosys and iverilog need a package before its first use):
  rtl/pkg/NN_<file>     SystemVerilog packages, NN = dependency order
  rtl/src/<file>        modules / interfaces (repository basename; repo path on a name clash)
  rtl/<include path>    `include targets, at the literal include path (rtl/ is on the include path)
  rtl/primgen/<prim>.sv stand-ins for OpenTitan's generated prim_* wrappers (see below)

Mechanical, behavior-preserving normalizations (applied identically to starter and reference, and
recorded in provenance.normalizations):
  * import_hoist  : `module m import p::*; #(...)` and module-level `import p::*;` are moved to file
                    scope just before the module. Yosys 0.6x cannot parse imports inside modules.
  * assert_dummy  : prim_assert.sv selects its "dummy" (empty) assertion macros for every tool.
                    The standard macros are concurrent SVA, which iverilog cannot compile; assertions
                    do not affect port behavior.
  * qualify_imported_types : type names that a file gets from `import p::*;` are written `p::name`
                    (Yosys resolves `p::name` but not wildcard-imported type names).
  * define_synthesis : when any file tests `SYNTHESIS`, rtl/00_defines.v defines it, so iverilog
                    compiles the same (synthesis) view that Yosys does.
  * primgen       : OpenTitan instantiates abstract `prim_X` cells whose wrappers are generated at
                    build time (not in git). When `prim_X` is missing but `prim_generic_X` exists, a
                    read-only copy of prim_generic_X with the module renamed to prim_X is added.

Usage: python3 harness/convert_rtlbenchls_task3.py [--input PATH] [--out DIR] [--cache DIR]
                                                   [--jobs N] [--only CASE_ID ...] [--no-formal]
"""
from __future__ import annotations

import argparse
import collections
import concurrent.futures
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import threading
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
sys.path.insert(0, str(HERE))
import rtltask  # noqa: E402  (harness helpers: yosys_ports, formal_check, run, ...)
from convert_rtlbenchls import blank_comments, tokenize, OPEN  # noqa: E402

DEFAULT_INPUT = REPO / "sources" / "rtl-benchls" / "data" / "repo_issue_108_cases.json"
DEFAULT_OUT = REPO / "taskgen" / "build" / "rtl-benchls-task3"
DEFAULT_CACHE = Path.home() / ".cache" / "rtl_bench_repos"

DEFAULT_TOOLS = ["iverilog", "vvp", "yosys"]
DEFAULT_LIMITS = {"max_agent_steps": 50, "wall_time_s": 1800, "tool_timeout_s": 120}
DEFAULT_FORMAL = {"method": "yosys_sat_tempinduct", "max_steps": 60, "timeout_s": 120, "accept_bounded": True}
HIDDEN_CYCLES = 1000
BASE_VS_HEAD_TIMEOUT = 60
ELAB_TIMEOUT = 120
MAX_ANCESTOR_DEPTH = 2
MAX_FILES = 80
SYNTH_DEFINE_PATH = "rtl/00_defines.v"  # sorts before rtl/pkg and rtl/src, so it is read first
SYNTH_DEFINE_TEXT = (
    "// Added by the task converter: compile the synthesis view of the design in every tool.\n"
    "// Yosys defines SYNTHESIS itself; this makes iverilog skip the same simulation-only code.\n"
    "`ifndef SYNTHESIS\n`define SYNTHESIS\n`endif\n")  # a top needing more files than this is not a sensible small task

METADATA_LICENSE = {
    "data": "CC-BY-4.0",
    "code": "MIT",
    "upstream": "https://github.com/hkust-zhiyao/RTL-BenchLS",
    "note": "Per sources/README.md: RTL-BenchLS metadata is CC-BY-4.0, code MIT. The RTL itself is "
            "from the case's repository under that repository's license (see rtl_license).",
}

HDL_EXT = (".v", ".sv", ".svh", ".vh")
SRC_EXT = (".v", ".sv")
# Path components that mark testbench / verification / simulation-only / doc trees.
EXCLUDE_DIRS = {
    "dv", "tb", "tbs", "test", "tests", "testbench", "testbenches", "bench", "formal", "fpv", "sim",
    "sims", "simulation", "verif", "verification", "model", "models", "doc", "docs", "sva", "lint",
    "fcov", "cov", "coverage", "uvm", "examples", "example", "scratch", "util", "utils", "ci",
}
EXCLUDE_FILE_RE = re.compile(
    r"(^tb_|_tb\.s?vh?$|_tb_|testbench|_bind\.sv$|_bind_|_assert_fpv|_fpv\.sv$|_sva\.sv$|_cov\.sv$|"
    r"_tracer|tracing|_if\.sv$|^sim_|_sim\.s?v$|dpi)",
    re.I,
)

KEYWORDS = set("""
always always_comb always_ff always_latch and assign assert assume automatic begin bit buf bufif0 bufif1
byte case casex casez cmos const cover default defparam disable do edge else end endcase endfunction
endgenerate endinterface endmodule endpackage endtask enum event export extern final for force forever
fork function generate genvar if iff import initial inout input int integer interface join localparam
logic longint macromodule modport module nand negedge nmos nor not notif0 notif1 or output package packed
parameter posedge priority pullup pulldown real realtime reg release repeat return rnmos rpmos rtran
rtranif0 rtranif1 shortint shortreal signed static string struct supply0 supply1 task time tran tranif0
tranif1 tri tri0 tri1 triand trior trireg type typedef union unique unique0 unsigned var void wait wand
while wire wor xnor xor property sequence endproperty endsequence class endclass virtual bind inside
""".split())
IDENT_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_$]*$")
INCLUDE_RE = re.compile(r'`include\s+"([^"]+)"')


def seed_for(task_id: str) -> int:
    return int(hashlib.sha256(task_id.encode()).hexdigest()[:8], 16) % (2 ** 31)


def excluded_path(path: str) -> bool:
    parts = path.split("/")
    if any(p.lower() in EXCLUDE_DIRS for p in parts[:-1]):
        return True
    return bool(EXCLUDE_FILE_RE.search(parts[-1]))


# --------------------------------------------------------------------------- git

class Git:
    """Bare clone of one GitHub repository; thread-safe blob reads via `git cat-file --batch`."""

    def __init__(self, cache: Path, repository: str):
        self.repository = repository
        self.dir = cache / repository.replace("/", "__")
        self.lock = threading.Lock()
        self._cat = None
        self._trees = {}
        self._blobs = {}

    def git(self, *args, check=True):
        p = subprocess.run(["git", "-C", str(self.dir), *args], stdout=subprocess.PIPE,
                           stderr=subprocess.PIPE)
        if check and p.returncode != 0:
            raise RuntimeError("git %s: %s" % (" ".join(args[:2]), p.stderr.decode(errors="replace").strip()))
        return p.returncode, p.stdout

    def ensure_clone(self):
        if (self.dir / "HEAD").exists():
            return None
        self.dir.parent.mkdir(parents=True, exist_ok=True)
        p = subprocess.run(["git", "clone", "--bare", "-q", "https://github.com/%s.git" % self.repository,
                            str(self.dir)], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if p.returncode != 0:
            shutil.rmtree(self.dir, ignore_errors=True)
            return "clone failed: " + p.stderr.decode(errors="replace").strip()[:200]
        return None

    def has_commit(self, sha):
        return self.git("cat-file", "-e", sha + "^{commit}", check=False)[0] == 0

    def ensure_commits(self, shas):
        """Fetch missing commits. Returns {sha: error} for commits that stay unavailable."""
        missing = [s for s in shas if not self.has_commit(s)]
        if missing:
            self.git("fetch", "-q", "origin", *missing, check=False)
        errs = {}
        for s in missing:
            if not self.has_commit(s):
                rc, _ = self.git("fetch", "-q", "origin", s, check=False)
                if not self.has_commit(s):
                    errs[s] = "commit not fetchable from origin"
        return errs

    def tree(self, commit):
        """{path: blob oid} for every file at commit."""
        with self.lock:
            if commit in self._trees:
                return self._trees[commit]
        _, out = self.git("ls-tree", "-r", "-z", commit)
        t = {}
        for rec in out.decode("utf-8", errors="replace").split("\0"):
            if not rec:
                continue
            meta, path = rec.split("\t", 1)
            mode, typ, oid = meta.split()
            if typ == "blob":
                t[path] = oid
        with self.lock:
            self._trees[commit] = t
        return t

    def blob(self, oid):
        with self.lock:
            if oid in self._blobs:
                return self._blobs[oid]
            if len(self._blobs) > 4000:
                self._blobs.clear()
            if self._cat is None:
                self._cat = subprocess.Popen(["git", "-C", str(self.dir), "cat-file", "--batch"],
                                             stdin=subprocess.PIPE, stdout=subprocess.PIPE)
            self._cat.stdin.write((oid + "\n").encode())
            self._cat.stdin.flush()
            header = self._cat.stdout.readline().decode().split()
            if len(header) < 3 or header[1] == "missing":
                raise RuntimeError("missing blob " + oid)
            size = int(header[2])
            data = self._cat.stdout.read(size)
            self._cat.stdout.read(1)
            text = data.decode("utf-8", errors="replace")
            self._blobs[oid] = text
            return text

    def show(self, commit, path):
        oid = self.tree(commit).get(path)
        return None if oid is None else self.blob(oid)

    def changed_paths(self, base, head):
        _, out = self.git("diff", "--name-only", "-z", base, head)
        return set(p for p in out.decode("utf-8", errors="replace").split("\0") if p)

    def close(self):
        if self._cat is not None:
            self._cat.stdin.close()
            self._cat.wait()
            self._cat = None


# --------------------------------------------------------------------------- parsing

class Parsed:
    """Definitions (module / interface / package) in one file, with each one's dependencies."""

    def __init__(self, text: str):
        self.text = text
        clean = blank_comments(text)
        self.clean = clean
        toks = tokenize(clean)
        self.includes = INCLUDE_RE.findall(re.sub(r"//[^\n]*", "", text))
        self.defs = []  # (kind, name, char_start, char_end, insts, pkgs)
        self.file_pkgs = set()
        closers = {"module": "endmodule", "macromodule": "endmodule", "interface": "endinterface",
                   "package": "endpackage"}
        i, n = 0, len(toks)
        while i < n:
            t = toks[i][0]
            if t in closers and not (i > 0 and toks[i - 1][0] in ("virtual", "extern")):
                kind = "package" if t == "package" else ("interface" if t == "interface" else "module")
                j = i + 1
                if j < n and toks[j][0] in ("automatic", "static"):
                    j += 1
                if j >= n or not IDENT_RE.match(toks[j][0]):
                    i += 1
                    continue
                name = toks[j][0]
                e = j + 1
                while e < n and toks[e][0] != closers[t]:
                    e += 1
                if e >= n:
                    break
                insts, pkgs = set(), set()
                for k in range(j + 1, e):
                    tk = toks[k][0]
                    if k + 1 < e and toks[k + 1][0] == "::" and IDENT_RE.match(tk):
                        pkgs.add(tk)
                        continue
                    if tk in KEYWORDS or not IDENT_RE.match(tk) or k + 2 >= e:
                        continue
                    if k > 0 and toks[k - 1][0] in (".", "::", "`"):
                        continue
                    nx = toks[k + 1][0]
                    if nx == "#" or (IDENT_RE.match(nx) and nx not in KEYWORDS and toks[k + 2][0] in ("(", "[")):
                        insts.add(tk)
                end_char = toks[e][2]
                # `endmodule : name`
                if e + 2 < n and toks[e + 1][0] == ":" and toks[e + 2][0] == name:
                    end_char = toks[e + 2][2]
                self.defs.append((kind, name, toks[i][1], end_char, insts, pkgs))
                i = e + 1
            else:
                if i + 1 < n and toks[i + 1][0] == "::" and IDENT_RE.match(t):
                    self.file_pkgs.add(t)
                i += 1

    def names(self, kinds=("module", "interface", "package")):
        return [d[1] for d in self.defs if d[0] in kinds]

    def def_text(self, name, clean=True):
        for d in self.defs:
            if d[1] == name:
                return (self.clean if clean else self.text)[d[2]:d[3]]
        return None

    def all_pkgs(self):
        s = set(self.file_pkgs)
        for d in self.defs:
            s |= d[5]
        return s


_PARSE_CACHE = {}
_PARSE_LOCK = threading.Lock()


def parse(text: str) -> Parsed:
    key = hashlib.sha1(text.encode("utf-8", errors="replace")).hexdigest()
    with _PARSE_LOCK:
        p = _PARSE_CACHE.get(key)
    if p is None:
        p = Parsed(text)
        p.text = p.clean = None  # cached copy keeps only the structure (memory)
        with _PARSE_LOCK:
            _PARSE_CACHE[key] = p
    return p


_OID_PARSE = {}


def parse_oid(git, oid) -> Parsed:
    key = (git.repository, oid)
    p = _OID_PARSE.get(key)
    if p is None:
        p = parse(git.blob(oid))
        _OID_PARSE[key] = p
    return p


def squash(s: str) -> str:
    return re.sub(r"\s+", " ", s or "").strip()


class Index:
    """Name -> defining paths, and basename -> paths, over the usable HDL files of one commit."""

    def __init__(self, git: Git, commit: str):
        self.git, self.commit = git, commit
        self.tree = git.tree(commit)
        self.defs = collections.defaultdict(list)   # name -> [(kind, path)]
        self.by_base = collections.defaultdict(list)  # basename -> [path]
        for path, oid in self.tree.items():
            if not path.endswith(HDL_EXT):
                continue
            self.by_base[path.rsplit("/", 1)[-1]].append(path)
            if excluded_path(path) or not path.endswith(SRC_EXT):
                continue
            p = parse_oid(git, oid)
            for kind, name, *_ in p.defs:
                self.defs[name].append((kind, path))

    def text(self, path):
        oid = self.tree.get(path)
        return None if oid is None else self.git.blob(oid)


_INDEX_CACHE = {}
_INDEX_LOCK = threading.Lock()


def get_index(git: Git, commit: str) -> Index:
    key = (git.repository, commit)
    with _INDEX_LOCK:
        if key not in _INDEX_CACHE:
            _INDEX_CACHE[key] = Index(git, commit)
        return _INDEX_CACHE[key]


def common_prefix_len(a: str, b: str) -> int:
    pa, pb = a.split("/"), b.split("/")
    n = 0
    for x, y in zip(pa, pb):
        if x != y:
            break
        n += 1
    return n


def pick_path(cands, near, prefer=()):
    """Choose among candidate paths: preferred (patched) first, then closest to `near`."""
    cands = sorted(set(cands))
    for p in prefer:
        if p in cands:
            return p

    def key(p):
        return (-common_prefix_len(p, near), "top_" in p, "vendor" in p, len(p), p)
    return sorted(cands, key=key)[0]


# --------------------------------------------------------------------------- closure

class Closure:
    """Files needed to elaborate `top` at one commit.  entries: path -> role (src|pkg|inc|shim)."""

    def __init__(self):
        self.entries = {}       # repo path (or shim key) -> role
        self.inc_names = {}     # repo path -> include string used
        self.shims = {}         # shim key -> (text, source path)
        self.unresolved = set()
        self.pkg_deps = collections.defaultdict(set)  # pkg path -> pkg paths it uses


def resolve_closure(idx: Index, top: str, top_path: str, texts: dict, prefer=()) -> Closure:
    """texts: path -> text override (patched files at this commit). prefer: paths to pick first."""
    cl = Closure()

    local, near = {}, {}

    def text_of(path):
        if path in local:
            return local[path]
        if path in texts:
            return texts[path]
        return idx.text(path)

    def def_path(name, near, kinds):
        cands = [p for k, p in idx.defs.get(name, []) if k in kinds]
        cands += [p for p, t in texts.items() if t is not None and name in parse(t).names(kinds)]
        if not cands:
            return None
        return pick_path(cands, near, prefer)

    pkg_of_path = {}
    done_mods, done_files = set(), set()
    stack = [("mod", top, top_path)]
    while stack:
        kind, name, path = stack.pop()
        if kind == "mod":
            if name in done_mods:
                continue
            done_mods.add(name)
        txt = text_of(path)
        if txt is None:
            cl.unresolved.add(name)
            continue
        p = parse(txt)
        role = "pkg" if kind == "pkg" else "src"
        here = near.get(path, path)
        if path not in cl.entries:
            cl.entries[path] = role
        if path not in done_files:
            done_files.add(path)
            for inc in p.includes:
                base = inc.rsplit("/", 1)[-1]
                cands = [c for c in idx.by_base.get(base, []) if c.endswith(inc)]
                if not cands:
                    cl.unresolved.add("`include " + inc)
                    continue
                ip = pick_path(cands, here, prefer)
                if ip not in cl.entries:
                    cl.entries[ip] = "inc"
                    cl.inc_names[ip] = inc
                    # included files may include more
                    stack.append(("inc", inc, ip))
            for pk in sorted(p.all_pkgs()):
                pp = def_path(pk, here, ("package",))
                if pp is None:
                    if pk not in ("std", "$unit"):
                        cl.unresolved.add(pk + "::")
                    continue
                if kind == "pkg":
                    if pp != path:
                        cl.pkg_deps[path].add(pp)
                if pp not in done_files:
                    stack.append(("pkg", pk, pp))
            if kind in ("pkg", "inc"):
                continue
        if kind != "mod":
            continue
        for d in p.defs:
            if d[1] != name:
                continue
            for inst in sorted(d[4]):
                if inst == name or inst in done_mods:
                    continue
                ipth = def_path(inst, here, ("module", "interface"))
                if ipth is None:
                    m = re.match(r"^prim_(\w+)$", inst)
                    gen = def_path("prim_generic_" + m.group(1), here, ("module",)) if m else None
                    if gen is None:
                        continue  # not a module (a type or function) or genuinely missing
                    key = "primgen:" + inst
                    if key not in cl.shims:
                        gtxt = text_of(gen)
                        shim = re.sub(r"\bprim_generic_%s\b" % re.escape(m.group(1)), inst, gtxt)
                        cl.shims[key] = (shim, gen)
                        local[key] = shim
                        cl.entries[key] = "shim"
                        near[key] = gen
                        stack.append(("mod", inst, key))
                    continue
                stack.append(("mod", inst, ipth))
    return cl


def topo_packages(pkgs, deps):
    order, seen, onstack = [], set(), set()

    def visit(p):
        if p in seen or p in onstack:
            return
        onstack.add(p)
        for d in sorted(deps.get(p, ())):
            if d in pkgs:
                visit(d)
        onstack.discard(p)
        seen.add(p)
        order.append(p)
    for p in sorted(pkgs):
        visit(p)
    return order


# --------------------------------------------------------------------------- normalization

IMPORT_ITEM = r"\s*import\s+[A-Za-z_]\w*\s*::\s*(?:\*|[A-Za-z_]\w*)(?:\s*,\s*[A-Za-z_]\w*\s*::\s*(?:\*|[A-Za-z_]\w*))*\s*;"


def hoist_imports(text: str):
    """Move module-header and module-level imports to file scope before the module. Returns (text, n)."""
    clean = blank_comments(text)
    edits = []  # (start, end, replacement) on the original text; insertions keyed at module start
    inserts = collections.defaultdict(list)
    for m in re.finditer(r"\b(module|interface)\s+(?:automatic\s+|static\s+)?([A-Za-z_]\w*)", clean):
        mstart = m.start()
        if clean[max(0, mstart - 8):mstart].strip().endswith("virtual"):
            continue
        endkw = "endmodule" if m.group(1) == "module" else "endinterface"
        em = re.search(r"\b%s\b" % endkw, clean[m.end():])
        if not em:
            continue
        mend = m.end() + em.start()
        # header imports right after the name
        pos = m.end()
        hm = re.compile(IMPORT_ITEM).match(clean, pos)
        while hm:
            edits.append((hm.start(), hm.end()))
            inserts[mstart].append(text[hm.start():hm.end()].strip())
            pos = hm.end()
            hm = re.compile(IMPORT_ITEM).match(clean, pos)
        # module-level imports (depth 0 w.r.t. begin/end, function, task)
        body = clean[pos:mend]
        depth = 0
        for tm in re.finditer(r"\b(begin|end|function|endfunction|task|endtask|class|endclass)\b|"
                              r"(?P<imp>(?<![\w:])import\s+[A-Za-z_]\w*\s*::[^;]*;)", body):
            w = tm.group(1)
            if w in ("begin", "function", "task", "class"):
                depth += 1
            elif w in ("end", "endfunction", "endtask", "endclass"):
                depth = max(0, depth - 1)
            elif tm.group("imp") and depth == 0:
                s, e = pos + tm.start("imp"), pos + tm.end("imp")
                if clean[s:e].count('"'):
                    continue  # DPI import
                edits.append((s, e))
                inserts[mstart].append(squash(text[s:e]))
    if not edits:
        return text, 0
    out, last = [], 0
    points = sorted([(s, e, None) for s, e in edits] + [(k, k, v) for k, v in inserts.items()],
                    key=lambda x: (x[0], x[2] is None))
    for s, e, ins in points:
        out.append(text[last:s])
        if ins is not None:
            # keep the module keyword's indentation / line: put imports on their own lines before it
            uniq = list(dict.fromkeys(ins))
            out.append("\n".join(uniq) + "\n")
        else:
            out.append(" " * 0)
        last = e
    out.append(text[last:])
    return "".join(out), len(edits)


STATIC_ASSERT_MACROS = ("ASSERT_STATIC_IN_PACKAGE", "ASSERT_STATIC_LINT_ERROR")


def dummy_asserts(text: str):
    """In prim_assert.sv, make every tool take the dummy-macros branch. Returns (text, changed).

    The static-assertion macros (defined outside that branch) expand to code Yosys cannot parse,
    so they are redefined as empty at the end of the file."""
    extra = ""
    for m in STATIC_ASSERT_MACROS:
        mm = re.search(r"`define\s+%s\s*(\([^)]*\))" % m, text)
        if mm:
            extra += "`undef %s\n`define %s%s\n" % (m, m, mm.group(1))
    if extra:
        text = text.rstrip("\n") + "\n// Added by the task converter: static assertions are empty.\n" + extra
    new = re.sub(r"(?m)^(\s*)`ifdef\s+VERILATOR\b", r"\1`ifndef RTLBENCH_REAL_ASSERTIONS", text, count=1)
    if new != text or extra:
        return new, True
    # older layouts: `if defined(VERILATOR) || defined(SYNTHESIS) ...` (no `if in SV); fall back to SYNTHESIS guard
    new = re.sub(r"(?m)^(\s*)`ifdef\s+SYNTHESIS\b", r"\1`ifndef RTLBENCH_REAL_ASSERTIONS", text, count=1)
    return new, new != text


def package_typedefs(text: str) -> dict:
    """{package name: set of typedef names declared at package scope} for one file."""
    out = {}
    if text is None:
        return out
    toks = tokenize(blank_comments(text))
    i, n = 0, len(toks)
    while i < n:
        if toks[i][0] == "package" and i + 1 < n and IDENT_RE.match(toks[i + 1][0]):
            name, names = toks[i + 1][0], set()
            j, depth = i + 2, 0
            while j < n and toks[j][0] != "endpackage":
                t = toks[j][0]
                if t in ("function", "task"):
                    closer = "end" + t
                    while j < n and toks[j][0] != closer:
                        j += 1
                elif t == "typedef":
                    k, d, last = j + 1, 0, None
                    while k < n:
                        tk = toks[k][0]
                        if tk in OPEN:
                            d += 1
                        elif tk in (")", "]", "}"):
                            d -= 1
                        elif d == 0 and tk == ";":
                            break
                        elif d == 0 and IDENT_RE.match(tk) and tk not in KEYWORDS:
                            last = tk
                        k += 1
                    if last:
                        names.add(last)
                    j = k
                j += 1
            out[name] = names
            i = j
        i += 1
    return out


def qualify_types(text: str, typedefs: dict):
    """Rewrite bare uses of typedef names that come from `import P::*;` as `P::name`.

    Yosys resolves `P::type` but not wildcard-imported type names. Returns (text, n_rewrites)."""
    if text is None:
        return text, 0
    clean = blank_comments(text)
    imported = re.findall(r"\bimport\s+([A-Za-z_]\w*)\s*::\s*\*", clean)
    owner = {}
    for pk in dict.fromkeys(imported):
        for nm in typedefs.get(pk, ()):
            owner[nm] = None if (nm in owner and owner[nm] != pk) else pk
    owner = {k: v for k, v in owner.items() if v}
    if not owner:
        return text, 0
    # names this file declares itself (local typedefs / type parameters) stay as they are
    local = set()
    for pkg_names in package_typedefs(text).values():
        local |= pkg_names
    for m in re.finditer(r"\btypedef\b[^;]*?\b([A-Za-z_]\w*)\s*(?:\[[^;\]]*\]\s*)*;", clean):
        local.add(m.group(1))
    for m in re.finditer(r"\btype\s+([A-Za-z_]\w*)", clean):
        local.add(m.group(1))
    toks = tokenize(clean)
    edits = []
    for k, (t, s0, e0) in enumerate(toks):
        if t in owner and t not in local:
            prev = toks[k - 1][0] if k else ""
            if prev in ("::", ".", "`", "typedef"):
                continue
            edits.append((s0, e0, owner[t] + "::" + t))
    if not edits:
        return text, 0
    out, last = [], 0
    for s0, e0, rep in edits:
        out.append(text[last:s0])
        out.append(rep)
        last = e0
    out.append(text[last:])
    return "".join(out), len(edits)


def normalize(path: str, text: str, notes: set):
    if text is None:
        return None
    t, n = hoist_imports(text)
    if n:
        notes.add("import_hoist")
    if path.rsplit("/", 1)[-1] == "prim_assert.sv":
        t, ch = dummy_asserts(t)
        if ch:
            notes.add("assert_dummy")
    return t


# --------------------------------------------------------------------------- tool checks

def iverilog_compiles(tree: dict, top: str, timeout=ELAB_TIMEOUT):
    with tempfile.TemporaryDirectory(prefix="t3_iv_") as td:
        rtltask.write_tree(td, rtltask.rtl_only(tree))
        files = rtltask.hdl_files(td)
        cmd = [rtltask.IVERILOG, "-g2012", "-s", top, "-o", os.path.join(td, "a.vvp")]
        cmd += ["-I" + d for d in rtltask.include_dirs(td, files)]
        cmd += [str(f) for f in files]
        rc, out = rtltask.run(cmd, cwd=td, timeout=timeout)
        if rc is None:
            return False, "iverilog timeout"
        return rc == 0, rtltask._error_excerpt(out, iverilog=True)


def yosys_check(tree: dict, top: str):
    """(ok, ports or error). ports = [(name, dir, width)]."""
    try:
        ports, _, _ = rtltask.yosys_ports(tree, top, ELAB_TIMEOUT)
    except rtltask.TaskError as e:
        return False, str(e)
    ok, err = rtltask.yosys_elaborates(tree, top, ELAB_TIMEOUT)
    if not ok:
        return False, err
    return True, ports


def base_vs_head(base_tree, head_tree, top, timeout=BASE_VS_HEAD_TIMEOUT):
    task = {"task_id": "probe", "top_module": top, "files": {}, "editable": [],
            "hidden": {"reference_files": head_tree, "reference_top": top,
                       "formal": dict(DEFAULT_FORMAL, timeout_s=timeout)}}
    status, detail = rtltask.formal_check(task, base_tree, top)
    return status, detail


# --------------------------------------------------------------------------- spec

HTML_TAGS = r"(?:br|p|div|span|details|summary|b|i|em|strong|sub|sup|table|thead|tbody|tr|td|th|ul|ol|li|code|pre|hr|h[1-6]|font|center|kbd|picture|source|video)"


def clean_issue_body(body: str) -> str:
    body = (body or "").replace("\r\n", "\n").replace("\r", "\n")
    parts = re.split(r"(```.*?(?:```|\Z))", body, flags=re.S)
    out = []
    for k, part in enumerate(parts):
        if k % 2 == 1:  # fenced code block: keep as is
            out.append(part)
            continue
        s = re.sub(r"<!--.*?-->", "", part, flags=re.S)
        s = re.sub(r"!\[[^\]]*\]\([^)]*\)", "", s)                 # markdown images
        s = re.sub(r"<img\b[^>]*>", "", s, flags=re.I)              # html images
        s = re.sub(r"<a\b[^>]*>(.*?)</a>", r"\1", s, flags=re.I | re.S)
        s = re.sub(r"<br\s*/?>", "\n", s, flags=re.I)
        s = re.sub(r"</?%s\b[^>]*>" % HTML_TAGS, "", s, flags=re.I)
        s = re.sub(r"(?m)^\s*https://user-images\.githubusercontent\.com/\S+\s*$", "", s)
        s = re.sub(r"(?m)^\s*https://github\.com/[^/\s]+/[^/\s]+/assets/\S+\s*$", "", s)
        s = s.replace("&nbsp;", " ").replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&")
        out.append(s)
    text = "".join(out)
    text = re.sub(r"[ \t]+\n", "\n", text)
    text = re.sub(r"\n{3,}", "\n\n", text).strip()
    return text or "(The issue has no description beyond its title.)"


def write_spec(case, top, layout, editable, readonly, notes):
    repo = case["repository"]
    title = (case.get("issue_info") or {}).get("title") or "(untitled)"
    body = clean_issue_body((case.get("issue_info") or {}).get("body"))
    ed_lines = ["| `%s` | `%s` |" % (layout[p], p) for p in editable if p in layout]
    def repo_col(p):
        if p.startswith("primgen:"):
            return "(stand-in, see below)"
        if p == SYNTH_DEFINE_PATH:
            return "(added: defines SYNTHESIS)"
        return "`%s`" % p
    ro_lines = ["| `%s` | %s |" % (layout[p], repo_col(p)) for p in readonly if p in layout]
    lines = [
        f"# Fix GitHub issue #{case['issue_number']} in `{repo}`",
        "",
        f"This task comes from a real bug report against the open-source repository `{repo}`. "
        f"You get the repository's RTL as it was when the bug was reported (commit "
        f"`{case['base_commit'][:12]}`), trimmed to the files needed to elaborate the module "
        f"`{top}`.",
        "",
        "## Bug report",
        "",
        f"**Title:** {title.strip()}",
        "",
        "**Description:**",
        "",
        body,
        "",
        "## Your job",
        "",
        f"Fix the editable file(s) so that the problem described in the bug report is resolved. "
        f"The design is graded at the module `{top}`.",
        "",
        f"- Do not change the ports of `{top}` (names, directions, widths) or its parameters.",
        "- Make the smallest change that fixes the reported problem. Do not refactor or change "
        "unrelated behavior: everything the report does not mention must keep working exactly as "
        "it does now.",
        "- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).",
        "",
        "## Files",
        "",
        "Editable (path in this task | path in the repository):",
        "",
        "| task path | repository path |",
        "|---|---|",
        *ed_lines,
        "",
    ]
    if ro_lines:
        lines += [
            "Read-only support files (changes to these are discarded at grading):",
            "",
            "| task path | repository path |",
            "|---|---|",
            *ro_lines,
            "",
        ]
    tpaths = [layout[p] for p in list(editable) + list(readonly) if p in layout]
    where = []
    if any(t.startswith("rtl/pkg/") for t in tpaths):
        where.append("Packages are under `rtl/pkg/` with a numeric prefix so that they compile before "
                     "the files that use them.")
    if any(t.startswith("rtl/src/") for t in tpaths):
        where.append("Module files are under `rtl/src/`.")
    if any(layout.get(p, "").count("/") >= 1 and not layout[p].startswith(("rtl/pkg/", "rtl/src/", "rtl/primgen/"))
           and p != SYNTH_DEFINE_PATH for p in readonly + list(editable)):
        where.append("Files that other files `include` sit at their include path under `rtl/`.")
    if any(p.startswith("primgen:") for p in readonly):
        where.append("Files under `rtl/primgen/` stand in for OpenTitan's generated `prim_*` wrappers "
                     "(each is the generic implementation with the module renamed).")
    lines += where
    norm = []
    if "import_hoist" in notes:
        norm.append("`import` statements inside modules were moved to file scope just before the module")
    if "qualify_imported_types" in notes:
        norm.append("type names that came from a wildcard import are written as `pkg::type`")
    if "assert_dummy" in notes:
        norm.append("assertion macros are empty")
    if "define_synthesis" in notes:
        norm.append("`SYNTHESIS` is defined (in `%s`) so every tool compiles the synthesis view"
                    % SYNTH_DEFINE_PATH)
    if norm:
        lines.append("For tool compatibility the files were normalized mechanically, without changing "
                     "behavior: " + "; ".join(norm) + ".")
    lines += [
        "",
        "## Grading",
        "",
        f"Your `{top}` is simulated against the repository's own fix for this issue and checked for "
        "formal equivalence with it. Only behavior at the ports of the top module counts; your code "
        "does not have to match the upstream fix textually.",
    ]
    return "\n".join(lines) + "\n"


# --------------------------------------------------------------------------- license

def classify_license(text: str) -> str:
    t = re.sub(r"\s+", " ", text or "")
    if re.search(r"Solderpad Hardware License,? Version 0\.51|SHL-0\.51", t, re.I):
        return "SHL-0.51"
    if re.search(r"Solderpad Hardware License,? Version 2\.1|SHL-2\.1", t, re.I):
        return "SHL-2.1"
    if re.search(r"Apache License\s*,?\s*Version 2\.0", t, re.I):
        return "Apache-2.0"
    if re.search(r"Open Hardware Description License", t, re.I):
        return "OHDL-1.0"
    if re.search(r"CERN Open Hardware Licence", t, re.I):
        return "CERN-OHL"
    if re.search(r"Permission to use, copy, modify, and(/or)? distribute this software for any purpose", t, re.I):
        return "ISC"
    if re.search(r"Redistribution and use in source and binary forms", t, re.I):
        if re.search(r"Neither the name", t, re.I):
            return "BSD-3-Clause"
        return "BSD-2-Clause"
    if re.search(r"GNU GENERAL PUBLIC LICENSE", t):
        return "GPL"
    if re.search(r"Permission is hereby granted, free of charge", t, re.I):
        return "MIT"
    return "unrecognized"


def repo_license(git: Git, commit: str, patched_texts):
    tree = git.tree(commit)
    root = sorted(p for p in tree if "/" not in p and re.match(r"(?i)^(license|licence|copying)", p))
    out = {"files": {}}
    for p in root:
        out["files"][p] = classify_license(git.blob(tree[p]))
    ids = sorted(set(v for v in out["files"].values() if v != "unrecognized"))
    out["spdx"] = " / ".join(ids) if ids else "unrecognized"
    # per-file SPDX tags in the patched files, when present
    tags = set()
    for t in patched_texts:
        for m in re.finditer(r"SPDX-License-Identifier:\s*([^\s*]+(?:\s+(?:OR|AND|WITH)\s+[^\s*]+)*)", t or ""):
            tags.add(m.group(1).strip())
        if t and re.search(r"Analog Devices.*?(BSD|GNU General Public License)", t[:4000], re.S):
            tags.add("ADI-dual: ADIBSD or GPL-2.0 (per file header)")
    if tags:
        out["file_spdx"] = sorted(tags)
    return out


# --------------------------------------------------------------------------- per case

def rtl_patched(case):
    files = []
    for p in case.get("patches") or []:
        fn = p.get("filename") or ""
        if fn.endswith(HDL_EXT) and fn not in files:
            files.append(fn)
    for fn in case.get("verilog_files") or []:
        if fn.endswith(HDL_EXT) and fn not in files:
            files.append(fn)
    return files


def changed_defs(base_txt, head_txt):
    """Names of modules/interfaces/packages whose text differs (comments/whitespace ignored)."""
    pb = Parsed(base_txt) if base_txt is not None else None
    ph = Parsed(head_txt) if head_txt is not None else None
    out = []
    names = []
    for p in (pb, ph):
        if p:
            for d in p.defs:
                if d[1] not in names:
                    names.append(d[1])
    for nm in names:
        kb = pb.def_text(nm) if pb else None
        kh = ph.def_text(nm) if ph else None
        if squash(kb) != squash(kh):
            kind = next((d[0] for p in (pb, ph) if p for d in p.defs if d[1] == nm), "module")
            out.append((kind, nm, kb is not None, kh is not None))
    return out


def layout_paths(entries_union, roles, inc_names, pkg_order, shims):
    """Map repo path -> task path. See module docstring."""
    layout = {}
    used = set()
    pk_digits = max(2, len(str(len(pkg_order))))
    for i, p in enumerate(pkg_order):
        layout[p] = "rtl/pkg/%0*d_%s" % (pk_digits, i, p.rsplit("/", 1)[-1])
    for p in sorted(entries_union):
        if p in layout:
            continue
        role = roles[p]
        if role == "inc":
            tp = "rtl/" + inc_names[p].lstrip("./")
        elif role == "shim":
            tp = "rtl/primgen/%s.sv" % p.split(":", 1)[1]
        else:
            tp = "rtl/src/" + p.rsplit("/", 1)[-1]
            if tp in used:
                tp = "rtl/src/" + p
        if tp in used:
            tp = "rtl/src/" + p
        used.add(tp)
        layout[p] = tp
    return layout


def ancestors(idx: Index, name: str, depth: int, patched: list):
    """Modules (name, path) that instantiate `name`, breadth-first up to `depth` levels."""
    out, frontier, seen = [], [name], {name}
    for _ in range(depth):
        nxt = []
        for nm in frontier:
            for path, oid in sorted(idx.tree.items()):
                if not path.endswith(SRC_EXT) or (excluded_path(path) and path not in patched):
                    continue
                p = parse_oid(idx.git, oid)
                for d in p.defs:
                    if d[0] == "module" and nm in d[4] and d[1] not in seen:
                        seen.add(d[1])
                        out.append((d[1], path))
                        nxt.append(d[1])
        frontier = nxt
    # patched files first, then shallower, then by name
    return sorted(out, key=lambda x: (x[1] not in patched, out.index(x)))


def build_candidate(git, case, top, top_path, patched, changed, notes_out):
    """Assemble base/head trees for one top. Returns (bundle, None) or (None, reason)."""
    base, head = case["base_commit"], case["head_commit"]
    ib, ih = get_index(git, base), get_index(git, head)
    base_over = {p: git.show(base, p) for p in patched}
    head_over = {p: git.show(head, p) for p in patched}
    if (base_over.get(top_path) if top_path in base_over else ib.text(top_path)) is None:
        return None, "top file absent at base_commit"
    if (head_over.get(top_path) if top_path in head_over else ih.text(top_path)) is None:
        return None, "top file absent at head_commit"
    cb = resolve_closure(ib, top, top_path, base_over, prefer=patched)
    ch = resolve_closure(ih, top, top_path, head_over, prefer=patched)
    roles = {}
    for c in (cb, ch):
        roles.update({k: v for k, v in c.entries.items() if k not in roles})
    inc_names = dict(ch.inc_names)
    inc_names.update(cb.inc_names)
    shims = dict(ch.shims)
    shims.update(cb.shims)
    union = set(roles)
    if len(union) > MAX_FILES:
        return None, "needs %d files (> %d)" % (len(union), MAX_FILES)
    pkgs = {p for p, r in roles.items() if r == "pkg"}
    deps = collections.defaultdict(set)
    for c in (cb, ch):
        for k, v in c.pkg_deps.items():
            deps[k] |= v
    order = topo_packages(pkgs, deps)
    layout = layout_paths(union, roles, inc_names, order, shims)

    notes = set()
    base_tree, head_tree, editable, readonly = {}, {}, [], []
    raw = {}
    for rp in union:
        if rp.startswith("primgen:"):
            raw[rp] = (shims[rp][0], shims[rp][0])
        else:
            raw[rp] = (base_over[rp] if rp in base_over else ib.text(rp),
                       head_over[rp] if rp in head_over else ih.text(rp))
    td_base, td_head = {}, {}
    for rp in pkgs:
        td_base.update(package_typedefs(raw[rp][0]))
        td_head.update(package_typedefs(raw[rp][1]))

    def norm(rp, txt, tds):
        t = normalize(rp if not rp.startswith("primgen:") else shims[rp][1], txt, notes)
        t, nq = qualify_types(t, tds)
        if nq:
            notes.add("qualify_imported_types")
        return t
    for rp in sorted(union, key=lambda p: layout[p]):
        tp = layout[rp]
        if rp.startswith("primgen:"):
            txt = norm(rp, raw[rp][0], td_base)
            base_tree[tp] = head_tree[tp] = txt
            readonly.append(rp)
            notes.add("primgen")
            continue
        bt, ht = norm(rp, raw[rp][0], td_base), norm(rp, raw[rp][1], td_head)
        if bt == ht:
            if bt is None:
                continue
            base_tree[tp] = head_tree[tp] = bt
            readonly.append(rp)
        else:
            if bt is not None:
                base_tree[tp] = bt
            if ht is not None:
                head_tree[tp] = ht
            editable.append(rp)
    if not editable:
        return None, "no file in the closure differs between base and head"
    if any(re.search(r"`(ifn?def|elsif)\s+SYNTHESIS\b", t or "") for t in list(base_tree.values()) + list(head_tree.values())):
        base_tree[SYNTH_DEFINE_PATH] = head_tree[SYNTH_DEFINE_PATH] = SYNTH_DEFINE_TEXT
        layout[SYNTH_DEFINE_PATH] = SYNTH_DEFINE_PATH
        readonly.append(SYNTH_DEFINE_PATH)
        notes.add("define_synthesis")
    notes_out |= notes
    return {
        "top": top, "top_path": top_path, "layout": layout, "base_tree": base_tree,
        "head_tree": head_tree, "editable": editable, "readonly": readonly, "notes": sorted(notes),
        "unresolved": sorted(cb.unresolved | ch.unresolved), "roles": roles,
    }, None


def check_candidate(b, formal=True):
    """Run tool checks. Returns (ok, info dict)."""
    top = b["top"]
    info = {}
    ok, res = yosys_check(b["base_tree"], top)
    if not ok:
        return False, {"stage": "yosys_base", "error": res}
    base_ports = res
    ok, res = yosys_check(b["head_tree"], top)
    if not ok:
        return False, {"stage": "yosys_head", "error": res}
    if [tuple(p) for p in res] != [tuple(p) for p in base_ports]:
        return False, {"stage": "ports_differ", "error": "port list changed by the fix"}
    if any(d == "inout" for _, d, _ in base_ports):
        return False, {"stage": "inout", "error": "top has inout ports (harness does not support them)"}
    if not any(d == "output" for _, d, _ in base_ports):
        return False, {"stage": "no_outputs", "error": "top has no outputs"}
    ok, err = iverilog_compiles(b["base_tree"], top)
    if not ok:
        return False, {"stage": "iverilog_base", "error": err}
    ok, err = iverilog_compiles(b["head_tree"], top)
    if not ok:
        return False, {"stage": "iverilog_head", "error": err}
    ed_base = {b["layout"][p]: b["base_tree"].get(b["layout"][p]) for p in b["editable"]}
    ed_head = {b["layout"][p]: b["head_tree"].get(b["layout"][p]) for p in b["editable"]}
    if ed_base == ed_head:
        return False, {"stage": "identical", "error": "base and head are textually identical"}
    info["ports"] = base_ports
    if formal:
        status, detail = base_vs_head(b["base_tree"], b["head_tree"], top)
        info["base_vs_head"] = status
        if detail:
            info["base_vs_head_detail"] = detail
        if status == "equivalent":
            return False, {"stage": "equivalent", "error": "base and head proven equivalent at this top"}
    else:
        info["base_vs_head"] = "skipped"
    return True, info


def process_case(case, gits, formal=True):
    """Returns (tasks, skip_reason or None, attempts)."""
    git = gits[case["repository"]]
    base, head = case["base_commit"], case["head_commit"]
    attempts = []
    patched_all = rtl_patched(case)
    patched = [p for p in patched_all if not excluded_path(p) or p.startswith("examples/")]
    patched = [p for p in patched if not re.search(r"(^|/)(dv|tb|fpv|formal)(/|$)", p)]
    if not patched:
        return [], "no synthesizable RTL among the patched files", attempts
    # changed module-like definitions, per patched file
    cands, pkg_only = [], True
    seen = set()
    for p in patched:
        bt, ht = git.show(base, p), git.show(head, p)
        for kind, nm, in_b, in_h in changed_defs(bt, ht):
            if kind == "package":
                continue
            pkg_only = False
            if not (in_b and in_h):
                attempts.append({"top": nm, "stage": "added_or_removed", "error": "module only on one side"})
                continue
            if nm in seen:
                continue
            seen.add(nm)
            cands.append((nm, p))
    # all changed RTL files at the diff level (catches packages / includes outside `patches`)
    diff_changed = git.changed_paths(base, head)
    patched_set = list(dict.fromkeys(patched + [p for p in diff_changed if p.endswith(HDL_EXT)
                                                and not excluded_path(p)]))
    if not cands:
        if pkg_only:
            # the fix only touched packages / includes: try modules in the patched set that use them
            return [], "fix changes only packages/includes or comments, no module body", attempts
        return [], "no changed module present at both commits", attempts

    tasks, tops_done = [], set()
    ib = get_index(git, base)
    for nm, p in cands:
        tried = [(nm, p)]
        found = False
        queue = list(tried)
        anc_loaded = False
        while queue:
            top, tpath = queue.pop(0)
            if top in tops_done:
                found = True
                break
            notes = set()
            bundle, why = build_candidate(git, case, top, tpath, patched_set, None, notes)
            if bundle is None:
                attempts.append({"top": top, "stage": "closure", "error": why})
                ok = False
                info = {"stage": "closure"}
            else:
                ok, info = check_candidate(bundle, formal)
                if not ok:
                    attempts.append({"top": top, **info})
            if ok:
                bundle["check"] = info
                bundle["for_changed_module"] = nm
                tasks.append(bundle)
                tops_done.add(top)
                found = True
                break
            # escalate to ancestors only when the failure is about this top (ports / elaboration)
            if not anc_loaded and info.get("stage") in ("ports_differ", "yosys_base", "yosys_head",
                                                        "iverilog_base", "iverilog_head", "no_outputs",
                                                        "closure", "inout"):
                anc_loaded = True
                for a in ancestors(ib, nm, MAX_ANCESTOR_DEPTH, patched_set)[:4]:
                    if a[0] not in [q[0] for q in queue] and a[0] != top:
                        queue.append(a)
        if not found:
            pass
    if not tasks:
        stages = collections.Counter(a.get("stage") for a in attempts)
        return [], "no qualifying top (%s)" % ", ".join("%s x%d" % kv for kv in stages.most_common()), attempts
    return tasks, None, attempts


def make_task(case, b, n_tasks, lic):
    suffix = "__" + b["top"] if n_tasks > 1 else ""
    task_id = "rtl-benchls/task3/%s%s" % (case["task_id"], suffix)
    layout = b["layout"]
    editable_paths = [layout[p] for p in b["editable"]]
    files = {tp: txt for tp, txt in b["base_tree"].items()}
    reference = {layout[p]: b["head_tree"][layout[p]] for p in b["editable"] if layout[p] in b["head_tree"]}
    spec = write_spec(case, b["top"], layout, b["editable"], b["readonly"], b["notes"])
    issue = case.get("issue_info") or {}
    pr = case.get("pr_info") or {}
    chk = b["check"]
    prov = {
        "source": "rtl-benchls",
        "benchmark_task": "task3_repo_issue",
        "original_task_id": case["task_id"],
        "repository": case["repository"],
        "pr_number": case.get("pr_number"),
        "issue_number": case.get("issue_number"),
        "pr_url": case.get("pr_url"),
        "issue_url": case.get("issue_url"),
        "pr_title": pr.get("title"),
        "issue_title": issue.get("title"),
        "issue_labels": issue.get("labels"),
        "base_commit": case["base_commit"],
        "head_commit": case["head_commit"],
        "base_ref": case.get("base_ref"),
        "lec_status": case.get("lec_status"),
        "additions": case.get("additions"),
        "deletions": case.get("deletions"),
        "upstream_verilog_files": case.get("verilog_files"),
        "top_from_changed_module": b["for_changed_module"],
        "top_is_ancestor": b["for_changed_module"] != b["top"],
        "file_map": {layout[p]: (p if not p.startswith("primgen:") else "generated from " + p.split(":", 1)[1])
                     if p != SYNTH_DEFINE_PATH else "(added by converter)"
                     for p in sorted(layout, key=lambda x: layout[x])},
        "editable_repo_paths": b["editable"],
        "normalizations": b["notes"],
        "unresolved_references": b["unresolved"],
        "base_vs_head": chk.get("base_vs_head"),
        "base_vs_head_detail": chk.get("base_vs_head_detail"),
        "base_vs_head_timeout_s": BASE_VS_HEAD_TIMEOUT,
        "rtl_license": lic,
        "license": dict(METADATA_LICENSE),
        "converter": "harness/convert_rtlbenchls_task3.py",
    }
    return {
        "schema_version": 1,
        "task_id": task_id,
        "suite": "rtl-benchls",
        "kind": "repair",
        "difficulty": "unknown",
        "spec": spec,
        "top_module": b["top"],
        "files": files,
        "editable": editable_paths,
        "tools": list(DEFAULT_TOOLS),
        "limits": dict(DEFAULT_LIMITS),
        "public_tests": None,
        "hidden": {
            "reference_files": reference,
            "reference_top": b["top"],
            "hidden_vectors": {"cycles": HIDDEN_CYCLES, "seed": seed_for(task_id)},
            "formal": dict(DEFAULT_FORMAL),
        },
        "provenance": prov,
    }


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--input", default=str(DEFAULT_INPUT))
    ap.add_argument("--out", default=str(DEFAULT_OUT))
    ap.add_argument("--cache", default=str(DEFAULT_CACHE))
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("--only", nargs="*", help="process only these upstream case ids (output dir is not cleared)")
    ap.add_argument("--no-formal", action="store_true", help="skip the base-vs-head equivalence probe")
    ap.add_argument("--verbose", action="store_true", help="include every failed top attempt in the report")
    args = ap.parse_args(argv)

    data = json.loads(Path(args.input).read_text())
    cases = data["cases"]
    if args.only:
        cases = [c for c in cases if c["task_id"] in set(args.only)]
    out = Path(args.out)
    if not args.only:
        if out.exists():
            shutil.rmtree(out)
    out.mkdir(parents=True, exist_ok=True)

    cache = Path(args.cache).expanduser()
    gits, repo_err = {}, {}
    for repo in sorted({c["repository"] for c in cases}):
        g = Git(cache, repo)
        err = g.ensure_clone()
        if err:
            repo_err[repo] = err
        gits[repo] = g
    commit_err = {}
    for repo, g in gits.items():
        if repo in repo_err:
            continue
        shas = sorted({c[k] for c in cases if c["repository"] == repo for k in ("base_commit", "head_commit")})
        commit_err.update(g.ensure_commits(shas))

    results = {}
    skipped = []

    def run_one(case):
        try:
            return process_case(case, gits, formal=not args.no_formal)
        except Exception as e:  # keep going; report
            return [], "converter error: %s: %s" % (type(e).__name__, e), []

    todo = []
    for c in cases:
        if c["repository"] in repo_err:
            skipped.append((c["task_id"], "repository unavailable: " + repo_err[c["repository"]], []))
        elif c["base_commit"] in commit_err or c["head_commit"] in commit_err:
            skipped.append((c["task_id"], "commit unavailable", []))
        else:
            todo.append(c)

    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as ex:
        futs = {ex.submit(run_one, c): c for c in todo}
        for f in concurrent.futures.as_completed(futs):
            c = futs[f]
            tasks, reason, attempts = f.result()
            results[c["task_id"]] = (tasks, reason, attempts)
            print("[%s] %s" % (c["task_id"], ("%d task(s)" % len(tasks)) if tasks else reason),
                  file=sys.stderr, flush=True)

    lic_cache = {}
    written, by_repo, by_bvh = [], collections.Counter(), collections.Counter()
    seen_ids = set()
    for c in cases:
        if c["task_id"] not in results:
            continue
        tasks, reason, attempts = results[c["task_id"]]
        if not tasks:
            skipped.append((c["task_id"], reason, attempts))
            continue
        g = gits[c["repository"]]
        key = (c["repository"], c["base_commit"])
        patched_texts = [g.show(c["base_commit"], p) for p in rtl_patched(c)]
        if key not in lic_cache:
            lic_cache[key] = repo_license(g, c["base_commit"], [])
        lic = dict(lic_cache[key])
        fl = repo_license(g, c["base_commit"], patched_texts).get("file_spdx")
        if fl:
            lic["file_spdx"] = fl
        for b in tasks:
            t = make_task(c, b, len(tasks), lic)
            if t["task_id"] in seen_ids:
                continue
            seen_ids.add(t["task_id"])
            fname = t["task_id"].replace("/", "__") + ".json"
            (out / fname).write_text(json.dumps(t, indent=2, ensure_ascii=False) + "\n")
            written.append(t["task_id"])
            by_repo[c["repository"]] += 1
            by_bvh[t["provenance"]["base_vs_head"]] += 1
    for g in gits.values():
        g.close()

    reasons = collections.Counter()
    for _, r, _ in skipped:
        reasons[re.sub(r"\(.*\)$", "", r).strip() if r.startswith("no qualifying top") else r] += 1
    cases_with_tasks = len({t.split("/")[2].split("__")[0] for t in written})
    report = {
        "cases": len(cases),
        "cases_with_tasks": cases_with_tasks,
        "tasks_written": len(written),
        "skipped_cases": len(skipped),
        "skip_reasons": dict(reasons.most_common()),
        "tasks_by_repository": dict(by_repo),
        "tasks_by_base_vs_head": dict(by_bvh),
        "skipped": [{"task_id": t, "reason": r, **({"attempts": a} if args.verbose else {})}
                    for t, r, a in skipped],
        "out_dir": str(out),
    }
    print(json.dumps(report, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
