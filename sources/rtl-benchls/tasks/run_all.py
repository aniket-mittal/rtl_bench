#!/usr/bin/env python3
"""Run all three tasks for one model with one verifier.

Writes per-design JSONLs under `results/task_<n>/<model_slug>.jsonl` mirroring
the released layout, then prints a combined summary.

Usage:
    # Edit `my_llm` / `my_verify` below (and clone repos for Task 3), then:
    python3 tasks/run_all.py --model-slug my-model --workers 4 --progress
    python3 tasks/run_all.py --limit 5            # quick smoke across all 3 tasks
    python3 tasks/run_all.py --resume             # continue an interrupted run
    python3 tasks/run_all.py --tasks 1 2          # only run a subset
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path

from rtlbenchls import run_task1, run_task2, run_task3, aggregate, verify_noop
from rtlbenchls.fetch_repo import make_fetchers


# --- User plug-ins ----------------------------------------------------------

def my_llm(prompt: str, *, system: str = "", max_tokens: int = 4096, temperature: float = 0.0) -> str:
    raise NotImplementedError("Implement my_llm or wire your provider here.")


my_verify = verify_noop  # swap for your LEC/SEC backend


# --- Orchestration ----------------------------------------------------------

def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--model-slug", default="my-model")
    ap.add_argument("--tasks", type=int, nargs="+", default=[1, 2, 3], choices=[1, 2, 3])
    ap.add_argument("--limit", type=int, default=None)
    ap.add_argument("--workers", type=int, default=1)
    ap.add_argument("--resume", action="store_true")
    ap.add_argument("--progress", action="store_true")
    ap.add_argument("--repo-cache", default="repo_cache")
    args = ap.parse_args()

    out = Path("results")
    common = dict(llm=my_llm, verify=my_verify, limit=args.limit,
                  max_workers=args.workers, resume=args.resume, progress=args.progress)
    summary = {"model": args.model_slug}

    if 1 in args.tasks:
        p = out / "task_1_round_trip" / f"{args.model_slug}.jsonl"
        print(f"=== Task 1 ({args.model_slug}) ===")
        run_task1("data/slice_01.jsonl", output_path=p, **common)
        summary["task_1_round_trip"] = aggregate(p, denominator=420)
        print(summary["task_1_round_trip"])

    if 2 in args.tasks:
        p = out / "task_2_masked_content" / f"{args.model_slug}.jsonl"
        print(f"\n=== Task 2 ({args.model_slug}) ===")
        run_task2("data/masked_designs.jsonl", output_path=p, **common)
        summary["task_2_masked_content"] = aggregate(p, denominator=425)
        print(summary["task_2_masked_content"])

    if 3 in args.tasks:
        p = out / "task_3_repo_issue" / f"{args.model_slug}.jsonl"
        print(f"\n=== Task 3 ({args.model_slug}) ===")
        fetch_buggy, fetch_golden = make_fetchers(cache_dir=args.repo_cache)
        run_task3("data/repo_issue_108_cases.json",
                  fetch_buggy_rtl=fetch_buggy, fetch_golden_fix=fetch_golden,
                  output_path=p, **common)
        summary["task_3_repo_issue"] = aggregate(p, denominator=108)
        print(summary["task_3_repo_issue"])

    summary_path = out / f"{args.model_slug}_summary.json"
    summary_path.write_text(json.dumps(summary, indent=2))
    print(f"\nWrote {summary_path}")


if __name__ == "__main__":
    main()
