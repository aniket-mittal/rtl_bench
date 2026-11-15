# Fill in the masked region of `rtlpp_01194`

The file `rtlpp_01194.v` holds a Verilog design whose top module is `rtlpp_01194` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_01194`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01194.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01194` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01194.v`. Only these files are graded.

## Interface of `rtlpp_01194`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `i_cmd_write_stb` | in | 1 |  |
| `i_cmd_read_stb` | in | 1 |  |
| `i_cmd_data` | in | 8 |  |
| `i_enable` | in | 1 |  |
| `i_cmd_parameter` | in | 1 |  |
| `i_data_in` | in | 8 |  |
| `debug` | out | 32 | |
| `o_cmd_data` | out | 8 | |
| `o_cmd_finished` | out | 1 | |
| `o_cmd_mode` | out | 1 | |
| `o_write` | out | 1 | |
| `o_read` | out | 1 | |
| `o_data_out` | out | 8 | |
| `o_data_out_en` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01194.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
