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

  * fallback: when no single item reaches 8 tokens (tiny designs), the smallest of (a) a run of consecutive
            `assign` statements totalling >= 8 tokens and (b) the whole body of a reachable module with >= 8
            tokens is masked (`mask_reconstruction.method` = fallback_assign_group / fallback_module_body).

Source clean-up, applied to the golden file and lib.v before masking, so the starter, the reference and lib
stay identical outside the mask (each recorded in provenance):
  * sim_tasks_removed: simulation-only system-task statements ($display, $fwrite, $finish, ...; see
    SIM_TASKS) outside initial blocks, and $finish/$stop anywhere, become `;`; `fd = $fopen(...);` too.
    Yosys rejects or executes them, and $finish ends the vector simulation; none drives an output.
  * testbench_modules_removed: port-less modules unreachable from the top and instantiated by nothing.
  * stdcells: Nangate 45nm / OSU FreePDK45 standard cells the design instantiates but does not define get
    behavioural models (from stdcells.v) in a read-only rtl/stdcells.v. Only cells connected by name to
    ports of the model, without parameters, are used; other undefined cells stay in `undefined_modules`.
    Verilog gate primitives (and, nand, ...) are never counted as undefined.

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
STDCELLS_PATH = Path(__file__).resolve().parent / "stdcells.v"
STDCELLS_FILE = "rtl/stdcells.v"
# Verilog built-in gate primitives: instantiated like modules but never defined, so never "undefined".
VERILOG_PRIMITIVES = {
    "and", "nand", "or", "nor", "xor", "xnor", "buf", "not", "bufif0", "bufif1", "notif0", "notif1",
    "pullup", "pulldown", "tran", "tranif0", "tranif1", "rtran", "rtranif0", "rtranif1",
    "nmos", "pmos", "rnmos", "rpmos", "cmos", "rcmos",
}
# Simulation-only system tasks. Outside `initial`/`final` blocks they either break Yosys ($finish/$stop
# outside initial) or stop/clutter the vector simulation; they never drive a design output.
SIM_TASKS = {
    "$finish", "$stop", "$exit", "$fatal", "$error", "$warning", "$info",
    "$display", "$displayb", "$displayh", "$displayo", "$write", "$writeb", "$writeh", "$writeo",
    "$strobe", "$strobeb", "$strobeh", "$strobeo", "$monitor", "$monitorb", "$monitorh", "$monitoro",
    "$monitoron", "$monitoroff", "$fdisplay", "$fdisplayb", "$fdisplayh", "$fdisplayo", "$fwrite",
    "$fwriteb", "$fwriteh", "$fwriteo", "$fstrobe", "$fmonitor", "$fclose", "$fflush",
    "$dumpfile", "$dumpvars", "$dumpon", "$dumpoff", "$dumpall", "$dumpflush", "$dumplimit",
    "$timeformat", "$printtimescale", "$showvars", "$showscopes",
}


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


# --------------------------------------------------------------------------- source clean-up

STATEMENT_START = {";", "begin", "end", ")", "else", ":", "endcase", "join", "join_any", "join_none",
                   "fork", "forever", "default"}
SIM_FUNCS = {"$fopen", "$fopenr"}  # file-handle functions: the whole `fd = $fopen(...);` statement goes
STOP_TASKS = {"$finish", "$stop", "$exit", "$fatal"}  # these end the simulation, so they go even inside initial


def strip_sim_tasks(text: str):
    """Replace each simulation-only system-task statement (SIM_TASKS) with an empty statement `;`.

    Statements inside `initial`/`final` blocks are kept, except those that end the simulation (STOP_TASKS).
    Only whole statements are touched (the task name must start a statement), so system *functions* used in
    expressions are never edited. Returns (new_text, {task_name: count})."""
    if "$" not in text:
        return text, {}
    toks = tokenize(blank_comments(text))
    protected = []  # token ranges of initial/final blocks
    i = 0
    while i < len(toks):
        if toks[i][0] in ("initial", "final"):
            try:
                j = parse_stmt(toks, i + 1)
            except ParseError:
                j = len(toks)
            protected.append((i, j))
            i = j
        else:
            i += 1
    edits, removed = [], collections.Counter()
    i = 0
    while i < len(toks):
        t = toks[i][0]
        if t not in SIM_TASKS:
            i += 1
            continue
        in_initial = any(a <= i < b for a, b in protected)
        prev = toks[i - 1][0] if i else ";"
        after_delay = i >= 2 and toks[i - 2][0] == "#"
        if (in_initial and t not in STOP_TASKS) or not (prev in STATEMENT_START or after_delay):
            i += 1
            continue
        try:
            j = skip_to_semicolon(toks, i)
        except ParseError:
            i += 1
            continue
        edits.append((toks[i][1], toks[j - 1][2]))
        removed[t] += 1
        i = j
    # `fd = $fopen(...);` (a file handle only the removed $fwrite/$fdisplay calls use): Yosys cannot resolve $fopen
    for i in range(1, len(toks) - 3):
        if (toks[i][0] in SIM_FUNCS and toks[i - 1][0] in ("=", "<=") and IDENT_RE.match(toks[i - 2][0])
                and i >= 3 and toks[i - 3][0] in STATEMENT_START):
            try:
                j = skip_to_semicolon(toks, i)
            except ParseError:
                continue
            if toks[i + 1][0] == "(" and skip_group(toks, i + 1) == j - 1:
                edits.append((toks[i - 2][1], toks[j - 1][2]))
                removed[toks[i][0]] += 1
    edits.sort()
    out = text
    for s, e in reversed(edits):
        out = out[:s] + ";" + out[e:]
    return out, dict(removed)


def header_has_ports(toks, s, h) -> bool:
    """True if the module header toks[s:h] declares a (non-parameter) port list with an identifier in it."""
    hdr = toks[s:h]
    i = 2
    while i < len(hdr):
        if hdr[i][0] == "#" and i + 1 < len(hdr) and hdr[i + 1][0] == "(":
            i = skip_group(hdr, i + 1)
            continue
        if hdr[i][0] == "(":
            j = skip_group(hdr, i)
            return any(IDENT_RE.match(x[0]) for x in hdr[i + 1:j - 1])
        i += 1
    return False


def drop_testbenches(text: str, top: str, other_texts=()):
    """Remove modules without ports that nothing instantiates and that are not reachable from `top`.

    These are testbenches shipped in the design file (delays, `forever`, event controls in `initial`), which
    Yosys cannot parse; they never affect the top module. Returns (new_text, [dropped module names])."""
    toks = tokenize(blank_comments(text))
    mods = find_modules(toks)
    if len(mods) < 2:
        return text, []
    reach = reachable_modules(toks, mods, top)
    if top not in reach:
        return text, []
    names = {m[0] for m in mods}
    used = set()
    for name, _, h, e in mods:
        used |= instantiated(toks, h, e, names - {name})
    for other in other_texts:
        if other:
            ot = tokenize(blank_comments(other))
            used |= instantiated(ot, 0, len(ot), names)
    drop = []
    for name, st, h, e in mods:
        if name in reach or name in used:
            continue
        try:
            if header_has_ports(toks, st, h):
                continue
        except ParseError:
            continue
        drop.append((name, toks[st][1], toks[e][2]))
    out = text
    for _, a, b in reversed(drop):
        out = out[:a] + out[b:]
    return out, [d[0] for d in drop]


_STDCELLS = None


def stdcell_library():
    """{cell name: (module text, [port names])} from stdcells.v (cached)."""
    global _STDCELLS
    if _STDCELLS is None:
        text = STDCELLS_PATH.read_text()
        toks = tokenize(blank_comments(text))
        lib = {}
        for name, st, h, e in find_modules(toks):
            hdr = text[toks[st][1]:toks[h - 1][2]]
            lib[name] = (text[toks[st][1]:toks[e][2]] + "\n",
                         re.findall(r"\b(?:input|output)\s+(?:reg\s+)?(\w+)", hdr))
        _STDCELLS = lib
    return _STDCELLS


def instance_usage(text: str) -> dict:
    """{instantiated type: {"named": port names, "positional": bool, "params": bool}} over all modules."""
    toks = tokenize(blank_comments(text))
    usage = {}
    for _, _, h, e in find_modules(toks):
        for kind, i0, i1 in find_blocks(toks, h, e):
            if kind != "instance":
                continue
            u = usage.setdefault(toks[i0][0], {"named": set(), "positional": False, "params": False})
            k = i0 + 1
            if k < i1 and toks[k][0] == "#":
                u["params"] = True
                k += 1
                if k < i1 and toks[k][0] == "(":
                    k = skip_group(toks, k)
            while k < i1:
                t = toks[k][0]
                if t in ("(", "[", "{"):
                    try:
                        end = skip_group(toks, k)
                    except ParseError:
                        break
                    if t == "(":
                        nxt = toks[k + 1][0] if k + 1 < i1 else ")"
                        if nxt == ".":
                            for m in range(k + 1, end - 2):
                                if toks[m][0] == "." and IDENT_RE.match(toks[m + 1][0]) and toks[m + 2][0] == "(":
                                    u["named"].add(toks[m + 1][0])
                        elif nxt != ")":
                            u["positional"] = True
                    k = end
                else:
                    k += 1
    return usage


def resolve_stdcells(texts, defined: set):
    """Standard cells instantiated in `texts` but defined in none of them.

    Returns ({cell: module text}, {cell: reason not used}). A cell is used only when every instance connects
    ports by name, all of them ports of our model, and overrides no parameters (so it cannot be a different
    library's same-named cell)."""
    lib = stdcell_library()
    usage = {}
    for text in texts:
        for typ, u in instance_usage(text).items():
            m = usage.setdefault(typ, {"named": set(), "positional": False, "params": False})
            m["named"] |= u["named"]
            m["positional"] |= u["positional"]
            m["params"] |= u["params"]
    cells, rejected = {}, {}
    for typ in sorted(usage):
        if typ in defined or typ not in lib:
            continue
        u, ports = usage[typ], lib[typ][1]
        if u["params"]:
            rejected[typ] = "instantiated with parameter overrides"
        elif u["positional"]:
            rejected[typ] = "positional port connections"
        elif u["named"] - set(ports):
            rejected[typ] = "ports not in the model: " + ", ".join(sorted(u["named"] - set(ports)))
        else:
            cells[typ] = lib[typ][0]
    return cells, rejected


def stdcells_text(cells: dict) -> str:
    lib = stdcell_library()
    head = ("// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /\n"
            "// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.\n\n")
    return head + "\n".join(lib[c][0] for c in lib if c in cells)


# --------------------------------------------------------------------------- masking

def fallback_mask(golden, toks, mods, reach, items):
    """Mask for designs with no single item of >= RELAXED_MIN_TOKENS tokens.

    Candidates: (a) a run of consecutive `assign` statements (nothing between them) totalling >= the floor,
    (b) the whole body of a reachable module that contains at least one item and >= the floor tokens.
    The smallest candidate (fewest masked tokens, so the most context stays visible) wins; on a tie the
    assign group wins. Returns (masked, info, region) or None."""
    best = None  # (tokens, order, payload)
    for name, _, h, e in mods:
        if name not in reach:
            continue
        mod_items = [it for it in items if it[0] == name]
        for a in range(len(mod_items)):
            if mod_items[a][1] != "assign":
                continue
            for b in range(a, len(mod_items)):
                if mod_items[b][1] != "assign" or (b > a and mod_items[b][2] != mod_items[b - 1][3]):
                    break
                ntok = mod_items[b][3] - mod_items[a][2]
                if ntok >= RELAXED_MIN_TOKENS:
                    if b > a and (best is None or (ntok, 0) < best[:2]):
                        best = (ntok, 0, ("assign_group", name, mod_items[a][2], mod_items[b][3], b - a + 1))
                    break
        if mod_items and e - h >= RELAXED_MIN_TOKENS and (best is None or (e - h, 1) < best[:2]):
            best = (e - h, 1, ("module_body", name, h, e, len(mod_items)))
    if best is None:
        return None
    kind, name, i0, i1, n = best[2]
    if kind == "assign_group":
        s, en = toks[i0][1], toks[i1 - 1][2]
        region = golden[s:en]
        info = {"method": "fallback_assign_group", "in_module": name, "n_statements": n,
                "region_tokens": i1 - i0, "region_chars": len(region), "block_kind": "assign_group",
                "reason": f"no single always/assign/instance item has >= {RELAXED_MIN_TOKENS} tokens; masked the "
                          "smallest run of consecutive assign statements reaching that size"}
        return golden[:s] + MARKER + golden[en:], info, region
    s, en = toks[i0 - 1][2], toks[i1][1]
    region = golden[s:en]
    info = {"method": "fallback_module_body", "target_module": name, "n_items": n,
            "region_tokens": i1 - i0, "region_chars": len(region), "target_is_top": None,
            "reason": f"no single always/assign/instance item has >= {RELAXED_MIN_TOKENS} tokens; masked the "
                      "whole body of the smallest module reaching that size"}
    return golden[:s] + "\n" + MARKER + "\n" + golden[en:], info, region

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
        fb = fallback_mask(golden, toks, mods, reach, items)
        if fb is None:
            raise ValueError(f"no always/assign/instance item with >={RELAXED_MIN_TOKENS} tokens "
                             "in modules reachable from top (nor an assign group or module body that size)")
        if fb[1]["method"] == "fallback_module_body":
            fb[1]["target_is_top"] = fb[1]["target_module"] == top
        return fb
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


def write_spec(rec, dpath, lib_path, info, mode, cells_path=None):
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
    elif info.get("method") == "fallback_assign_group":
        lines += [
            f"- Mask type: **block**. The design has no single large statement, so {info['n_statements']} "
            f"consecutive continuous `assign` statements in module `{info['in_module']}` were replaced "
            f"together by `{MARKER}`. Write those `assign` statements in its place.",
        ]
    elif rec["mask_type"] == "module" or info.get("method") == "fallback_module_body":
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
    if cells_path:
        lines.append(f"- `{cells_path}` holds behavioural models of the standard cells the design "
                     "instantiates. It is read-only.")
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
    sim_removed = {}
    golden, n = strip_sim_tasks(files[gkey])
    if n:
        sim_removed[gkey] = n
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
    golden, tb_dropped = drop_testbenches(golden, rec["top_module"], [lib])
    if lib is not None:
        lib, n = strip_sim_tasks(lib)
        if n:
            sim_removed["lib.v"] = n
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
    cells, cells_rejected = resolve_stdcells([golden] + ([lib] if lib_path else []), known)
    undefined = sorted(undefined_instances(golden, rec["top_module"]) - known - VERILOG_PRIMITIVES - set(cells))

    task_id = f"{task_prefix}/{rec['task_id']}"
    starter = {dpath: masked}
    reference = {dpath: golden}
    if lib_path:
        starter[lib_path] = lib
        reference[lib_path] = lib
    if cells:
        starter[STDCELLS_FILE] = reference[STDCELLS_FILE] = stdcells_text(cells)

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
        "spec": write_spec(rec, dpath, lib_path, info, mode, STDCELLS_FILE if cells else None),
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
            "stdcells": ({"file": STDCELLS_FILE, "cells": sorted(cells), "library": "taskgen/harness/stdcells.v",
                          "note": "behavioural models of standard cells the design instantiates but does not ship"}
                         if cells else None),
            "stdcells_rejected": cells_rejected or None,
            "sim_tasks_removed": ({"files": sim_removed,
                                   "note": "simulation-only system-task statements replaced by `;` in the starter, "
                                           "reference and lib alike (outside initial blocks; $finish/$stop anywhere)"}
                                  if sim_removed else None),
            "testbench_modules_removed": ({"modules": tb_dropped,
                                           "note": "port-less modules unreachable from the top (testbenches) "
                                                   "removed from the design file in the starter and reference"}
                                          if tb_dropped else None),
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
