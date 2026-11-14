#!/usr/bin/env python3
"""Example evaluation for Task 3 (Repository-Issue Reasoning).

Prerequisite (one-time, ~1.6 GB): clone the 9 upstream repos into repo_cache/:
    python3 scripts/clone_repos.py
    # or from a local mirror:
    python3 scripts/clone_repos.py --from-mirror /path/to/upstream/repo_cache

Run (defaults to a FULL run over 108 cases; pass --limit N for a smoke test):
    python3 tasks/task3_repo_issue/example_run.py --limit 5
    python3 tasks/task3_repo_issue/example_run.py --workers 4 --progress

Or use the CLI:
    python -m rtlbenchls.run --task 3 --model mymod:my_llm --verifier reference \
        --output results/task_3_repo_issue/my-model.jsonl
"""
import argparse
from rtlbenchls import run_task3, verify_noop, aggregate
from rtlbenchls.fetch_repo import make_fetchers


def my_llm(prompt: str, *, system: str = "", max_tokens: int = 4096, temperature: float = 0.0) -> str:
    raise NotImplementedError("Implement my_llm.")


my_verify = verify_noop


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--dataset", default="data/repo_issue_108_cases.json")
    ap.add_argument("--output", default="results/task_3_repo_issue/example.jsonl")
    ap.add_argument("--repo-cache", default="repo_cache")
    ap.add_argument("--limit", type=int, default=None, help="Run first N cases (default: all 108).")
    ap.add_argument("--offset", type=int, default=0)
    ap.add_argument("--workers", type=int, default=1)
    ap.add_argument("--resume", action="store_true")
    ap.add_argument("--progress", action="store_true")
    args = ap.parse_args()

    fetch_buggy_rtl, fetch_golden_fix = make_fetchers(cache_dir=args.repo_cache)
    run_task3(
        args.dataset, llm=my_llm, verify=my_verify,
        fetch_buggy_rtl=fetch_buggy_rtl, fetch_golden_fix=fetch_golden_fix,
        output_path=args.output, limit=args.limit, offset=args.offset,
        max_workers=args.workers, resume=args.resume, progress=args.progress,
    )
    print(aggregate(args.output, denominator=108))
