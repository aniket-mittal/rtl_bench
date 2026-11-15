# Fill in the masked region of `rtlpp_04644`

The file `rtlpp_04644.v` holds a Verilog design whose top module is `rtlpp_04644` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_04644`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_04644.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_04644` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_04644.v`. Only these files are graded.

## Interface of `rtlpp_04644`

| port | dir | width | note |
|---|---|---|---|
| `wb_clk` | in | 1 | clock, rising edge |
| `wb_rst` | in | 1 | reset, active high |
| `equation_enable` | in | 1 |  |
| `dsp_input0_reg` | in | 32 |  |
| `dsp_input1_reg` | in | 32 |  |
| `dsp_input2_reg` | in | 32 |  |
| `dsp_input3_reg` | in | 32 |  |
| `dsp_input4_reg` | in | 32 |  |
| `file_read_data` | in | 32 |  |
| `file_active` | in | 1 |  |
| `rd_ptr` | in | 32 |  |
| `wr_ptr` | in | 32 |  |
| `interrupt` | out | 1 | |
| `error` | out | 1 | |
| `file_num` | out | 8 | |
| `file_write` | out | 1 | |
| `file_read` | out | 1 | |
| `file_write_data` | out | 32 | |
| `equation_done` | out | 1 | |
| `dsp_output0_reg` | out | 32 | |
| `dsp_output1_reg` | out | 32 | |
| `dsp_output2_reg` | out | 32 | |
| `dsp_output3_reg` | out | 32 | |
| `dsp_output4_reg` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_04644.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
