# Fill in the masked region of `mg_05423`

The file `mg_05423.v` holds a Verilog design whose top module is `mg_05423` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_05423`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_05423.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_05423` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_05423.v`. Only these files are graded.

## Interface of `mg_05423`

| port | dir | width | note |
|---|---|---|---|
| `ck_1356meg` | in | 1 |  |
| `adc_d` | in | 8 |  |
| `pwr_lo` | out | 1 | |
| `pwr_hi` | out | 1 | |
| `pwr_oe1` | out | 1 | |
| `pwr_oe2` | out | 1 | |
| `pwr_oe3` | out | 1 | |
| `pwr_oe4` | out | 1 | |
| `adc_clk` | out | 1 | |
| `ssp_frame` | out | 1 | |
| `ssp_din` | out | 1 | |
| `ssp_clk` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_05423.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
