"""
Mutation-based question generation pipeline.

For each original design:
  1. an LLM proposes design-specific bug categories,
  2. an LLM writes one mutant per selected category; each mutant is kept only if
     Yosys finds a counterexample against the original (so it is a genuinely new
     circuit) and it is not equivalent to a mutant already kept,
  3. an LLM writes `questions_n` LeetCode-style questions per mutant,
  4. each question is validated by sampling `question_validation_n` answers from
     the question text alone and formally checking them against the mutant.

Every question (valid or not) is written to the output JSONL with its
validation stats, so you can filter by `question_valid`, `solve_rate` and
`proof_strength` downstream.

Usage:
  python main.py run                       # DeepSeek profile, all designs
  python main.py run --profile gpt5 --only-missing
  python main.py run --limit 2             # quick smoke test on 2 designs
  python main.py combine                   # merge output_path + GPT-5 output
"""
import argparse
import asyncio
import json
import time
from pathlib import Path
from typing import Dict, List

from entry_types import DesignEntry
from utils.config import Config
from utils.generators import create_generators
from utils.LLM_call import LLMClient

# Which model does which stage. Validation answers use a fixed model across
# profiles so solve rates are comparable.
PROFILES: Dict[str, Dict[str, tuple]] = {
    "deepseek": {
        "bugs": ("gpt", "gpt-4o-mini"),
        "mutants": ("deepseek", ""),
        "questions": ("deepseek", ""),
        "validation": ("deepseek", ""),
    },
    "gpt5": {
        "bugs": ("gpt", "gpt-4o-mini"),
        "mutants": ("gpt", "gpt-5"),
        "questions": ("gpt", "gpt-5"),
        "validation": ("deepseek", ""),
    },
}

GPT5_OUTPUT_PATH = "./results/questions_gpt5.jsonl"


def read_jsonl(path: str) -> List[dict]:
    try:
        with open(path, "r", encoding="utf-8") as f:
            return [json.loads(line) for line in f if line.strip()]
    except FileNotFoundError:
        return []


def write_jsonl(path: str, rows: List[dict]) -> None:
    Path(path).parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        for row in rows:
            f.write(json.dumps(row, ensure_ascii=False) + "\n")


async def process_mutant(
    mutant_code: str,
    bug_type: str,
    mutant_index: int,
    original: DesignEntry,
    client: LLMClient,
    config: Config,
    profile: Dict[str, tuple],
    profile_name: str,
) -> List[dict]:
    """Generate and validate `questions_n` questions for one mutant."""
    mutant_entry = DesignEntry(mutant_code)
    q_model, q_model_id = profile["questions"]
    v_model, v_model_id = profile["validation"]

    gens = create_generators(mutant_entry, client, config)
    raw = await asyncio.gather(
        *[gens.qg.generate(model=q_model, model_id=q_model_id, temperature=0.6) for _ in range(config.questions_n)],
        return_exceptions=True,
    )

    base = {
        "mutant_code": mutant_code,
        "mutant_hash": mutant_entry.hash,
        "bug_type": bug_type,
        "original_code": original.content,
        "original_design_hash": original.hash,
        "mutant_index": mutant_index,
        "model_profile": profile_name,
        "question_model": q_model_id or q_model,
        "validation_model": v_model_id or v_model,
    }

    async def validate_one(j: int, question) -> dict:
        row = {**base, "question_number": j + 1}
        if isinstance(question, Exception) or not str(question).strip():
            return {**row, "question_text": "", "question_valid": False, "solve_rate": 0.0,
                    "answers": [], "answer_statuses": [], "proof_strength": None,
                    "error": f"question generation failed: {question}"}
        # Fresh generators per question: the validator only ever sees this question text.
        qgens = create_generators(mutant_entry, client, config, question=question)
        try:
            await qgens.vqg.validate(model=v_model, model_id=v_model_id)
            err = None
        except Exception as e:
            err = str(e)
        v = qgens.vqg
        out = {**row, "question_text": question, "question_valid": v.valid_question,
               "solve_rate": v.solve_rate, "answers": v.generated_answers,
               "answer_statuses": v.answer_statuses, "proof_strength": v.proof_strength}
        if err:
            out["error"] = err
        return out

    rows = await asyncio.gather(*[validate_one(j, q) for j, q in enumerate(raw)])
    n_valid = sum(r["question_valid"] for r in rows)
    print(f"    mutant {mutant_index} ({bug_type}): {n_valid}/{len(rows)} questions valid")
    return list(rows)


async def process_single_design(
    verilog_code: str, client: LLMClient, config: Config, profile_name: str = "deepseek"
) -> dict:
    """Run the full mutation + question pipeline for one design."""
    profile = PROFILES[profile_name]
    design_entry = DesignEntry(verilog_code)
    print(f"\nProcessing design {design_entry.hash[:16]} [{profile_name}]")

    try:
        gens = create_generators(design_entry, client, config)

        b_model, b_model_id = profile["bugs"]
        bug_categories = await gens.mg.generate_bug_categories(model=b_model, model_id=b_model_id, temperature=0.7)
        print(f"  {len(bug_categories)} bug categories")

        m_model, m_model_id = profile["mutants"]
        mutants = await gens.mutg.generate_mutants(bug_categories, model=m_model, model_id=m_model_id, temperature=0.8)
        rejections = getattr(gens.mutg, "rejections", [])
        print(f"  {len(mutants)} mutants kept, {len(rejections)} rejected")

        per_mutant = await asyncio.gather(
            *[process_mutant(code, bug, i + 1, design_entry, client, config, profile, profile_name)
              for i, (code, bug) in enumerate(mutants)],
            return_exceptions=True,
        )
        questions: List[dict] = []
        for res in per_mutant:
            if isinstance(res, Exception):
                print(f"  error processing mutant: {res}")
                continue
            questions.extend(res)

        return {
            "design_hash": design_entry.hash,
            "original_code": verilog_code,
            "model_profile": profile_name,
            "bug_categories": bug_categories,
            "mutants": [{"bug_type": bug, "mutant_code": code} for code, bug in mutants],
            "mutant_rejections": rejections,
            "questions": questions,
            "total_mutants": len(mutants),
            "total_questions": len(questions),
            "valid_questions": sum(q["question_valid"] for q in questions),
        }
    except Exception as e:
        print(f"  error processing design: {e}")
        return {"design_hash": design_entry.hash, "model_profile": profile_name, "error": str(e)}


async def run(profile_name: str = "deepseek", only_missing: bool = False,
              limit: int = 0, output_path: str = "") -> List[dict]:
    config = Config("config.yaml")
    client = LLMClient(config)
    output_path = output_path or (GPT5_OUTPUT_PATH if profile_name == "gpt5" else config.output_path)

    designs = read_jsonl(config.original_designs_path)
    if only_missing:
        covered = {q.get("original_design_hash") for q in read_jsonl(config.output_path) if q.get("question_valid")}
        designs = [d for d in designs if DesignEntry(d["content"]).hash not in covered]
        print(f"{len(designs)} designs have no valid questions yet")
    if limit:
        designs = designs[:limit]
    if not designs:
        print("Nothing to process.")
        return []

    print(f"Processing {len(designs)} designs with profile '{profile_name}'")
    results = await asyncio.gather(*[process_single_design(d["content"], client, config, profile_name) for d in designs])

    questions = [q for r in results if "error" not in r for q in r["questions"]]
    write_jsonl(output_path, questions)
    write_jsonl(str(Path(output_path).with_name(Path(output_path).stem + "_designs.jsonl")),
                [{k: v for k, v in r.items() if k != "questions"} for r in results])

    valid = [q for q in questions if q["question_valid"]]
    tasks = {(q["original_design_hash"], q["mutant_hash"]) for q in valid}
    failed = sum("error" in r for r in results)
    print("\nSummary:")
    print(f"  designs: {len(results)} ({failed} failed)")
    print(f"  mutants kept: {sum(r.get('total_mutants', 0) for r in results)}")
    print(f"  questions: {len(questions)} ({len(valid)} valid)")
    print(f"  distinct valid tasks (design, mutant): {len(tasks)}")
    print(f"  proven vs bounded: {sum(q['proof_strength'] == 'proven' for q in valid)} / "
          f"{sum(q['proof_strength'] == 'bounded' for q in valid)}")
    print(f"  written to {output_path}")
    return questions


def combine_questions() -> None:
    """Merge the main output with the GPT-5 output into results/questions_combined.jsonl."""
    config = Config("config.yaml")
    existing = read_jsonl(config.output_path)
    new = read_jsonl(GPT5_OUTPUT_PATH)
    if not new:
        print("No GPT-5 questions to combine.")
        return
    combined = existing + new
    out = "./results/questions_combined.jsonl"
    write_jsonl(out, combined)
    valid = sum(q.get("question_valid", False) for q in combined)
    print(f"Combined {len(existing)} + {len(new)} = {len(combined)} questions ({valid} valid) -> {out}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="cmd", required=True)
    r = sub.add_parser("run", help="run the mutation + question pipeline")
    r.add_argument("--profile", choices=sorted(PROFILES), default="deepseek")
    r.add_argument("--only-missing", action="store_true", help="skip designs that already have a valid question")
    r.add_argument("--limit", type=int, default=0, help="process only the first N designs")
    r.add_argument("--output", default="", help="output JSONL path")
    sub.add_parser("combine", help="merge main and GPT-5 outputs")
    args = parser.parse_args()

    start = time.time()
    if args.cmd == "run":
        asyncio.run(run(args.profile, args.only_missing, args.limit, args.output))
    else:
        combine_questions()
    print(f"Done in {time.time() - start:.1f}s")


if __name__ == "__main__":
    main()
