# Fill in the masked region of `mg_06163`

The file `mg_06163.v` holds a Verilog design whose top module is `mg_06163` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `mg_06163` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_06163.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_06163` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_06163.v`. Only these files are graded.

## Interface of `mg_06163`

| port | dir | width | note |
|---|---|---|---|
| `flush_except` | in | 1 |  |
| `flush_branch` | in | 1 |  |
| `if_stall` | in | 1 |  |
| `lsu_stall` | in | 1 |  |
| `multicycle_cnt` | in | 2 |  |
| `asyn_stall` | in | 1 |  |
| `flushpipe` | out | 1 | |
| `pc_freeze` | out | 1 | |
| `if_freeze` | out | 1 | |
| `id_freeze` | out | 1 | |
| `ex_freeze` | out | 1 | |
| `wb_freeze` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_06163.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
