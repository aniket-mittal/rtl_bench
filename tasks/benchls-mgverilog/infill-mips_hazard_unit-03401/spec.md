# Fill in the masked region of `mg_03401`

The file `mg_03401.v` holds a Verilog design whose top module is `mg_03401` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_03401`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03401.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03401` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03401.v`. Only these files are graded.

## Interface of `mg_03401`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `ex_dst_reg` | in | 5 |  |
| `mem_dst_reg` | in | 5 |  |
| `id_rs` | in | 5 |  |
| `id_rt` | in | 5 |  |
| `wb_done_i` | in | 1 |  |
| `mem_opcode` | in | 6 |  |
| `ex_opcode` | in | 6 |  |
| `id_opcode` | in | 6 |  |
| `id_rt_is_source` | in | 1 |  |
| `ex_reg_write` | in | 1 |  |
| `mem_reg_write` | in | 1 |  |
| `pstop_o` | out | 1 | |
| `pc_write` | out | 1 | |
| `if_id_write_en` | out | 1 | |
| `hazard_detected_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03401.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
