#!/usr/bin/env python3
"""Example evaluation for Task 1 (Round-Trip Reasoning).

Two ways to run:

1. This script (edit `my_llm`, then run). Defaults to a FULL run (420 designs);
   pass --limit N for a quick smoke test:
       python3 tasks/task1_round_trip/example_run.py --limit 5
       python3 tasks/task1_round_trip/example_run.py --workers 4 --progress

2. The CLI (no editing — point it at any callable):
       python -m rtlbenchls.run --task 1 --model mymod:my_llm --verifier reference \
           --output results/task_1_round_trip/my-model.jsonl --progress

Replace `my_llm` with any callable matching `rtlbenchls.LLMClient`, and swap
`verify_noop` for your LEC/SEC backend (see docs/formal_verification.md).
"""
import argparse
from rtlbenchls import run_task1, verify_noop, aggregate


def my_llm(prompt: str, *, system: str = "", max_tokens: int = 4096, temperature: float = 0.0) -> str:
    # Example using OpenAI:
    #   import openai
    #   client = openai.OpenAI()
    #   resp = client.chat.completions.create(
    #       model="gpt-4o", temperature=temperature, max_tokens=max_tokens,
    #       messages=[{"role": "system", "content": system}, {"role": "user", "content": prompt}])
    #   return resp.choices[0].message.content
    raise NotImplementedError("Implement my_llm (or use --verifier noop to test plumbing).")


my_verify = verify_noop  # swap in your LEC/SEC backend for real evaluation


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--dataset", default="data/slice_01.jsonl")
    ap.add_argument("--output", default="results/task_1_round_trip/example.jsonl")
    ap.add_argument("--limit", type=int, default=None, help="Run first N designs (default: all 420).")
    ap.add_argument("--offset", type=int, default=0)
    ap.add_argument("--workers", type=int, default=1)
    ap.add_argument("--resume", action="store_true")
    ap.add_argument("--progress", action="store_true")
    ap.add_argument("--spec-ratio", type=float, default=1.0)
    args = ap.parse_args()

    run_task1(
        args.dataset, llm=my_llm, verify=my_verify, output_path=args.output,
        limit=args.limit, offset=args.offset, max_workers=args.workers,
        resume=args.resume, progress=args.progress, spec_length_ratio=args.spec_ratio,
    )
    print(aggregate(args.output, denominator=420))
