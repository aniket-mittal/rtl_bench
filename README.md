# LiveVerilogEval

Generates fresh RTL design tasks by mutating verified Verilog designs, writing a
LeetCode-style spec for each mutant, and formally validating that the spec pins
the mutant down.

## Pipeline

For each design in `data/designs.jsonl`:

1. **Bug categories.** An LLM proposes design-specific bug categories.
2. **Mutants.** An LLM rewrites the design to introduce each selected bug. A
   mutant is kept only if it elaborates in Yosys, Yosys finds a counterexample
   against the original (so it really is a different circuit), and it is not
   equivalent to a mutant already kept for that design. Rejections and reasons
   are recorded in `*_designs.jsonl`.
3. **Questions.** An LLM writes `questions_n` specs per mutant, describing the
   behavior functionally rather than as pseudocode.
4. **Validation.** A model sees only the question text and samples
   `question_validation_n` answers. Each is formally checked against the
   mutant. A question is valid if at least one sample is equivalent;
   `solve_rate` (passing samples / n) is saved as a difficulty signal.

### Equivalence checking

`utils/equivalence_check.py` builds a Yosys miter and runs temporal induction
(`sat -tempinduct`), whose base case is a bounded model check from the all-zero
state. Each check returns one of:

| status | meaning |
|---|---|
| `equivalent` | proven by induction |
| `bounded` | no counterexample within `equiv_max_steps`, but induction did not close (common for correct designs that encode state differently) |
| `different` | counterexample found |
| `unknown` | timed out (never counted as equivalent) |
| `error` | failed to parse or elaborate |

`equiv_accept_bounded` controls whether `bounded` counts as passing. Each saved
question records `proof_strength` (`proven` or `bounded`) so you can filter for
proof-only labels.

Known limitation: checks start from the all-zero state rather than modeling a
reset sequence, so bugs that only appear with non-zero initial state are not
caught.

## Prerequisites

1. Python 3.12+ and `pip install -r requirements.txt`
2. [Yosys](https://yosyshq.readthedocs.io/projects/yosys/en/latest/getting_started/installation.html)
   (or `pip install yowasp-yosys` and set `yosys_bin: yowasp-yosys`; works but is much slower,
   and memory-heavy designs may hit the timeout)
3. [Icarus Verilog](https://steveicarus.github.io/iverilog/) (`iverilog`), which pyverilog uses as its preprocessor
4. `cp custom.yaml config.yaml` and fill in API keys

## How to run

```bash
python process_designs.py                 # optional: rebuild data/designs.jsonl
python main.py run --limit 2              # smoke test on 2 designs
python main.py run                        # DeepSeek profile, all designs
python main.py run --profile gpt5 --only-missing
python run_benchmark.py results/questions.jsonl --model deepseek --k 5
python -m utils.equivalence_check         # check every RTLLM design against itself
python -W ignore test_pipeline_offline.py # offline end-to-end test (fake LLM, real Yosys)
```

Output rows (`results/questions.jsonl`) include `question_valid`, `solve_rate`,
`answer_statuses`, `proof_strength`, `bug_type`, `mutant_code` and `original_code`.

Note: the JSONL files already in `results/` were produced before these fixes
(20-step bounded check, timeouts counted as equivalent, no check that mutants
differ from the original), so their `question_valid` labels are not reliable.
Regenerate before using them.
