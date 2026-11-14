# Task 2: Masked-Content Reasoning

## Overview

This task evaluates whether an LLM can **infer** the function of a masked code region from surrounding context and **reconstruct** the masked logic.
A random `always` block, `assign` statement, or sub-module is replaced with `[MASKED]`, and the LLM must recover it in two steps.

## Mask Types

One mask is applied per design at one of two granularities, yielding **420 masked designs** total on Slice 1:

| Type | Description |
|------|-------------|
| **Block** | One `always`/`assign`/`case` block (>20 tokens) masked per design |
| **Module** | One sub-module instantiation masked per design (designs with >=2 modules) |

## Workflow

### Step 1: Generate Description

```
Input:  Masked RTL (with [MASKED] placeholder) + actual masked code
Prompt: "Write a VERY concise, brief description of the masked region's function (3-10 words)."
Output: Short natural-language description
```

- The LLM sees both the context and the masked code
- Max output tokens: `int(block_tokens * 0.2)` (compressed description)

### Step 2: Recover Masked Block

```
Input:  Masked RTL (with [MASKED] placeholder) + description from Step 1
Prompt: "Generate ONLY the Verilog RTL for the masked region. No explanation, no markdown."
Output: Verilog code block to replace [MASKED]
```

- The LLM sees only the context and its own description (not the original masked code)
- The recovered block is spliced back into the context to form the full design

### Step 3: Formal Verification

The reconstructed design is compared against the golden (unmasked) design using SEC/LEC.

## Dataset

Uses `masked_designs.jsonl` (block- and module-level masks combined).
Each record contains:
- `task_id`: unique identifier (e.g., `mg_05849_block_5`)
- `mask_type`: "block" or "module"
- `design_name`: source design name
- `files`: dictionary with full RTL, verification scripts
- `mask_block_index` / `mask_module_index`: index of masked element

The masked designs are derived from the same 10K design pool as Task 1, with masking applied by `create_masked_dataset.py`.

## Example

See `example_run.py` for a minimal example of the two-step prompting workflow.

## Key Findings

- Masked-content reasoning shows the most uniform performance across models (20--28%).
- Almost all failures are functional (not syntax), confirming semantic understanding is the bottleneck.
- Performance remains relatively stable across design complexity (LoC).
