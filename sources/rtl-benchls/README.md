# RTL-BenchLS

A large-scale benchmark for evaluating LLMs on RTL reasoning and generation, featuring **10,028 formally verified Verilog designs** and three self-supervised evaluation tasks.

## Overview

Existing RTL benchmarks are small (50--200 designs), limited to specification-to-RTL generation, and increasingly saturated.
RTL-BenchLS addresses these limitations with two orders of magnitude more designs and three tasks that jointly evaluate reasoning and generation---all verified through formal equivalence checking without manual testbenches.

## Tasks

| Task | Description | Verification | Designs |
|------|-------------|-------------|---------|
| **Task 1: Round-Trip Reasoning** | Compress a design into an intermediate representation (NL, code, diagram) and reconstruct equivalent RTL | SEC/LEC | 10,028 |
| **Task 2: Masked-Content Reasoning** | Infer and reconstruct masked logic from surrounding context | SEC/LEC | 420 from Slice 1 |
| **Task 3: Repository-Issue Reasoning** | Diagnose and fix real bugs from GitHub issue reports | SEC/LEC | 108 |

See [`tasks/`](tasks/) for the per-task evaluation framework and example scripts.

## Repository layout

```
RTL-BenchLS/
├── data/                              # task datasets (see data/README.md)
│   ├── slice_01.jsonl                   Task 1: 420 designs from slice 1
│   ├── masked_designs.jsonl             Task 2: 425 masked records
│   └── repo_issue_108_cases.json        Task 3: 108 repo-issue cases
├── results/                           # per-model per-design outcomes (6 LLMs × 3 tasks)
│   ├── task_1_round_trip/<model>.jsonl
│   ├── task_2_masked_content/<model>.jsonl
│   ├── task_3_repo_issue/<model>.jsonl
│   └── results_summary.json
├── rtlbenchls/                        # Python evaluation package (pip install -e .)
├── tasks/                             # per-task examples + run_all.py
├── scripts/clone_repos.py             # one-time setup for Task 3
├── docs/formal_verification.md        # wiring Conformal / JasperGold / Formality
├── tests/                             # smoke tests for the framework
├── LICENSE                            # CC-BY-4.0 (data) + MIT (code)
└── pyproject.toml
```

## Quick start

```bash
git clone <this-repo>
cd RTL-BenchLS
pip install -e .

# One-time: clone the 9 upstream GitHub repos that Task 3 references (~1.6 GB).
python3 scripts/clone_repos.py

# Smoke-test on 5 designs each:
python3 tasks/task1_round_trip/example_run.py
python3 tasks/task2_mask_infilling/example_run.py
python3 tasks/task3_repo_issue/example_run.py

# Or run all three end-to-end:
python3 tasks/run_all.py
```

Each example expects you to implement a single function (`my_llm`) and optionally a verifier (`my_verify`). See [`tasks/README.md`](tasks/README.md) for the uniform call shape and [`docs/formal_verification.md`](docs/formal_verification.md) for hooking up Cadence Conformal, JasperGold, or Synopsys Formality (local, SSH-remote, or Docker).

## Dataset (`data/`)

Three release files. See [`data/README.md`](data/README.md) for the JSONL schemas.

| File | Records | What it contains |
|---|---|---|
| `slice_01.jsonl` | 420 | Verified designs from slice 1 with embedded LEC/SEC scripts |
| `masked_designs.jsonl` | 425 | Block + module masked variants with golden + masked + ref files |
| `repo_issue_108_cases.json` | 108 | Real GitHub PRs with issue metadata, patches, and commit SHAs |

### Source breakdown of the 10,028-design pool

| Bucket | Designs | Source |
|---|---|---|
| **S1: Real-World** | 971 | 25+ open-source repositories (NVDLA, OpenC910, HummingBird E200, zet, Verilog-Ethernet, etc.) |
| **S2: OriGen** | 2,708 | Augmented RTL corpus from [OriGen](https://arxiv.org/abs/2407.16237) |
| **S3: AutoVCoder** | 2,468 | Automatic Verilog generation corpus from [AutoVCoder](https://arxiv.org/abs/2407.18333) |
| **S4: RTLPP** | 2,164 | Parallel-processing RTL designs from [RTLPP](https://arxiv.org/abs/2502.13917) |
| **S5: MG-Verilog** | 1,717 | Multi-grained Verilog dataset from [MG-Verilog](https://arxiv.org/abs/2407.01910) |

## Results (`results/`)

Per-design pass/fail outcomes for 6 paper-cited LLMs across all 3 tasks, plus an aggregate summary cross-checked against the paper's Table 1 (all 18 cells within ±1.5pp). See [`results/README.md`](results/README.md).

Reproducing the aggregate:

```python
from rtlbenchls import aggregate
aggregate("results/task_1_round_trip/claude-sonnet-4.5.jsonl", denominator=420)
# {'n': 420, 'pass': 97, 'pass_pct': 23.1, ...}
```

## Evaluation framework (`rtlbenchls/`)

A pip-installable Python package that owns prompt construction, RTL extraction, mask splicing, and per-design JSONL emission. You implement two callables:

```python
def my_llm(prompt: str, *, system="", max_tokens=4096, temperature=0.0) -> str: ...
def my_verify(golden_rtl, revised_rtl, top_module, *, design_type, extra_files) -> bool: ...
```

The framework calls them, captures pass/fail, and writes results in the same JSONL schema as the shipped `results/`. See [`tasks/README.md`](tasks/README.md) for the full pattern.



## License

- Datasets under `data/` and `results/`: **CC-BY-4.0**.
- Evaluation framework and example code: **MIT**.

Designs derived from upstream open-source projects retain their original licenses; the `sources.json` field of each record names the upstream license. See [`LICENSE`](LICENSE) for full text.
