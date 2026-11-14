#!/usr/bin/env python3
"""Convert RTL-BenchLS Task 1 designs into standard `infill` task JSONs (schema_version 1).

Input : sources/rtl-benchls/data/slice_*.jsonl (9,698 verified designs, no natural-language spec)
Output: taskgen/build/rtl-benchls-task1/rtl-benchls__task1__<task_id>.json  (kind = "infill")

Standard library only. Idempotent: the output directory is cleared and rewritten on every run.

Task 1 ships golden RTL and commercial equivalence scripts, but no description, so it cannot become a
`spec_to_rtl` task without generating specs. Instead each design becomes a block-infill task built by
exactly the code path of the Task 2 converter (convert_rtlbenchls.py): this script builds a Task-2-shaped
record per design (mask_type "block", mask_index from sha256 of the task_id) and calls its `convert()`,
which rebuilds the mask (`rebuild_mask`) and writes the spec (`write_spec`).

Design file: `<design>_combined.v` when it defines modules that `<design>.v` lacks (it then carries the
dependencies), else `<design>.v`. The 8 designs with the generic name `rtl` ship only `<top>.v0.v` /
`<top>.v1.v` (golden / revised copies for SEC); `<top>.v0.v` is used, as `rtl/<top>.v`.

Skipped (reasons are grouped in the printed summary):
  * duplicate task_id across slices (the first one is kept)
  * no maskable block (no always/assign/instance item with >= 8 tokens reachable from the top), which also
    covers trivial modules whose whole body is under 8 tokens
  * cells instantiated under the top but defined nowhere in the record (vendor primitives, missing submodules)
  * top module without ports (testbench-like)
  * top module has `inout` ports (the harness does not support them; checked with Yosys)
  * Yosys cannot parse the reference: `read_verilog -sv; hierarchy -check -top <top>` with a 20 s timeout,
    run in parallel. This catches e.g. `$finish` outside `initial` and missing submodules.

Usage: python3 harness/convert_rtlbenchls_task1.py [--input-glob GLOB] [--out DIR] [--jobs N] [--limit N]
"""
from __future__ import annotations

import argparse
import collections
import glob
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import convert_rtlbenchls as t2  # noqa: E402

REPO = t2.REPO
DEFAULT_GLOB = str(REPO / "sources" / "rtl-benchls" / "data" / "slice_*.jsonl")
DEFAULT_OUT = REPO / "taskgen" / "build" / "rtl-benchls-task1"
TASK_PREFIX = "rtl-benchls/task1"
YOSYS_TIMEOUT_S = 20


def mask_index_for(task_id: str) -> int:
    """Deterministic block choice; rebuild_mask takes it modulo the number of candidates."""
    return int(hashlib.sha256((task_id + "/mask").encode()).hexdigest()[:8], 16)


def pick_golden(rec):
    """(files dict for the Task-2-shaped record, golden key, source key in the record, note)."""
    files = dict(rec.get("files") or {})
    d, top = rec["design_name"], rec["top_module"]
    plain, comb = f"{d}.v", f"{d}_combined.v"
    if plain in files:
        if comb in files and t2.defined_modules(files[comb]) - t2.defined_modules(files[plain]):
            return files, comb, comb, "combined (defines dependencies the design file lacks)"
        return files, plain, plain, "design file"
    v0 = f"{top}.v0.v"
    if v0 in files:  # generic `rtl` designs: golden copy for SEC, exposed as rtl/<top>.v
        files[f"{top}.v"] = files.pop(v0)
        return files, f"{top}.v", v0, f"{v0} (golden SEC copy) renamed to {top}.v"
    return files, None, None, None


def top_has_ports(text: str, top: str) -> bool:
    toks = t2.tokenize(t2.blank_comments(text))
    for name, s, h, _ in t2.find_modules(toks):
        if name == top:
            hdr = [t[0] for t in toks[s:h]]
            # ports exist if the header has a non-parameter (...) list with an identifier in it
            i = 2
            while i < len(hdr):
                if hdr[i] == "#" and i + 1 < len(hdr) and hdr[i + 1] == "(":
                    i = t2.skip_group(toks[s:h], i + 1)
                    continue
                if hdr[i] == "(":
                    j = t2.skip_group(toks[s:h], i)
                    return any(t2.IDENT_RE.match(x) for x in hdr[i + 1:j - 1])
                i += 1
            return False
    return False


def yosys_check(files: dict, top: str):
    """None if Yosys parses and elaborates the reference, else an error string."""
    with tempfile.TemporaryDirectory(prefix="rbls_t1_") as td:
        paths = []
        for rel, text in files.items():
            p = os.path.join(td, os.path.basename(rel))
            with open(p, "w") as f:
                f.write(text)
            paths.append(p)
        script = ("read_verilog -sv " + " ".join(f'"{p}"' for p in paths) + f"; hierarchy -check -top {top}"
                  f"; select -assert-none {top}/i:* {top}/o:* %i")
        try:
            r = subprocess.run(["yosys", "-q", "-p", script], capture_output=True, text=True,
                               timeout=YOSYS_TIMEOUT_S)
        except subprocess.TimeoutExpired:
            return "yosys timeout"
        if r.returncode == 0:
            return None
        msg = (r.stderr + r.stdout).replace(td + "/", "")
        errs = [ln.strip() for ln in msg.splitlines() if "ERROR" in ln]
        if any("selection is not empty" in e for e in errs):
            return "yosys: top has inout ports (unsupported by the harness)"
        if errs:
            return errs[0][:300]
        tail = msg.strip().splitlines()
        return (tail[-1] if tail else "yosys failed")[:300]


def yosys_category(err: str) -> str:
    if err.startswith("yosys: top has inout"):
        return "top has inout ports (unsupported by the harness)"
    if err == "yosys timeout":
        return "yosys: timeout"
    if "outside initial block" in err or "System task" in err:
        return "yosys: system task ($finish/$stop/...) outside initial"
    if re.search(r"Can't resolve (function|task) name `\\?\$", err):
        return "yosys: simulation-only system task/function ($fopen, $random, ...)"
    if "Unimplemented compiler directive or undefined macro" in err:
        return "yosys: undefined macro"
    if "$readmem" in err:
        return "yosys: missing $readmemh/$readmemb data file"
    if "is not part of the design" in err or ("not found" in err.lower() and "module" in err.lower()):
        return "yosys: missing module"
    if "syntax error" in err:
        return "yosys: syntax error"
    return "yosys: other error"


def category(reason: str) -> str:
    if " | " in reason:
        return reason.split(" | ")[0]
    if reason.startswith("no always/assign/instance item"):
        return "no maskable block (>= 8 tokens)"
    if reason.startswith("duplicate task_id"):
        return "duplicate task_id (kept the first)"
    if reason.startswith("file name collides"):
        return "file name collides case-insensitively with an earlier task (kept the first)"
    if reason.startswith("undefined modules"):
        return "instantiates modules defined nowhere in the record"
    return reason if len(reason) < 80 else reason[:80]


def build(rec, slice_name):
    """Return (task, None) or (None, reason) without the Yosys check."""
    tid_full = f"{TASK_PREFIX}/{rec['task_id']}"
    files, gkey, src_key, gnote = pick_golden(rec)
    if gkey is None:
        return None, "no design file in record"
    top, top_note = rec["top_module"], None
    defined = t2.defined_modules(files[gkey])
    if top not in defined and rec.get("design_name") in defined:
        # upstream metadata bug: a few `origen_*` records have top_module "module" (from a "// X module" comment)
        top, top_note = rec["design_name"], f"upstream top_module {top!r} is not defined; used design_name"
    shaped = {
        "task_id": rec["task_id"],
        "parent_design": rec["task_id"],
        "top_module": top,
        "origin": rec.get("origin"),
        "origin_bucket": rec.get("origin_bucket"),
        "loc": rec.get("loc"),
        "design_type": rec.get("design_type"),
        "mask_type": "block",
        "mask_index": mask_index_for(tid_full),
        "mask_target_module": None,
        "verification_tool": rec.get("verification_tool"),
        "verification_type": rec.get("verification_type"),
        "primary_script_key": rec.get("primary_script_key"),
        "golden_rtl_key": gkey,
        "masked_rtl_key": None,
        "files": files,
    }
    task, reason = t2.convert(shaped, "rebuild", task_prefix=TASK_PREFIX)
    if task is None:
        return None, reason
    task["interface"] = None  # derived by the exporter
    prov = task["provenance"]
    if prov["undefined_modules"]:
        return None, "undefined modules: " + ", ".join(prov["undefined_modules"][:5])
    golden = files[gkey]
    if not top_has_ports(golden, top):
        return None, "top module has no ports (testbench-like)"
    for k in ("upstream_ref_rtl_sha256", "upstream_masked_rtl_key"):
        prov.pop(k, None)
    prov["benchmark_task"] = "task1_round_trip"
    prov["converted_as"] = "block infill (Task 1 has no spec; mask rebuilt as in Task 2)"
    prov["original_design_name"] = rec.get("design_name")
    prov["n_modules"] = rec.get("n_modules")
    prov["slice"] = slice_name
    prov["golden_choice"] = gnote
    if top_note:
        prov["top_module_fix"] = top_note
    prov["mask_index_rule"] = "int(sha256(task_id + '/mask')[:8], 16) % n_candidates"
    prov["upstream_golden_rtl_key"] = src_key
    prov["dropped_files"] = sorted(k for k in rec["files"] if k not in (src_key, "lib.v", "sources.json"))
    prov["converter"] = "harness/convert_rtlbenchls_task1.py"
    return task, None


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--input-glob", default=DEFAULT_GLOB)
    ap.add_argument("--out", default=str(DEFAULT_OUT))
    ap.add_argument("--jobs", type=int, default=4, help="parallel Yosys checks (default 4)")
    ap.add_argument("--limit", type=int, default=0, help="only the first N records (for testing)")
    args = ap.parse_args(argv)

    out = Path(args.out)
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)

    skipped = []
    seen = set()
    pending = []
    n_records = 0
    for path in sorted(glob.glob(args.input_glob)):
        with open(path) as f:
            for line in f:
                if not line.strip():
                    continue
                if args.limit and n_records >= args.limit:
                    break
                rec = json.loads(line)
                n_records += 1
                if rec["task_id"] in seen:
                    skipped.append((rec["task_id"], f"duplicate task_id (also in an earlier slice; {Path(path).name})"))
                    continue
                seen.add(rec["task_id"])
                task, reason = build(rec, Path(path).name)
                if task is None:
                    skipped.append((rec["task_id"], reason))
                else:
                    pending.append((rec["task_id"], task))

    def check(item):
        tid, task = item
        return tid, task, yosys_check(task["hidden"]["reference_files"], task["top_module"])

    counts = collections.Counter()
    used_names = {}  # lower-cased file name -> task_id
    with ThreadPoolExecutor(max_workers=args.jobs) as ex:
        for tid, task, err in ex.map(check, pending):
            if err:
                skipped.append((tid, f"{yosys_category(err)} | {err}"))
                continue
            fname = task["task_id"].replace("/", "__") + ".json"
            if fname.lower() in used_names:  # macOS/Windows file systems are case-insensitive
                skipped.append((tid, f"file name collides case-insensitively with {used_names[fname.lower()]}"))
                continue
            used_names[fname.lower()] = task["task_id"]
            (out / fname).write_text(json.dumps(task, indent=2) + "\n")
            counts["written"] += 1
            counts["design_type:" + str(task["provenance"]["design_type"])] += 1
            if task["provenance"]["mask_reconstruction"].get("threshold_relaxed"):
                counts["threshold_relaxed"] += 1

    by_reason = collections.Counter(category(r) for _, r in skipped)
    dup = [x for x in skipped if x[1].startswith("duplicate")]
    report = {
        "records": n_records,
        "written": counts["written"],
        "skipped": len(skipped),
        "skipped_by_reason": dict(by_reason.most_common()),
        "written_by_design_type": {k.split(":", 1)[1]: v for k, v in counts.items() if k.startswith("design_type:")},
        "written_with_relaxed_block_threshold": counts["threshold_relaxed"],
        "skipped_records": [{"task_id": t, "reason": r} for t, r in sorted(skipped)],
        "duplicates": len(dup),
        "out_dir": str(out),
    }
    print(json.dumps(report, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
