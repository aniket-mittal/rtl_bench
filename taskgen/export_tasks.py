"""
Turn pipeline output (questions JSONL) into one folder per task.

A task is one (seed design, mutant) pair with at least one valid question:

  <out>/<collection>/<design>/mutant_<k>/
      spec.md          the valid question with the lowest solve rate (hardest that is still solvable)
      reference.v      the mutant: the circuit the spec describes (hidden answer)
      meta.json        source, bug type, every valid question, solve rates, proof strength, difficulty

<out>/index.jsonl gets one line per task so you can filter, e.g. by difficulty.
Difficulty is from the validator's solve rate on the chosen spec:
  easy >= 0.75, medium >= 0.4, hard < 0.4.

Usage:
  python export_tasks.py --designs ../tasks/open_source/raw/designs.jsonl \
      --out ../tasks/open_source ../tasks/open_source/raw/*_questions.jsonl
"""
import argparse
import json
import shutil
from collections import defaultdict
from pathlib import Path


def difficulty(rate: float) -> str:
    return "easy" if rate >= 0.75 else "medium" if rate >= 0.4 else "hard"


def design_name(source: str) -> str:
    stem = Path(source).stem
    return stem[:-4] if stem.endswith("_ref") else stem


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("questions", nargs="+")
    ap.add_argument("--designs", required=True, help="designs.jsonl written by prepare_sources.py")
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    sources = {}
    for line in open(args.designs, encoding="utf-8"):
        d = json.loads(line)
        sources[d["hash"]] = d

    groups = defaultdict(list)
    for path in args.questions:
        for line in open(path, encoding="utf-8"):
            q = json.loads(line)
            if q.get("question_valid"):
                groups[(q["original_design_hash"], q["mutant_hash"])].append(q)

    out = Path(args.out)
    for coll in {d["collection"] for d in sources.values()}:
        shutil.rmtree(out / coll, ignore_errors=True)

    index, counters = [], defaultdict(int)
    for (dhash, mhash), qs in sorted(groups.items(), key=lambda kv: (sources[kv[0][0]]["source"], kv[1][0]["mutant_index"])):
        seed = sources[dhash]
        name = design_name(seed["source"])
        counters[dhash] += 1
        task_dir = out / seed["collection"] / name / f"mutant_{counters[dhash]}"
        task_dir.mkdir(parents=True, exist_ok=True)

        qs.sort(key=lambda q: (q["solve_rate"], q["question_number"]))
        best = qs[0]
        (task_dir / "spec.md").write_text(best["question_text"].strip() + "\n", encoding="utf-8")
        (task_dir / "reference.v").write_text(best["mutant_code"].strip() + "\n", encoding="utf-8")
        meta = {
            "task_id": f"{seed['collection']}/{name}/mutant_{counters[dhash]}",
            "source": f"sources/{seed['source']}",
            "bug_type": best["bug_type"],
            "difficulty": difficulty(best["solve_rate"]),
            "solve_rate": best["solve_rate"],
            "proof_strength": best["proof_strength"],
            "question_model": best["question_model"],
            "validation_model": best["validation_model"],
            "mutant_hash": mhash,
            "original_design_hash": dhash,
            "original_code": best["original_code"],
            "other_valid_specs": [{"solve_rate": q["solve_rate"], "spec": q["question_text"]} for q in qs[1:]],
        }
        (task_dir / "meta.json").write_text(json.dumps(meta, indent=2) + "\n", encoding="utf-8")
        index.append({k: meta[k] for k in ("task_id", "source", "bug_type", "difficulty", "solve_rate", "proof_strength")})

    (out / "index.jsonl").write_text("".join(json.dumps(r) + "\n" for r in index), encoding="utf-8")
    by = defaultdict(int)
    for r in index:
        by[r["difficulty"]] += 1
    print(f"{len(index)} tasks -> {out}  ({dict(by)})")


if __name__ == "__main__":
    main()
