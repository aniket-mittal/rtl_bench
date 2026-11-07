# Task 1: Round-Trip Reasoning

RTL -> Intermediate Representation -> RTL

## Overview

This task evaluates whether an LLM can **compress** a Verilog design into an intermediate representation and then **reconstruct** functionally equivalent RTL from that representation alone.
The round-trip formulation is self-supervised: the original design serves as the golden reference, requiring no manual specification or testbench.

## Abstract Representations

We evaluate four types of intermediate representations:

| Abstract | Notation | Intermediate Format |
|----------|----------|-------------------|
| Natural Language | A_NL | Plain-English specification |
| Code | A_Code | Python or C translation |
| Free-form | A_Free | Unconstrained (LLM chooses format) |
| Diagram | A_Diag | Category-specific structured format (FSM tables, truth tables, timing diagrams) |

## Workflow

### Step 1: RTL -> Specification (or Code)

```
Input:  Golden Verilog module
Prompt: "Write a plain-English specification for the following Verilog module.
         Do NOT include any Verilog code."
Output: Intermediate representation (NL / Code / Free-form / Diagram)
```

- Temperature: 0.2
- Max output tokens: `int(rtl_tokens * spec_length_ratio)` where `spec_length_ratio` controls compression (default 0.5 or 1.0)

### Step 2: Specification -> RTL

```
Input:  Intermediate representation from Step 1
Prompt: "Generate the Verilog module based on the following specification.
         Output only the single module (module <top_module> ... endmodule)."
Output: Reconstructed Verilog module
```

- Max output tokens: 8192

### Step 3: Formal Verification

The reconstructed RTL is compared against the golden design using:
- **SEC** (Sequential Equivalence Checking) for sequential designs
- **LEC** (Logic Equivalence Checking) for combinational designs

Pass condition: formal tool proves functional equivalence.

## Dataset

Uses `balanced_patches_10k/` (20 patches of ~500 designs each).
Each record contains:
- `design_name`: unique identifier
- `origin`: source dataset
- `files`: dictionary with golden RTL, verification scripts, and combined module files

## Example

See `example_run.py` for a minimal example that demonstrates the two-step LLM prompting workflow.

## Key Findings

- Code-based round-trips (A_Code) substantially outperform NL round-trips (A_NL): Sonnet-4.5 achieves 52.1% via Python vs. 23.1% via NL.
- Diagram-based representations achieve the highest pass rates (65--93%) for suitable design categories.
- Even functionally imperfect code translations preserve enough structural cues for successful RTL reconstruction.
