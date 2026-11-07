"""Command-line runner for RTL-BenchLS.

Examples
--------
    # Full Task 1 evaluation (420 designs) with your model + verifier:
    python -m rtlbenchls.run --task 1 \
        --model mymodels:gpt4o --verifier reference \
        --output results/task_1_round_trip/gpt-4o.jsonl --progress

    # First 50 designs, 4 concurrent workers, no-op verifier (dry run):
    python -m rtlbenchls.run --task 1 --slice 1 --limit 50 \
        --model mymodels:gpt4o --verifier noop --workers 4

    # Resume an interrupted run (skips task_ids already in the output):
    python -m rtlbenchls.run --task 2 --model mymodels:gpt4o \
        --verifier reference --output results/task_2_masked_content/gpt-4o.jsonl --resume

`--model` / `--verifier` accept a dotted path `package.module:callable`.
`--verifier` also accepts the built-in names `noop` and `reference`.
"""
from __future__ import annotations
import argparse
import importlib
import sys
from pathlib import Path

from rtlbenchls.runner import run_task1, run_task2, run_task3
from rtlbenchls.aggregate import aggregate
from rtlbenchls.verify_noop import verify_noop

# Default record counts per task (used for pass_pct denominators and slice paths).
DEFAULT_DATASETS = {
    1: "data/slice_01.jsonl",
    2: "data/masked_designs.jsonl",
    3: "data/repo_issue_108_cases.json",
}
DEFAULT_DENOM = {1: 420, 2: 425, 3: 108}
DEFAULT_OUTPUT = {
    1: "results/task_1_round_trip",
    2: "results/task_2_masked_content",
    3: "results/task_3_repo_issue",
}


def load_callable(spec: str):
    """Load `package.module:callable` and return the object."""
    if ":" not in spec:
        raise SystemExit(f"--model/--verifier must be 'module:callable', got {spec!r}")
    mod_name, _, attr = spec.partition(":")
    try:
        mod = importlib.import_module(mod_name)
    except ImportError as e:
        raise SystemExit(f"cannot import module {mod_name!r}: {e}")
    try:
        return getattr(mod, attr)
    except AttributeError:
        raise SystemExit(f"module {mod_name!r} has no attribute {attr!r}")


def resolve_verifier(spec: str):
    if spec == "noop":
        return verify_noop
    if spec == "reference":
        from rtlbenchls.verify_reference import verify_reference
        return verify_reference
    return load_callable(spec)


def resolve_dataset(task: int, dataset: str | None, slice_n: int | None) -> str:
    if dataset:
        return dataset
    if slice_n is not None:
        if task == 1:
            return f"data/slice_{slice_n:02d}.jsonl"
        if task == 2:
            return "data/masked_designs.jsonl"  # masks are only defined for slice 1
        raise SystemExit("--slice only applies to tasks 1 and 2")
    return DEFAULT_DATASETS[task]


def default_output(task: int, model_spec: str) -> str:
    model_slug = model_spec.split(":")[-1].replace("/", "_")
    return f"{DEFAULT_OUTPUT[task]}/{model_slug}.jsonl"


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(prog="rtlbenchls.run", description="Run an RTL-BenchLS task.")
    p.add_argument("--task", type=int, required=True, choices=[1, 2, 3], help="Which task to run.")
    p.add_argument("--model", required=True, help="LLM callable as 'module:callable'.")
    p.add_argument("--verifier", default="noop",
                   help="'noop', 'reference', or 'module:callable'. Default: noop.")
    p.add_argument("--dataset", default=None, help="Explicit dataset path (overrides --slice).")
    p.add_argument("--slice", type=int, default=None, dest="slice_n",
                   help="Slice number for tasks 1/2 (resolves to data/slice_NN.jsonl).")
    p.add_argument("--output", default=None, help="Output JSONL path. Default: results/<task>/<model>.jsonl")

    # Selection / control
    p.add_argument("--limit", type=int, default=None, help="Run only the first N records.")
    p.add_argument("--offset", type=int, default=0, help="Skip the first N records.")
    p.add_argument("--resume", action="store_true", help="Skip task_ids already in --output.")
    p.add_argument("--force", action="store_true", help="Ignore --resume; truncate output first.")
    p.add_argument("--workers", type=int, default=1, help="Concurrent LLM+verify workers.")
    p.add_argument("--progress", action="store_true", help="Print per-design PASS/FAIL to stderr.")
    p.add_argument("--save-rtl", action="store_true", help="Store generated RTL in each record.")

    # Task-specific sampling knobs
    p.add_argument("--spec-ratio", type=float, default=1.0, help="[Task 1] NL spec / RTL token ratio.")
    p.add_argument("--description-ratio", type=float, default=0.2,
                   help="[Task 2] description / masked-block token ratio.")
    p.add_argument("--repo-cache", default="repo_cache", help="[Task 3] local repo clone directory.")
    return p


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)

    llm = load_callable(args.model)
    verify = resolve_verifier(args.verifier)
    dataset = resolve_dataset(args.task, args.dataset, args.slice_n)
    output = args.output or default_output(args.task, args.model)

    if not Path(dataset).exists():
        raise SystemExit(f"dataset not found: {dataset}")

    common = dict(
        llm=llm, verify=verify, output_path=output,
        limit=args.limit, offset=args.offset,
        resume=args.resume, force=args.force,
        max_workers=args.workers, progress=args.progress,
        save_revised_rtl=args.save_rtl,
    )

    print(f"Running task {args.task}: dataset={dataset} output={output} "
          f"limit={args.limit} offset={args.offset} workers={args.workers} "
          f"resume={args.resume}", file=sys.stderr)

    if args.task == 1:
        run_task1(dataset, spec_length_ratio=args.spec_ratio, **common)
    elif args.task == 2:
        run_task2(dataset, description_ratio=args.description_ratio, **common)
    else:
        from rtlbenchls.fetch_repo import make_fetchers
        fetch_buggy, fetch_golden = make_fetchers(cache_dir=args.repo_cache)
        run_task3(dataset, fetch_buggy_rtl=fetch_buggy, fetch_golden_fix=fetch_golden, **common)

    # Sidecar summary.
    summary = aggregate(output, denominator=DEFAULT_DENOM[args.task])
    summary_path = Path(output).with_suffix(".summary.json")
    import json
    summary_path.write_text(json.dumps(summary, indent=2))
    print(f"\n{summary}", file=sys.stderr)
    print(f"Wrote {output} and {summary_path}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
