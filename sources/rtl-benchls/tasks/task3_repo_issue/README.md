# Task 3: Repository-Issue Reasoning

## Overview

This task evaluates whether an LLM can **diagnose** a real hardware bug from a GitHub issue report and **fix** the corresponding RTL design.
Unlike Tasks 1 and 2, this requires cross-artifact reasoning: understanding bug descriptions, localizing the fault in a (potentially large) codebase, and producing a minimal correct fix.

## Dataset

108 cases from 6 real open-source hardware repositories:

| Repository | Description |
|------------|-------------|
| [lowRISC/ibex](https://github.com/lowRISC/ibex) | RISC-V CPU core |
| [lowRISC/opentitan](https://github.com/lowRISC/opentitan) | Open-source silicon root of trust |
| [openhwgroup/cv32e40p](https://github.com/openhwgroup/cv32e40p) | RISC-V CPU core |
| [openhwgroup/cvfpu](https://github.com/openhwgroup/cvfpu) | RISC-V FPU |
| [YosysHQ/picorv32](https://github.com/YosysHQ/picorv32) | Compact RISC-V CPU |
| [openrisc/mor1kx](https://github.com/openrisc/mor1kx) | OpenRISC processor |

All 108 cases are verified by dual equivalence checking: (1) buggy vs. fixed must be non-equivalent, and (2) the golden fix must pass formal verification.

Each case contains:
- `task_id`: identifier (`{repo}_{pr}_{issue}`)
- `repository`, `pr_number`, `issue_number`
- `pr_info`: PR title, body, author
- `issue_info`: bug description, labels
- `patches`: diff patches with the golden fix
- `verilog_files`: list of modified files

## Workflow

### Step 1: Provide Context

```
Input:  Buggy RTL file + GitHub issue description
Prompt: "The following Verilog design has a bug described in the issue below.
         Fix the bug and output the complete corrected module."
Output: Fixed Verilog module
```

- The LLM receives the full buggy RTL source and the issue description
- Temperature: 0.2

### Step 2: Formal Verification

The LLM's fix is compared against the golden (post-fix) design using:
- **SEC** for sequential designs (detected by clock port presence)
- **LEC** for combinational designs

Pass condition: formal tool proves equivalence between LLM fix and golden fix.

## Example

See `example_run.py` for a minimal example.

## Key Findings

- This is the hardest task: even the best model (DeepSeek-v3.2) fixes only 12% of bugs.
- Passing models consistently produce smaller diffs than failing ones.
- Common failure mode: over-engineering the fix (changing unrelated code).
