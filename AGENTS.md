# rtl_bench

RTL tasks for TrainRTL, plus the tooling that builds and grades them. The RL environment and training live in another repo.

`CLAUDE.md` is a symlink to this file. Edit `AGENTS.md`.

## Layout

```
tasks/      the tasks: one folder per task + index.jsonl. Committed, generated; do not hand-edit
taskgen/    generator (LLM bug injection, forked from agctute/liveverilogeval) and harness/ (convert, export, grade)
sources/    upstream designs and benchmarks, read-only
RTLBot_Proposal.txt   project proposal (background only)
```

- `sources/` is a read-only copy of upstream repos. Do not edit, reformat, or "fix" files there. Each folder keeps its upstream LICENSE; `sources/README.md` records source, license, and pinned commit. If you add a collection, add its row and its LICENSE.
- `sources/YOSYS_STATUS.md` lists which seed files Yosys cannot parse. Check it before debugging a parse failure.
- `tasks/<task>/` holds `spec.md`, the starter `.v`, read-only support files, `public_tb.v`, `hidden_tb.v`, `reference.v`, `task.json`. The format is in `tasks/README.md`. Regenerate folders with `taskgen/harness/export_tasks.py`; never edit them by hand.
- `taskgen/runs/open_source/` keeps generator inputs and outputs (designs, questions JSONL, run logs). `taskgen/build/` holds intermediate task JSONs and is gitignored.

## Setup

```bash
brew install yosys icarus-verilog
python3 -m venv taskgen/.venv && taskgen/.venv/bin/pip install -r taskgen/requirements.txt   # generator only
cp taskgen/custom.yaml taskgen/config.yaml   # API keys; not needed for the claude profile
```

Python 3.12+. `taskgen/config.yaml` holds API keys and is gitignored: never commit it, print it, or paste its contents anywhere. `taskgen/custom.yaml` is the tracked template; new config keys go there with a comment.

## Running

Generator scripts use paths relative to `taskgen/`; run them from there. Harness scripts live in `taskgen/harness/`, use only the standard library, and resolve their own paths.

```bash
cd taskgen && .venv/bin/python -W ignore test_pipeline_offline.py   # generator: offline end-to-end test, no keys
python3 taskgen/harness/test_rtltask.py                             # harness unit tests
python3 taskgen/harness/grade.py tasks/<task> <submission dir>      # grade one submission
```

Run `test_pipeline_offline.py` after changing `taskgen/main.py` or `taskgen/utils/`, and `test_rtltask.py` after changing the harness. There is no linter or CI. A full generator run makes many LLM calls; use `--limit` unless a full run was asked for. Rebuild steps are in `taskgen/README.md`.

## Conventions to keep

- Generator: the top module of every design, mutant, and answer is `dut`. Equivalence checking depends on it.
- Equivalence results are `equivalent`, `bounded`, `different`, `unknown`, or `error`. `unknown` (timeout) is never a pass. `bounded` passes only when `accept_bounded` / `equiv_accept_bounded` is true. Do not loosen this; a wrong "equivalent" silently produces bad tasks.
- A task folder exists only if its reference scores reward 1 with `grade.py` and, for repair tasks, the starter scores 0. `export_tasks.py` enforces this; keep it that way.
- Hidden data (`hidden_tb.v`, `reference.v`, anything in `task.json` `files.hidden`) must never be shown to the agent. Specs must not reveal the bug or the masked code.
- The validation model is fixed across generator profiles so `solve_rate` is comparable. Changing it invalidates difficulty labels (easy >= 0.75, medium >= 0.4, hard < 0.4).
- The `claude` profile runs each LLM call as a headless `claude -p` agent. Set `claude_cli_bin` in `config.yaml` if `claude` on PATH is old.

## Git

Commit on `main` and push directly; this repo does not use feature branches or PRs.
