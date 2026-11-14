# taskgen

Builds the tasks in `../tasks/`. Two parts:

- **Generator** (this folder, adapted from [agctute/liveverilogeval](https://github.com/agctute/liveverilogeval)):
  turns verified Verilog designs into new spec + reference pairs by injecting bugs with an LLM.
- **Harness** (`harness/`, standard-library Python + iverilog + yosys): converts every source into the task format,
  checks each task, and grades submissions.

## Generator

For each seed design, `main.py`:

1. Asks an LLM for design-specific bug categories.
2. Asks an LLM to write one mutant per category. A mutant is kept only if Yosys proves it differs from the original
   and from every mutant already kept.
3. Asks an LLM to write specs for each mutant.
4. Validates each spec: a model sees only the spec and writes answers, and each answer is formally checked against the
   mutant. The spec is valid if at least one answer is equivalent. `solve_rate` and `proof_strength` are saved.

The mutant is the reference, so the spec describes the mutated behavior. That gives two tasks per (design, mutant):
`repair` (starter = original design) and `spec2rtl` (no starter).

Profiles in `main.py` pick the model per stage. `claude` needs no API keys: every call is a fresh headless
`claude -p` agent (Sonnet writes bugs, mutants and specs; Haiku validates).

```bash
cd taskgen
python3 -m venv .venv && .venv/bin/pip install -r requirements.txt
cp custom.yaml config.yaml                       # keys only needed for deepseek/gpt5 profiles
.venv/bin/python -W ignore test_pipeline_offline.py   # offline end-to-end test (fake LLM, real Yosys)

# 1. seed designs from ../sources -> designs.jsonl (top module renamed to dut, must elaborate in Yosys)
.venv/bin/python prepare_sources.py --out runs/designs.jsonl \
    basic_verilog verilog-uart verilog-i2c secworks-sha256 secworks-aes serv picorv32 verilog-eval
# 2. generate (set original_designs_path in config.yaml to that file)
.venv/bin/python -W ignore main.py run --profile claude --output runs/<name>_questions.jsonl
```

`runs/` keeps the generator's inputs and outputs (designs, questions, run logs).

## Harness

| script | does |
|---|---|
| `convert_open_source.py` | generator output (`runs/*_questions.jsonl`) -> `repair` + `spec2rtl` tasks |
| `convert_rtlbenchls.py` | RTL-BenchLS Task 2 -> `infill` tasks. The released masked files mask the whole design, so the mask is rebuilt: one always/assign/instance block per design |
| `convert_rtlbenchls_task1.py` | RTL-BenchLS Task 1 designs -> `infill` tasks (same masking) |
| `convert_rtlbenchls_task3.py` | RTL-BenchLS Task 3 GitHub issue fixes -> `repair` tasks (clones upstream repos into `~/.cache/rtl_bench_repos`) |
| `convert_specs.py` | RTLLM and verilog-eval problem statements -> `spec2rtl` tasks |
| `export_tasks.py` | intermediate task JSONs -> task folders in `../tasks/`, keeping only tasks whose reference passes its own tests and formal check (and whose repair starter fails) |
| `grade.py` | grade a submission against a task folder |
| `rtltask.py` | shared code: port discovery, vector testbenches, Yosys formal equivalence, synthesis |

Converters write intermediate JSONs (one per task, format in `harness/FORMAT.md`) to `build/<suite>/` (gitignored).
To rebuild everything:

```bash
cd taskgen/harness
python3 convert_open_source.py && python3 convert_rtlbenchls.py && python3 convert_rtlbenchls_task1.py \
  && python3 convert_rtlbenchls_task3.py && python3 convert_specs.py
python3 export_tasks.py --out ../../tasks --jobs 10 ../build/*
python3 test_rtltask.py      # harness unit tests
```

Equivalence results are `equivalent`, `bounded`, `different`, `unknown` (timeout, never a pass) or `error`.
