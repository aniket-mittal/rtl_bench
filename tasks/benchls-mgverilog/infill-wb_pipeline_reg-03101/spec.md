# Fill in the masked region of `mg_03101`

The file `mg_03101.v` holds a Verilog design whose top module is `mg_03101` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_03101`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03101.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03101` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03101.v`. Only these files are graded.

## Interface of `mg_03101`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `valid_wb_pipe_reg_i` | in | 1 |  |
| `rf_en_wb_pipe_reg_i` | in | 1 |  |
| `wb_sel_wb_pipe_reg_i` | in | 2 |  |
| `rd_wb_pipe_reg_i` | in | 5 |  |
| `alu_res_wb_pipe_reg_i` | in | 32 |  |
| `read_data_wb_pipe_reg_i` | in | 32 |  |
| `next_seq_pc_wb_pipe_reg_i` | in | 32 |  |
| `instr_retired_wb_pipe_reg_o` | out | 1 | |
| `rf_en_wb_pipe_reg_o` | out | 1 | |
| `wb_sel_wb_pipe_reg_o` | out | 2 | |
| `rd_wb_pipe_reg_o` | out | 5 | |
| `alu_res_wb_pipe_reg_o` | out | 32 | |
| `read_data_wb_pipe_reg_o` | out | 32 | |
| `next_seq_pc_wb_pipe_reg_o` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03101.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
