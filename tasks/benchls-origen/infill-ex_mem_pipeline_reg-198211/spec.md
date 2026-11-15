# Fill in the masked region of `origen_198211`

The file `origen_198211.v` holds a Verilog design whose top module is `origen_198211` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_198211`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_198211.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_198211` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_198211.v`. Only these files are graded.

## Interface of `origen_198211`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `pc_value` | in | 32 |  |
| `pc_plus_imm` | in | 32 |  |
| `alu_result` | in | 32 |  |
| `rd2` | in | 32 |  |
| `rd` | in | 5 |  |
| `mem_read` | in | 1 |  |
| `mem_write` | in | 1 |  |
| `memToReg` | in | 1 |  |
| `branch` | in | 1 |  |
| `reg_write` | in | 1 |  |
| `zero` | in | 1 |  |
| `flush` | in | 1 |  |
| `prediction` | in | 1 |  |
| `pc_value_reg` | out | 32 | |
| `pc_plus_imm_reg` | out | 32 | |
| `alu_result_reg` | out | 32 | |
| `rd2_reg` | out | 32 | |
| `rd_reg` | out | 5 | |
| `mem_read_reg` | out | 1 | |
| `mem_write_reg` | out | 1 | |
| `memToReg_reg` | out | 1 | |
| `branch_reg` | out | 1 | |
| `reg_write_reg` | out | 1 | |
| `zero_reg` | out | 1 | |
| `prediction_reg` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_198211.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
