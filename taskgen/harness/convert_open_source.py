#!/usr/bin/env python3
"""
Convert taskgen open-source pipeline output into standard task JSONs (harness/FORMAT.md, schema_version 1).

Input:
  taskgen/runs/*_questions.jsonl   question rows (only rows with question_valid are used)
  taskgen/runs/designs.jsonl       seed design index: hash -> source, collection

Grouping and naming match taskgen/export_tasks.py: one task group per (seed design, mutant) pair with
at least one valid question, numbered mutant_<k> per design in (source, mutant_index) order; the spec is
the valid question with the lowest solve rate (ties: lowest question_number); difficulty from that
solve rate (easy >= 0.75, medium >= 0.4, hard < 0.4).

Each group yields two tasks:
  <collection>/<design>/mutant_<k>/repair       starter rtl/dut.v = original seed, reference = mutant
  <collection>/<design>/mutant_<k>/spec_to_rtl  no starter, reference = mutant

Output: taskgen/build/open_source/<task_id with "/" -> "__">.json. The output directory is cleared and
rewritten on every run. `interface` and `public_tests` are left for `rtltask.py finalize`.

Usage:
  python3 harness/convert_open_source.py [--raw DIR] [--out DIR]
"""
import argparse
import glob
import hashlib
import json
import re
import shutil
import sys
from collections import defaultdict
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
GENERATOR = "taskgen claude profile"

REPAIR_PREAMBLE = (
    "# Task: repair `dut`\n\n"
    "The starter file `rtl/dut.v` contains a module `dut` that does **not** fully match the specification "
    "below. Find where its behavior differs from the specification and fix `rtl/dut.v` so that module `dut` "
    "implements the specification exactly. Keep the module name `dut` and its port list unchanged.\n\n"
    "## Specification\n\n"
)
SPEC_TO_RTL_PREAMBLE = (
    "# Task: implement `dut`\n\n"
    "Create the file `rtl/dut.v` containing a synthesizable Verilog module named `dut` that implements the "
    "specification below exactly, including the port names and widths it describes.\n\n"
    "## Specification\n\n"
)


def difficulty(rate: float) -> str:
    return "easy" if rate >= 0.75 else "medium" if rate >= 0.4 else "hard"


def design_name(source: str) -> str:
    stem = Path(source).stem
    return stem[:-4] if stem.endswith("_ref") else stem


def seed_for(task_id: str) -> int:
    return int.from_bytes(hashlib.sha256(task_id.encode("utf-8")).digest()[:4], "big") & 0x7FFFFFFF


def read_jsonl(path: Path):
    """Yield parsed rows; skip (and report) unparseable lines, e.g. a partly written last line."""
    with open(path, encoding="utf-8") as f:
        for n, line in enumerate(f, 1):
            line = line.strip()
            if not line:
                continue
            try:
                yield json.loads(line)
            except json.JSONDecodeError:
                print(f"warning: {path.name}:{n}: unparseable line skipped", file=sys.stderr)


def load_licenses(readme: Path) -> dict:
    """Folder -> license from the table in sources/README.md."""
    lic = {}
    if not readme.exists():
        return lic
    for line in readme.read_text(encoding="utf-8").splitlines():
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if len(cells) < 6:
            continue
        m = re.fullmatch(r"`([^`]+)/?`", cells[0])
        if m:
            lic[m.group(1).rstrip("/")] = cells[4]
    return lic


def upstream_url(readme: Path, folder: str):
    if not readme.exists():
        return None
    for line in readme.read_text(encoding="utf-8").splitlines():
        if line.strip().startswith(f"| `{folder}/`"):
            m = re.search(r"\]\((https?://[^)]+)\)", line)
            if m:
                return m.group(1)
    return None


def normalize(code: str) -> str:
    return code.strip() + "\n"


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--raw", default=str(REPO / "taskgen/runs"))
    ap.add_argument("--out", default=str(REPO / "taskgen/build/open_source"))
    args = ap.parse_args()
    raw, out = Path(args.raw), Path(args.out)

    readme = REPO / "sources/README.md"
    licenses = load_licenses(readme)

    sources = {d["hash"]: d for d in read_jsonl(raw / "designs.jsonl")}

    groups = defaultdict(list)
    for path in sorted(glob.glob(str(raw / "*_questions.jsonl"))):
        valid = 0
        for q in read_jsonl(Path(path)):
            if not q.get("question_valid"):
                continue
            if q.get("original_design_hash") not in sources:
                print(f"warning: {Path(path).name}: design {q.get('original_design_hash')} not in designs.jsonl; skipped",
                      file=sys.stderr)
                continue
            groups[(q["original_design_hash"], q["mutant_hash"])].append(q)
            valid += 1
        print(f"{Path(path).name}: {valid} valid questions", file=sys.stderr)

    shutil.rmtree(out, ignore_errors=True)
    out.mkdir(parents=True, exist_ok=True)

    counters = defaultdict(int)
    by_kind, by_diff = defaultdict(int), defaultdict(lambda: defaultdict(int))
    ordered = sorted(groups.items(), key=lambda kv: (sources[kv[0][0]]["source"], kv[1][0]["mutant_index"]))
    for (dhash, mhash), qs in ordered:
        seed = sources[dhash]
        name = design_name(seed["source"])
        collection = seed["collection"]
        counters[dhash] += 1
        base_id = f"{collection}/{name}/mutant_{counters[dhash]}"

        qs.sort(key=lambda q: (q["solve_rate"], q["question_number"]))
        best = qs[0]
        spec_text = best["question_text"].strip() + "\n"
        diff = difficulty(best["solve_rate"])
        folder = seed["source"].split("/", 1)[0]

        provenance = {
            "source": f"sources/{seed['source']}",
            "collection": collection,
            "license": licenses.get(folder, licenses.get(collection)),
            "upstream": upstream_url(readme, folder),
            "generator": GENERATOR,
            "bug_type": best["bug_type"],
            "solve_rate": best["solve_rate"],
            "proof_strength": best["proof_strength"],
            "question_model": best["question_model"],
            "validation_model": best["validation_model"],
            "question_number": best["question_number"],
            "mutant_index": best["mutant_index"],
            "mutant_hash": mhash,
            "original_design_hash": dhash,
            "other_valid_specs": len(qs) - 1,
        }

        for kind in ("repair", "spec_to_rtl"):
            task_id = f"{base_id}/{kind}"
            task = {
                "schema_version": 1,
                "task_id": task_id,
                "suite": "open_source",
                "kind": kind,
                "difficulty": diff,
                "spec": (REPAIR_PREAMBLE if kind == "repair" else SPEC_TO_RTL_PREAMBLE) + spec_text,
                "top_module": "dut",
                "interface": None,
                "files": {"rtl/dut.v": normalize(best["original_code"])} if kind == "repair" else {},
                "editable": ["rtl/dut.v"],
                "tools": ["iverilog", "vvp", "yosys"],
                "limits": {"max_agent_steps": 50, "wall_time_s": 1800, "tool_timeout_s": 120},
                "public_tests": None,
                "hidden": {
                    "reference_files": {"rtl/dut.v": normalize(best["mutant_code"])},
                    "reference_top": "dut",
                    "hidden_vectors": {"cycles": 1000, "seed": seed_for(task_id)},
                    "formal": {"method": "yosys_sat_tempinduct", "max_steps": 60, "timeout_s": 120,
                               "accept_bounded": True},
                },
                "provenance": provenance,
            }
            path = out / (task_id.replace("/", "__") + ".json")
            path.write_text(json.dumps(task, indent=2) + "\n", encoding="utf-8")
            by_kind[kind] += 1
            by_diff[kind][diff] += 1

    total = sum(by_kind.values())
    print(f"{total} tasks -> {out}")
    for kind in by_kind:
        print(f"  {kind}: {by_kind[kind]}  {dict(sorted(by_diff[kind].items()))}")


if __name__ == "__main__":
    main()
