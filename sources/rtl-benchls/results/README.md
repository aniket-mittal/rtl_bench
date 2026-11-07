# `results/` — per-model per-design outcomes

Per-design pass/fail outcomes for the 6 LLMs cited in the paper, plus an
aggregate summary cross-checked against the paper's Table 1 (every cell
within ±1.5 pp).

## Layout

```
results/
├── task_1_round_trip/<model>.jsonl       # 420 lines per file
├── task_2_masked_content/<model>.jsonl   # 425 lines per file
├── task_3_repo_issue/<model>.jsonl       # 108 lines per file
└── results_summary.json
```

Six models are shipped (Table tab:challenging-comparison + tab:unified):
`gpt-4o`, `claude-sonnet-4.5`, `claude-haiku-4.5`, `deepseek-v3.2`,
`qwen3.5-397b`, `llama-3.3-70b`.

## Per-design schema

Each line of `task_<n>/<model>.jsonl`:

```json
{"task_id": "mg_00600", "passed": true, "verification_type": "SEC"}
```

- `task_id` — matches the corresponding `data/` file's `task_id`.
- `passed` — true iff the LLM's RTL was proven equivalent to the golden.
- `verification_type` — `LEC` (combinational) or `SEC` (sequential).
  Value `"missing"` means the LLM-pipeline never produced a candidate to
  verify (counts as fail when aggregating).

Task 3 records also carry a `classification` field
(`useful_pass` / `useless_pass`) inherited from the upstream pre-verification
manifest.

## Reproducing the aggregate

`results_summary.json` is recomputed from the per-design files:

```python
from rtlbenchls import aggregate
print(aggregate("results/task_1_round_trip/claude-sonnet-4.5.jsonl",
                denominator=420))
# {'n': 420, 'pass': 97, 'errors': 0, 'pass_pct': 23.1, ...}
```

All 18 (model × task) cells in `results_summary.json` were validated against
the paper (every cell within ±1.5 pp). `passed` reflects formal LEC/SEC
equivalence between the LLM's generated RTL and the golden reference, parsed
from the verification logs.

## Adding your own model

Run any of:

```bash
# Full Task 1 evaluation:
python -m rtlbenchls.run --task 1 \
    --model mymodels:my_llm --verifier reference \
    --output results/task_1_round_trip/my-model.jsonl --progress

# Or all three tasks at once:
python3 tasks/run_all.py --model-slug my-model --workers 4 --progress
```

Output JSONLs land in this directory and are immediately consumable by
`aggregate()`. See [`tasks/README.md`](../tasks/README.md) for the full flag
table and [`docs/formal_verification.md`](../docs/formal_verification.md) for
wiring Conformal / JasperGold / Formality.
