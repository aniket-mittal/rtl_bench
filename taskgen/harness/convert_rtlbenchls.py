#!/usr/bin/env python3
"""Convert RTL-BenchLS Task 2 (masked infilling) into standard task JSONs (schema_version 1).

Input : sources/rtl-benchls/data/masked_designs.jsonl (425 records)
Output: taskgen/build/rtl-benchls/rtl-benchls__task2__<task_id>.json  (kind = "infill")

Standard library only. Idempotent: the output directory is cleared and rewritten on every run.

Why the mask is rebuilt
-----------------------
In the released masked_designs.jsonl, every record's masked file is just the text "[MASKED]" and
`ref_rtl` equals the whole golden design file. The whole design is masked, not one always/assign
block or sub-module as the benchmark describes. Used as shipped, the agent would get no context at
all. So by default (--mask-source rebuild) this script rebuilds the mask the benchmark describes,
working from the golden file and the record's `mask_type` / `mask_index` / `mask_target_module`:

  * block : the candidates are the `always*` blocks and continuous `assign` statements with more than
            20 tokens, in every module reachable from the top module, in source order. The one masked
            is candidates[mask_index] when mask_index is in range, else candidates[mask_index % n].
            (The upstream mask_index does not count blocks the same way; for example, mg_05849 has
            mask_index 5 but only 2 such items. So the chosen block is a deterministic stand-in,
            not the exact upstream choice.)
  * module: the body of `module <mask_target_module>`, between its header `(...);` and `endmodule`,
            is replaced. The header and `endmodule` stay. The target must be the top or reachable
            from it; testbench-only targets are skipped.

Records that cannot be rebuilt are skipped and reported. `--mask-source upstream` emits the
released masked file unchanged (the whole file masked) for every record.

Usage: python3 harness/convert_rtlbenchls.py [--input PATH] [--out DIR] [--mask-source rebuild|upstream]
"""
from __future__ import annotations

import argparse
import collections
import hashlib
import json
import re
import shutil
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
DEFAULT_INPUT = REPO / "sources" / "rtl-benchls" / "data" / "masked_designs.jsonl"
DEFAULT_OUT = REPO / "taskgen" / "build" / "rtl-benchls"

MARKER = "[MASKED]"
MIN_BLOCK_TOKENS = 20  # benchmark: "One always/assign/case block (>20 tokens)"
RELAXED_MIN_TOKENS = 8  # fallback floor when no item clears MIN_BLOCK_TOKENS (recorded in provenance)
LICENSE = {
    "data": "CC-BY-4.0",
    "code": "MIT",
    "upstream": "https://github.com/hkust-zhiyao/RTL-BenchLS",
    "upstream_commit": "5a8d15a",
    "note": "Per sources/README.md: RTL-BenchLS data is CC-BY-4.0, code is MIT.",
}
DEFAULT_TOOLS = ["iverilog", "vvp", "yosys"]
DEFAULT_LIMITS = {"max_agent_steps": 50, "wall_time_s": 1800, "tool_timeout_s": 120}
DEFAULT_FORMAL = {"method": "yosys_sat_tempinduct", "max_steps": 60, "timeout_s": 120, "accept_bounded": True}
HIDDEN_CYCLES = 1000


# --------------------------------------------------------------------------- lexing

def blank_comments(text: str) -> str:
    """Replace comments and string literals with spaces (newlines kept) so offsets stay valid."""
    out = list(text)
    i, n = 0, len(text)
    while i < n:
        c = text[i]
        if text.startswith("//", i):
            j = text.find("\n", i)
            j = n if j < 0 else j
            for k in range(i, j):
                out[k] = " "
            i = j
        elif text.startswith("/*", i):
            j = text.find("*/", i + 2)
            j = n if j < 0 else j + 2
            for k in range(i, j):
                if out[k] != "\n":
                    out[k] = " "
            i = j
        elif c == '"':
            j = i + 1
            while j < n and text[j] != '"' and text[j] != "\n":
                j += 2 if text[j] == "\\" else 1
            j = min(j + 1, n)
            for k in range(i + 1, j - 1):
                out[k] = " "
            i = j
        else:
            i += 1
    return "".join(out)


TOKEN_RE = re.compile(
    r"""
      \\\S+                                   # escaped identifier
    | [`$]?[A-Za-z_][A-Za-z0-9_$]*            # identifier, `macro, $system
    | \d*\s*'[sS]?[bBoOdDhH]\s*[0-9a-fA-FxXzZ?_]+   # based number
    | \d[\d_]*(?:\.\d+)?(?:[eE][+-]?\d+)?    # decimal / real
    | '[01xXzZ]                               # unbased unsized
    | "[^"\n]*"                               # string (already blanked)
    | <<<=|>>>=|===|!==|<<<|>>>|<<=|>>=|==|!=|<=|>=|&&|\|\||<<|>>|\*\*|~&|~\||~\^|\^~|\+:|-:|::|->|\+\+|--
    | [^\s]                                   # any other single char
    """,
    re.X,
)


def tokenize(clean: str):
    """List of (text, start, end) tokens over comment-blanked source."""
    return [(m.group(0), m.start(), m.end()) for m in TOKEN_RE.finditer(clean)]


OPEN = {"(": ")", "[": "]", "{": "}"}


class ParseError(Exception):
    pass


def skip_group(toks, i):
    """toks[i] is an opening bracket; return index after its matching close."""
    if i >= len(toks) or toks[i][0] not in OPEN:
        raise ParseError("expected group")
    depth = 0
    while i < len(toks):
        t = toks[i][0]
        if t in OPEN:
            depth += 1
        elif t in (")", "]", "}"):
            depth -= 1
            if depth == 0:
                return i + 1
        i += 1
    raise ParseError("unbalanced group")


def skip_to_semicolon(toks, i):
    depth = 0
    while i < len(toks):
        t = toks[i][0]
        if t in OPEN:
            depth += 1
        elif t in (")", "]", "}"):
            depth -= 1
        elif t == ";" and depth <= 0:
            return i + 1
        elif depth <= 0 and t in ("end", "endmodule", "endcase", "join"):
            raise ParseError("statement ran into block end")
        i += 1
    raise ParseError("missing ;")


def parse_stmt(toks, i):
    """Return index just after the procedural statement starting at toks[i]."""
    if i >= len(toks):
        raise ParseError("eof")
    t = toks[i][0]
    if t == ";":
        return i + 1
    if t in ("unique", "unique0", "priority"):
        return parse_stmt(toks, i + 1)
    if t == "begin" or t == "fork":
        closers = ("end",) if t == "begin" else ("join", "join_any", "join_none")
        i += 1
        if i < len(toks) and toks[i][0] == ":":
            i += 2
        while i < len(toks) and toks[i][0] not in closers:
            i = parse_stmt(toks, i)
        if i >= len(toks):
            raise ParseError("missing end")
        i += 1
        if i < len(toks) and toks[i][0] == ":":
            i += 2
        return i
    if t in ("case", "casez", "casex", "randcase"):
        depth = 0
        while i < len(toks):
            tt = toks[i][0]
            if tt in ("case", "casez", "casex", "randcase"):
                depth += 1
            elif tt == "endcase":
                depth -= 1
                if depth == 0:
                    return i + 1
            i += 1
        raise ParseError("missing endcase")
    if t == "if":
        i = skip_group(toks, i + 1)
        i = parse_stmt(toks, i)
        if i < len(toks) and toks[i][0] == "else":
            i = parse_stmt(toks, i + 1)
        return i
    if t in ("for", "while", "repeat", "foreach"):
        i = skip_group(toks, i + 1)
        return parse_stmt(toks, i)
    if t == "forever":
        return parse_stmt(toks, i + 1)
    if t == "@":
        i += 1
        if i < len(toks) and toks[i][0] == "(":
            i = skip_group(toks, i)
        else:
            i += 1  # @* or @ident
        return parse_stmt(toks, i)
    if t == "#":
        i += 1
        if i < len(toks) and toks[i][0] == "(":
            i = skip_group(toks, i)
        else:
            i += 1
        return parse_stmt(toks, i)
    return skip_to_semicolon(toks, i)


ALWAYS = ("always", "always_ff", "always_comb", "always_latch")
IDENT_RE = re.compile(r"^(\\\S+|[A-Za-z_][A-Za-z0-9_$]*)$")
NON_INSTANCE = {
    "module", "endmodule", "input", "output", "inout", "wire", "reg", "logic", "bit", "integer", "int",
    "real", "realtime", "time", "event", "genvar", "parameter", "localparam", "defparam", "specparam",
    "tri", "tri0", "tri1", "triand", "trior", "wand", "wor", "supply0", "supply1", "signed", "unsigned",
    "assign", "always", "always_ff", "always_comb", "always_latch", "initial", "final", "function",
    "endfunction", "task", "endtask", "generate", "endgenerate", "begin", "end", "if", "else", "for",
    "case", "casez", "casex", "endcase", "default", "specify", "endspecify", "typedef", "enum", "struct",
    "packed", "import", "export", "byte", "shortint", "longint", "var", "const", "automatic", "static",
    "while", "repeat", "forever", "posedge", "negedge", "or", "fork", "join",
}


def find_modules(toks):
    """[(name, tok_start, tok_header_end, tok_endmodule)] ; header_end = index after header ';'."""
    mods = []
    i = 0
    while i < len(toks):
        if toks[i][0] in ("module", "macromodule"):
            start = i
            j = i + 1
            if j < len(toks) and toks[j][0] in ("automatic", "static"):
                j += 1
            name = toks[j][0] if j < len(toks) else ""
            k = j + 1
            depth = 0
            while k < len(toks):  # header ends at first ';' outside brackets
                tt = toks[k][0]
                if tt in OPEN:
                    depth += 1
                elif tt in (")", "]", "}"):
                    depth -= 1
                elif tt == ";" and depth == 0:
                    break
                k += 1
            hdr_end = k + 1
            e = hdr_end
            while e < len(toks) and toks[e][0] != "endmodule":
                e += 1
            if e >= len(toks):
                break
            mods.append((name, start, hdr_end, e))
            i = e + 1
        else:
            i += 1
    return mods


def find_blocks(toks, lo, hi):
    """Always blocks and continuous assigns among toks[lo:hi] (one module body): [(kind, i0, i1)]."""
    out = []
    i = lo
    while i < hi:
        t = toks[i][0]
        if t in ALWAYS:
            try:
                j = parse_stmt(toks, i + 1)
            except ParseError:
                j = None
            if j is None or j > hi:
                i += 1
                continue
            out.append(("always", i, j))
            i = j
        elif t == "assign":
            try:
                j = skip_to_semicolon(toks, i + 1)
            except ParseError:
                i += 1
                continue
            out.append(("assign", i, j))
            i = j
        elif (t not in NON_INSTANCE and IDENT_RE.match(t) and i + 2 < hi
              and (toks[i + 1][0] == "#"
                   or (IDENT_RE.match(toks[i + 1][0]) and toks[i + 1][0] not in NON_INSTANCE
                       and toks[i + 2][0] in ("(", "[")))):
            try:  # module / gate instance: `Type [#(...)] name [range] (...) {, name (...)};`
                j = skip_to_semicolon(toks, i + 1)
            except ParseError:
                i += 1
                continue
            out.append(("instance", i, j))
            i = j
        elif t in ("function", "task", "initial", "final"):
            if t in ("initial", "final"):
                try:
                    i = parse_stmt(toks, i + 1)
                except ParseError:
                    i += 1
                continue
            closer = "endfunction" if t == "function" else "endtask"
            while i < hi and toks[i][0] != closer:
                i += 1
            i += 1
        else:
            i += 1
    return out


def instantiated(toks, lo, hi, names):
    """Module names (from `names`) instantiated in toks[lo:hi]."""
    found = set()
    for i in range(lo, hi - 1):
        t = toks[i][0]
        if t in names:  # `Mod #(...) inst (...)` or `Mod inst (...)`
            nxt = toks[i + 1][0]
            if nxt == "#" or re.match(r"^(\\\S+|[A-Za-z_][A-Za-z0-9_$]*)$", nxt):
                found.add(t)
    return found


def reachable_modules(toks, mods, top):
    by_name = {m[0]: m for m in mods}
    names = set(by_name)
    seen, stack = set(), [top]
    while stack:
        m = stack.pop()
        if m in seen or m not in by_name:
            continue
        seen.add(m)
        _, _, h, e = by_name[m]
        stack.extend(instantiated(toks, h, e, names - {m}))
    return seen


# --------------------------------------------------------------------------- masking

def rebuild_mask(golden: str, rec: dict):
    """Return (masked_text, info) or raise ValueError(reason)."""
    if MARKER in golden:
        raise ValueError("golden design already contains the [MASKED] marker text")
    clean = blank_comments(golden)
    toks = tokenize(clean)
    mods = find_modules(toks)
    if not mods:
        raise ValueError("no module definitions found in golden design")
    top = rec["top_module"]
    names = [m[0] for m in mods]
    if top not in names:
        raise ValueError(f"top module {top!r} not defined in golden design file")
    reach = reachable_modules(toks, mods, top)

    if rec["mask_type"] == "module":
        tgt = rec.get("mask_target_module")
        if not tgt:
            raise ValueError("module mask without mask_target_module")
        if tgt not in names:
            raise ValueError(f"mask_target_module {tgt!r} is not defined in the design file")
        if tgt not in reach:
            raise ValueError(f"mask_target_module {tgt!r} is not reachable from top {top!r} (e.g. a testbench)")
        _, _, h, e = next(m for m in mods if m[0] == tgt)
        if h >= e:
            raise ValueError(f"module {tgt!r} has an empty body")
        s = toks[h - 1][2]            # just after header ';'
        en = toks[e][1]               # start of 'endmodule'
        region = golden[s:en]
        masked = golden[:s] + "\n" + MARKER + "\n" + golden[en:]
        info = {"method": "module_body", "target_module": tgt, "region_chars": len(region),
                "region_tokens": e - h, "target_is_top": tgt == top}
        return masked, info, region

    items = [(name, kind, i0, i1) for name, _, h, e in mods if name in reach
             for kind, i0, i1 in find_blocks(toks, h, e)]
    cands = [c for c in items if c[3] - c[2] > MIN_BLOCK_TOKENS]
    relaxed = False
    if not cands:  # our lexer counts fewer tokens than the benchmark's tokenizer; relax the size floor
        cands = [c for c in items if c[3] - c[2] >= RELAXED_MIN_TOKENS]
        relaxed = True
    if not cands:
        raise ValueError(f"no always/assign/instance item with >={RELAXED_MIN_TOKENS} tokens "
                         "in modules reachable from top")
    idx = rec.get("mask_index") or 0
    pick = idx if idx < len(cands) else idx % len(cands)
    name, kind, i0, i1 = cands[pick]
    s, en = toks[i0][1], toks[i1 - 1][2]
    region = golden[s:en]
    masked = golden[:s] + MARKER + golden[en:]
    info = {"method": "block_index", "candidate_index": pick, "n_candidates": len(cands),
            "index_in_range": idx < len(cands), "block_kind": kind, "in_module": name,
            "region_tokens": i1 - i0, "region_chars": len(region),
            "min_tokens": RELAXED_MIN_TOKENS if relaxed else MIN_BLOCK_TOKENS + 1, "threshold_relaxed": relaxed}
    return masked, info, region


# --------------------------------------------------------------------------- conversion

def defined_modules(text: str) -> set[str]:
    return {m[0] for m in find_modules(tokenize(blank_comments(text)))}


def undefined_instances(text: str, top: str) -> set[str]:
    """Types instantiated by modules reachable from `top` (caller subtracts the defined modules)."""
    toks = tokenize(blank_comments(text))
    mods = find_modules(toks)
    reach = reachable_modules(toks, mods, top)
    types = set()
    for name, _, h, e in mods:
        if name not in reach:
            continue
        for kind, i0, _ in find_blocks(toks, h, e):
            if kind == "instance":
                types.add(toks[i0][0])
    return types


def seed_for(task_id: str) -> int:
    return int(hashlib.sha256(task_id.encode()).hexdigest()[:8], 16) % (2 ** 31)


def design_path(golden_key: str) -> str:
    name = golden_key
    if name.endswith("_combined.v"):
        name = name[: -len("_combined.v")] + ".v"
    return "rtl/" + name


def write_spec(rec, dpath, lib_path, info, mode):
    top = rec["top_module"]
    lines = [
        f"# Fill in the masked region of `{rec['parent_design']}`",
        "",
        f"The file `{dpath}` holds a Verilog design whose top module is `{top}` "
        f"({rec['design_type']}). Part of the design was removed, and the text `{MARKER}` "
        f"appears exactly once in its place. That marker is the literal string `{MARKER}` "
        f"(square brackets included), not a comment.",
        "",
        f"**Your job:** replace `{MARKER}` with Verilog so the whole design again does what it is "
        "evidently meant to do. Work out the missing logic from the rest of the code: the port "
        "list, the declared signals, how those signals are used elsewhere, the module and "
        "signal names, and any comments.",
        "",
        "## What was masked",
        "",
    ]
    if mode == "upstream":
        lines += [
            f"- Mask type in the benchmark: **{rec['mask_type']}**.",
            "- In this release the **entire design file** was masked, so the file contains only "
            f"`{MARKER}`. Write the whole design, with the top module `{top}` and its ports exactly "
            "as given in the interface section of this task.",
        ]
    elif rec["mask_type"] == "module":
        tgt = info["target_module"]
        where = "the top module" if info["target_is_top"] else "a sub-module"
        lines += [
            f"- Mask type: **module**. The body of `module {tgt}` ({where}) was removed. Its header "
            f"(`module {tgt} ... );`) and its `endmodule` are still in place. `{MARKER}` stands for "
            "everything in between: port direction and width declarations (for a non-ANSI header), "
            "internal signals, and logic.",
        ]
        if not info["target_is_top"]:
            lines.append(f"- See how `{tgt}` is instantiated elsewhere in the design. Its port "
                         "connections and parameters show what it must compute.")
    else:
        kind = {"always": "an `always` block", "assign": "a continuous `assign` statement",
                "instance": "a module (or gate) instantiation statement"}[info["block_kind"]]
        lines += [
            f"- Mask type: **block**. One complete module item, {kind} in module "
            f"`{info['in_module']}`, was replaced by `{MARKER}`. Write that one item, with the "
            "same kind of construct, in its place.",
        ]
    lines += [
        f"- Design type: {rec['design_type']}. Origin: {rec.get('origin', 'unknown')}.",
        "",
        "## Rules",
        "",
        f"- Edit only `{dpath}`. When you are done it must not contain `{MARKER}`.",
        "- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep "
        "the rest of the file as it is. You may declare new internal signals if you need them.",
        "- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or "
        "SystemVerilog only where the file already uses SystemVerilog constructs.",
    ]
    if lib_path:
        lines.append(f"- `{lib_path}` holds the support modules the design instantiates. It is read-only.")
    lines += [
        "",
        f"## Grading",
        "",
        f"Your completed `{top}` is simulated against the original design and checked for formal "
        "equivalence with it. Only behavior at the top-module ports counts. The code does not "
        "have to match the original text.",
    ]
    return "\n".join(lines) + "\n"


def convert(rec, mode, task_prefix="rtl-benchls/task2"):
    """Return (task_dict, None) or (None, skip_reason).

    `task_prefix` lets other converters (convert_rtlbenchls_task1.py) reuse this code path."""
    files = rec.get("files") or {}
    gkey, mkey = rec.get("golden_rtl_key"), rec.get("masked_rtl_key")
    if gkey not in files:
        return None, f"golden_rtl_key {gkey!r} missing from files"
    golden = files[gkey]
    dpath = design_path(gkey)

    if mode == "upstream":
        if mkey not in files:
            return None, f"masked_rtl_key {mkey!r} missing from files"
        masked = files[mkey]
        if masked.count(MARKER) != 1:
            return None, f"masked file has {masked.count(MARKER)} {MARKER} markers"
        info = {"method": "upstream", "upstream_masks_whole_file": masked.strip() == MARKER}
    else:
        try:
            masked, info, _region = rebuild_mask(golden, rec)
        except ValueError as e:
            return None, str(e)

    # lib.v: only when it defines modules the design file does not already define.
    lib = files.get("lib.v")
    lib_path = None
    lib_note = "absent"
    if lib is not None:
        lib_mods = defined_modules(lib)
        extra = lib_mods - defined_modules(golden)
        if not lib_mods:
            lib_note = "trivial (no modules)"
        elif not extra:
            lib_note = "redundant (all modules already in design file)"
        else:
            lib_path = "rtl/lib.v"
            lib_note = "included"

    known = defined_modules(golden) | (defined_modules(lib) if lib_path else set())
    undefined = sorted(undefined_instances(golden, rec["top_module"]) - known)

    task_id = f"{task_prefix}/{rec['task_id']}"
    starter = {dpath: masked}
    reference = {dpath: golden}
    if lib_path:
        starter[lib_path] = lib
        reference[lib_path] = lib

    sources = None
    if "sources.json" in files:
        try:
            sources = json.loads(files["sources.json"])
        except json.JSONDecodeError:
            sources = {"unparsed": files["sources.json"]}

    used = {gkey, mkey, "lib.v", "sources.json"}
    dropped = sorted(k for k in files if k not in used)

    task = {
        "schema_version": 1,
        "task_id": task_id,
        "suite": "rtl-benchls",
        "kind": "infill",
        "difficulty": "unknown",
        "spec": write_spec(rec, dpath, lib_path, info, mode),
        "top_module": rec["top_module"],
        "files": starter,
        "editable": [dpath],
        "tools": list(DEFAULT_TOOLS),
        "limits": dict(DEFAULT_LIMITS),
        "public_tests": None,
        "hidden": {
            "reference_files": reference,
            "reference_top": rec["top_module"],
            "hidden_vectors": {"cycles": HIDDEN_CYCLES, "seed": seed_for(task_id)},
            "formal": dict(DEFAULT_FORMAL),
        },
        "provenance": {
            "source": "rtl-benchls",
            "benchmark_task": "task2_mask_infilling",
            "original_task_id": rec["task_id"],
            "parent_design": rec.get("parent_design"),
            "origin": rec.get("origin"),
            "origin_bucket": rec.get("origin_bucket"),
            "loc": rec.get("loc"),
            "design_type": rec.get("design_type"),
            "mask_type": rec.get("mask_type"),
            "mask_index": rec.get("mask_index"),
            "mask_target_module": rec.get("mask_target_module"),
            "mask_source": mode,
            "mask_reconstruction": info,
            "upstream_ref_rtl_sha256": hashlib.sha256((rec.get("ref_rtl") or "").encode()).hexdigest(),
            "upstream_golden_rtl_key": gkey,
            "upstream_masked_rtl_key": mkey,
            "upstream_verification": {
                "tool": rec.get("verification_tool"),
                "type": rec.get("verification_type"),
                "primary_script_key": rec.get("primary_script_key"),
            },
            "lib_v": lib_note,
            "undefined_modules": undefined,  # instantiated under the top but defined nowhere in the task (vendor cells etc.)
            "dropped_files": dropped,
            "description": None,  # the benchmark builds descriptions at run time with an LLM; none is shipped
            "sources": sources,
            "license": dict(LICENSE),
            "converter": "harness/convert_rtlbenchls.py",
        },
    }
    return task, None


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--input", default=str(DEFAULT_INPUT))
    ap.add_argument("--out", default=str(DEFAULT_OUT))
    ap.add_argument("--mask-source", choices=("rebuild", "upstream"), default="rebuild")
    args = ap.parse_args(argv)

    out = Path(args.out)
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)

    counts = collections.Counter()
    by_mask, by_dtype, by_both = collections.Counter(), collections.Counter(), collections.Counter()
    skipped = []
    seen = set()
    with open(args.input) as f:
        for line in f:
            if not line.strip():
                continue
            rec = json.loads(line)
            counts["records"] += 1
            if rec["task_id"] in seen:
                skipped.append((rec["task_id"], "duplicate task_id"))
                continue
            seen.add(rec["task_id"])
            task, reason = convert(rec, args.mask_source)
            if task is None:
                skipped.append((rec["task_id"], reason))
                continue
            fname = task["task_id"].replace("/", "__") + ".json"
            (out / fname).write_text(json.dumps(task, indent=2) + "\n")
            counts["written"] += 1
            if task["provenance"]["undefined_modules"]:
                counts["with_undefined_modules"] += 1
            if (task["provenance"]["mask_reconstruction"] or {}).get("threshold_relaxed"):
                counts["threshold_relaxed"] += 1
            by_mask[rec["mask_type"]] += 1
            by_dtype[rec["design_type"]] += 1
            by_both[(rec["mask_type"], rec["design_type"])] += 1

    report = {
        "mask_source": args.mask_source,
        "records": counts["records"],
        "written": counts["written"],
        "skipped": len(skipped),
        "written_with_undefined_modules": counts["with_undefined_modules"],
        "written_with_relaxed_block_threshold": counts["threshold_relaxed"],
        "by_mask_type": dict(by_mask),
        "by_design_type": dict(by_dtype),
        "by_mask_and_design_type": {f"{a}/{b}": n for (a, b), n in sorted(by_both.items())},
        "skipped_records": [{"task_id": t, "reason": r} for t, r in skipped],
        "out_dir": str(out),
    }
    print(json.dumps(report, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
