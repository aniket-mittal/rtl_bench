# `data/` — task datasets

Three JSONL/JSON files, one per task. Every Task 1 / Task 2 record carries
its own embedded LEC/SEC script so the formal-verification harness is
reproducible from a clone alone.

## Files

| File | Records | Task | Description |
|---|---|---|---|
| `slice_01.jsonl` | 420 | 1 | Verified designs from slice 1 (paper's eval set) |
| `slice_02.jsonl` … `slice_20.jsonl` | 484–494 each (9 278 total) | 1 | Verified designs from the remaining 19 partitions of the 10k pool |
| `masked_designs.jsonl` | 425 | 2 | Block + module masked variants |
| `repo_issue_108_cases.json` | 108 | 3 | Real GitHub PRs (issue + patches + commit SHAs) |

**Task 1 total: 9 698 verified designs** across all 20 slices.

The paper headline of 420 for Task 2 refers to the "one mask per design"
count; the shipped file is the full 425-record set the experiments actually
evaluated on (399 block + 26 module).

## Task 1 schema (`slice_01.jsonl`)

One design per line:

```json
{
  "task_id": "mg_00600",
  "design_name": "mg_00600",
  "top_module": "mg_00600",
  "origin": "RTL-Dataset-MG-Verilog",
  "origin_bucket": "S5",
  "loc": 21,
  "n_modules": 1,
  "design_type": "sequential",
  "verification_tool": "jaspergold",
  "verification_type": "SEC",
  "primary_script_key": "sec_mg_00600.tcl",
  "files": {
    "mg_00600.v":           "module mg_00600 ...",
    "mg_00600_combined.v":  "...",
    "sec_mg_00600.tcl":     "<JasperGold SEC TCL script>",
    "lib.v":                "...",
    "sources.json":         "<upstream provenance>"
  }
}
```

- `design_type` is `combinational` → use LEC (Conformal / Formality with the
  `conformal_rtl_*.do` / `fm_rtl_*.tcl` script), `sequential` → use SEC
  (JasperGold with the `sec_*.tcl` script).
- `primary_script_key` names the canonical script in `files`.
- The 8 designs sharing the generic top name `rtl` are disambiguated with a
  `_0`…`_7` suffix on `task_id`.

## Task 2 schema (`masked_designs.jsonl`)

```json
{
  "task_id": "mg_05849_block_5",
  "parent_design": "mg_05849",
  "top_module": "mg_05849",
  "origin": "RTL-Dataset-MG-Verilog",
  "origin_bucket": "S5",
  "loc": 21,
  "design_type": "sequential",
  "mask_type": "block",
  "mask_index": 5,
  "mask_target_module": null,
  "verification_tool": "jaspergold",
  "verification_type": "SEC",
  "primary_script_key": "sec_mg_05849.tcl",
  "ref_rtl": "<golden contents of the masked region>",
  "golden_rtl_key": "mg_05849.v",
  "masked_rtl_key": "mg_05849_masked.v",
  "files": {
    "mg_05849.v":         "module mg_05849 ...",
    "mg_05849_masked.v":  "module mg_05849 ... [MASKED] ...",
    "mg_05849_combined.v": "...",
    "sec_mg_05849.tcl":   "<SEC TCL>",
    "lib.v":              "...",
    "sources.json":       "..."
  }
}
```

- `mask_type` ∈ `{block, module}`.
- `golden_rtl_key` / `masked_rtl_key` point into `files`. The evaluation
  harness compares the original golden against the LLM's reconstruction
  (masked text with the recovered block spliced back in).
- `ref_rtl` is the exact golden text of the masked region (what the LLM
  must reproduce semantically, though not byte-for-byte).

## Task 3 schema (`repo_issue_108_cases.json`)

Top-level shape `{"description": ..., "total": 108, "cases": [...]}`. One case:

```json
{
  "task_id": "YosysHQ_picorv32_229_228",
  "repository": "YosysHQ/picorv32",
  "pr_number": 229,
  "issue_number": 228,
  "pr_url": "https://github.com/YosysHQ/picorv32/pull/229",
  "issue_url": "https://github.com/YosysHQ/picorv32/issues/228",
  "base_commit": "f00a88c36eaab478b64ee27d8162e421049bcc66",
  "head_commit": "29102c00a82ffd08f1e0b3c9cbac1c95c17f573b",
  "base_ref": "master",
  "verilog_files": ["picorv32.v"],
  "patches":   [{"filename": "...", "patch": "@@ -... @@ ..."}],
  "additions": 6,
  "deletions": 2,
  "pr_info":    {"title": "...", "body": "...", "state": "merged", ...},
  "issue_info": {"title": "...", "body": "...", "state": "closed", ...},
  "source_info": {"source_file": "...", "line_number": ..., "verified": true},
  "lec_status": "useful_pass"
}
```

- `base_commit` is the buggy revision; `head_commit` is the merged fix.
- The buggy RTL and golden fix are NOT inlined — clone the upstream repo
  with `python3 scripts/clone_repos.py` and use
  `rtlbenchls.make_fetchers()` (or write your own fetcher).
- `lec_status` reflects the upstream pre-verification triage; `useful_pass`
  means the change is meaningful for formal evaluation.

## Loading the data

```python
from rtlbenchls import load_task1, load_task2, load_task3

# Stream typed records (one record per line of the JSONL).
for rec in load_task1("data/slice_01.jsonl"):
    rtl = rec["rtl"]                 # golden Verilog
    top = rec["top_module"]
    extras = rec["extra_files"]      # lib.v, SEC/LEC scripts, sources.json
    ...

for rec in load_task2("data/masked_designs.jsonl"):
    masked = rec["masked_rtl"]       # design with [MASKED] sentinel
    ref = rec["ref_block"]            # golden contents of the masked region
    ...

for case in load_task3("data/repo_issue_108_cases.json"):
    base = case["base_commit"]        # buggy revision
    head = case["head_commit"]        # golden fix
    ...
```

## Slices beyond 1 (the full 10k pool)

The benchmark draws from a 10 000-design pool partitioned into 20 slices of
~500 designs each. The released slice files are:

- `slice_01.jsonl` — paper's evaluation set, **420 verified-pass** designs.
  This slice uses a stricter filter that additionally requires the full
  yosys/iverilog testbench-generation pipeline to succeed (this is the
  manifest the paper's results in `results/task_1_round_trip/*` were
  generated against).
- `slice_02.jsonl` … `slice_20.jsonl` — each containing the **formal-pass
  subset** of the corresponding upstream partition (typically 484–494
  designs; **9 278 designs total**).

"Formal-pass" means each design's embedded `sec_*.tcl` /
`conformal_rtl_*.do` / `fm_rtl_*.tcl` script was driven against the design's
golden RTL on both the spec and impl sides; the design is shipped only if
the tool concluded `proven` (JasperGold) or `Equivalent` (Conformal)
without script errors. This is the same verifier the `rtlbenchls.run` CLI
calls against your LLM's output, so a verified design is one where the
script is known to terminate cleanly on a correct input.

The CLI selects a slice by number:

```bash
python -m rtlbenchls.run --task 1 --slice 7 \
    --model mymodel:my_llm --verifier reference
```

For how to wire up a formal-equivalence tool — locally installed,
inside a Docker image, or on a remote SSH server — see
[`docs/formal_verification.md`](../docs/formal_verification.md). It covers
all three deployment modes with no hardcoded host names or paths.
