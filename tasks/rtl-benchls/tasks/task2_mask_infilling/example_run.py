#!/usr/bin/env python3
"""Example evaluation for Task 2 (Masked-Content Reasoning).

Run (defaults to a FULL run over 425 records; pass --limit N for a smoke test):
    python3 tasks/task2_mask_infilling/example_run.py --limit 5
    python3 tasks/task2_mask_infilling/example_run.py --workers 4 --progress

Or use the CLI:
    python -m rtlbenchls.run --task 2 --model mymod:my_llm --verifier reference \
        --output results/task_2_masked_content/my-model.jsonl

The two-step describe → recover and the [MASKED] splice happen inside the
framework; you supply the LLM and a verifier.
"""
import argparse
from rtlbenchls import run_task2, verify_noop, aggregate


def my_llm(prompt: str, *, system: str = "", max_tokens: int = 4096, temperature: float = 0.0) -> str:
    raise NotImplementedError("Implement my_llm. See task1_round_trip/example_run.py for a sketch.")


my_verify = verify_noop


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--dataset", default="data/masked_designs.jsonl")
    ap.add_argument("--output", default="results/task_2_masked_content/example.jsonl")
    ap.add_argument("--limit", type=int, default=None, help="Run first N records (default: all 425).")
    ap.add_argument("--offset", type=int, default=0)
    ap.add_argument("--workers", type=int, default=1)
    ap.add_argument("--resume", action="store_true")
    ap.add_argument("--progress", action="store_true")
    ap.add_argument("--description-ratio", type=float, default=0.2)
    args = ap.parse_args()

    run_task2(
        args.dataset, llm=my_llm, verify=my_verify, output_path=args.output,
        limit=args.limit, offset=args.offset, max_workers=args.workers,
        resume=args.resume, progress=args.progress, description_ratio=args.description_ratio,
    )
    print(aggregate(args.output, denominator=425))
