# taskgen

Turns existing verified Verilog designs into new RTL tasks. For each design it:

1. Asks an LLM for design-specific bug categories.
2. Asks an LLM to write a mutant for each bug. A mutant is kept only if Yosys proves it differs from the original and from every mutant already kept.
3. Asks an LLM to write a spec (question) for each mutant.
4. Validates each question: a model sees only the question text and writes answers, and each answer is formally checked against the mutant. The question is valid if at least one answer is equivalent. `solve_rate` and `proof_strength` are saved with each question.

Equivalence checks use Yosys `sat -tempinduct`. Results are `equivalent`, `bounded`, `different`, `unknown` (timeout, never counted as a pass), or `error`.

## Setup

1. Python 3.12+ and `pip install -r requirements.txt`
2. [Yosys](https://yosyshq.readthedocs.io/projects/yosys/en/latest/getting_started/installation.html)
3. [Icarus Verilog](https://steveicarus.github.io/iverilog/) (`iverilog`)
4. `cp custom.yaml config.yaml` and fill in API keys

## Run

```bash
python main.py run --limit 2              # smoke test on 2 designs
python main.py run                        # all designs, DeepSeek profile
python main.py run --profile gpt5 --only-missing
python run_benchmark.py results/questions.jsonl --model deepseek --k 5
python -W ignore test_pipeline_offline.py # offline end-to-end test (fake LLM, real Yosys)
```

Output goes to `results/questions.jsonl` (not tracked in git; regenerate locally).

## Credits

Adapted from [agctute/liveverilogeval](https://github.com/agctute/liveverilogeval). Seed designs in `../sources/rtllm/` are from [RTLLM](https://github.com/hkust-zhiyao/RTLLM).
