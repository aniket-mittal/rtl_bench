# Fill in the masked region of `origen_174718`

The file `origen_174718.v` holds a Verilog design whose top module is `origen_174718` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_174718`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_174718.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_174718` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_174718.v`. Only these files are graded.

## Interface of `origen_174718`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `inc_pc` | in | 32 |  |
| `read_data_1` | in | 32 |  |
| `read_data_2` | in | 32 |  |
| `sign_extended` | in | 32 |  |
| `rt` | in | 5 |  |
| `rd` | in | 5 |  |
| `mem_to_reg` | in | 1 |  |
| `reg_write` | in | 1 |  |
| `branch` | in | 1 |  |
| `mem_read` | in | 1 |  |
| `mem_write` | in | 1 |  |
| `reg_dest` | in | 1 |  |
| `alu_src` | in | 1 |  |
| `alu_op` | in | 3 |  |
| `inc_pc_reg` | out | 32 | |
| `read_data_1_reg` | out | 32 | |
| `read_data_2_reg` | out | 32 | |
| `sign_extended_reg` | out | 32 | |
| `rt_reg` | out | 5 | |
| `rd_reg` | out | 5 | |
| `mem_to_reg_reg` | out | 1 | |
| `reg_write_reg` | out | 1 | |
| `branch_reg` | out | 1 | |
| `mem_read_reg` | out | 1 | |
| `mem_write_reg` | out | 1 | |
| `reg_dest_reg` | out | 1 | |
| `alu_src_reg` | out | 1 | |
| `alu_op_reg` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_174718.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
