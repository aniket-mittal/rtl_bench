# `tasks/` — evaluation examples & runner

Three task-specific examples plus one top-level runner, all built on the
[`rtlbenchls`](../rtlbenchls/) package. The framework owns prompt
construction, RTL extraction, mask splicing, concurrency, resume, and result
emission; you supply an LLM and a verifier.

| File | What it runs |
|---|---|
| `task1_round_trip/example_run.py`     | Round-trip reasoning on `data/slice_01.jsonl` (420 designs) |
| `task2_mask_infilling/example_run.py` | Masked-content reasoning on `data/masked_designs.jsonl` (425 records) |
| `task3_repo_issue/example_run.py`     | Repository-issue fixing on `data/repo_issue_108_cases.json` (108 cases) |
| `run_all.py`                          | Runs all three for one model, writes per-task JSONLs + summary |

## Two ways to run

### A. The CLI (no code editing)

```bash
pip install -e .

# Full Task 1 evaluation with your model + a real verifier:
python -m rtlbenchls.run --task 1 \
    --model mymodels:my_llm --verifier reference \
    --output results/task_1_round_trip/my-model.jsonl --progress

# equivalently, after install the console script is on PATH:
rtlbenchls --task 1 --model mymodels:my_llm --verifier noop --limit 20
```

`--model` and `--verifier` take a dotted path `module:callable`. `--verifier`
also accepts the built-ins `noop` (always-true, for plumbing tests) and
`reference` (Conformal/JasperGold template — see
[../docs/formal_verification.md](../docs/formal_verification.md)).

### B. The example scripts (edit `my_llm`, then run)

```bash
python3 tasks/task1_round_trip/example_run.py --limit 5      # smoke
python3 tasks/task1_round_trip/example_run.py --progress     # full 420
python3 tasks/run_all.py --model-slug my-model --workers 4   # all 3 tasks
```

## Flags (CLI and examples share these)

| Flag | Meaning | Default |
|---|---|---|
| `--limit N`     | Run only the first N records (after offset) | all |
| `--offset N`    | Skip the first N records (sharding/manual resume) | 0 |
| `--resume`      | Skip task_ids already present in the output JSONL | off |
| `--force`       | Ignore `--resume`; truncate output first (CLI only) | off |
| `--workers N`   | Concurrent LLM+verify workers (raise for API throughput) | 1 |
| `--progress`    | Per-design PASS/FAIL line on stderr | off |
| `--slice N`     | Task 1/2: use `data/slice_NN.jsonl` (CLI only) | 1 |
| `--spec-ratio`  | Task 1: NL-spec / RTL token ratio (paper r=1.0) | 1.0 |
| `--description-ratio` | Task 2: description / masked-block token ratio | 0.2 |
| `--repo-cache`  | Task 3: local clone directory | `repo_cache` |
| `--save-rtl`    | Store the generated RTL in each output record (CLI: `--save-rtl`) | off |

## What you supply

| Plug-in | Tasks | Signature |
|---|---|---|
| LLM | 1, 2, 3 | `(prompt, *, system, max_tokens, temperature) -> str` |
| Verifier | 1, 2, 3 | `(golden_rtl, revised_rtl, top_module, *, design_type, extra_files) -> bool` |
| Buggy-RTL fetcher | 3 only | `(case) -> str` — default: `make_fetchers(cache_dir="repo_cache")` |
| Golden-fix fetcher | 3 only | `(case) -> str` — same default |

## Output

Each run writes `results/task_<n>/<model>.jsonl` (one line per design) plus a
`<output>.summary.json` sidecar. The schema matches the shipped `results/`,
so `rtlbenchls.aggregate()` consumes both:

```python
from rtlbenchls import aggregate
aggregate("results/task_1_round_trip/my-model.jsonl", denominator=420)
```

## Evaluating on more slices

The release ships `data/slice_01.jsonl` (the paper's evaluation set). To
evaluate on slices 2–20, materialize them first (maintainer tool, needs the
upstream pipeline):

```bash
python3 scripts/build_slices.py 7          # writes data/slice_07.jsonl
python -m rtlbenchls.run --task 1 --slice 7 --model mymodels:my_llm --verifier reference
```
