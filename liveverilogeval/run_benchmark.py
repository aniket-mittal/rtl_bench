"""
Benchmark a model on the valid generated questions.

Usage: python run_benchmark.py [questions.jsonl] [--model deepseek] [--model-id ""] [--k 5]

One task per (original design, mutant); the question used is the first valid
one for that mutant. A sample passes if it is formally equivalent to the
mutant (bounded results count only if config.equiv_accept_bounded is true).
"""
import argparse
import asyncio
import json

from utils.config import Config
from utils.equivalence_check import check_equivalence_detailed, equiv_settings
from utils.generators import AnswerGenerator
from utils.LLM_call import LLMClient


async def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("questions", nargs="?", default="./results/questions_gpt5.jsonl")
    parser.add_argument("--model", default="deepseek")
    parser.add_argument("--model-id", default="")
    parser.add_argument("--k", type=int, default=5)
    args = parser.parse_args()

    config = Config("config.yaml")
    client = LLMClient(config)
    equiv_kw = equiv_settings(config)
    accept_bounded = getattr(config, "equiv_accept_bounded", True)

    tasks, seen = [], set()
    with open(args.questions, "r") as f:
        for line in f:
            q = json.loads(line)
            key = (q["original_design_hash"], q.get("mutant_hash", q.get("mutant_index")))
            if q.get("question_valid") and key not in seen:
                seen.add(key)
                tasks.append((q["question_text"], q["mutant_code"]))
    if not tasks:
        print("No valid questions found.")
        return

    print(f"Generating {args.k} answers for each of {len(tasks)} tasks")
    ags = [AnswerGenerator(question, client, config) for question, _ in tasks]
    answers = await asyncio.gather(
        *[ag.generate_answers(args.k, model=args.model, model_id=args.model_id) for ag in ags]
    )

    semaphore = asyncio.Semaphore(getattr(config, "max_concurrent_yosys", 4))

    async def passes(answer: str, truth: str) -> bool:
        async with semaphore:
            res = await check_equivalence_detailed(config.batch_dir_path, answer, truth, **equiv_kw)
        return res.is_equivalent(accept_bounded)

    pass_at_1 = pass_at_k = 0
    for i, ((_, truth), samples) in enumerate(zip(tasks, answers)):
        results = await asyncio.gather(*[passes(a, truth) for a in samples]) if samples else []
        pass_at_1 += bool(results) and results[0]
        pass_at_k += any(results)
        print(f"task {i + 1}/{len(tasks)}: {sum(results)}/{args.k} samples pass")

    print(f"pass@1: {pass_at_1 / len(tasks):.3f}")
    print(f"pass@{args.k}: {pass_at_k / len(tasks):.3f}")


if __name__ == "__main__":
    asyncio.run(main())
