# Fill in the masked region of `rtlpp_04960`

The file `rtlpp_04960.v` holds a Verilog design whose top module is `rtlpp_04960` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_04960`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_04960.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_04960` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_04960.v`. Only these files are graded.

## Interface of `rtlpp_04960`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `gmii_tx_d` | in | 8 |  |
| `gmii_tx_en` | in | 1 |  |
| `gmii_tx_err` | in | 1 |  |
| `reset_tx_clk` | in | 1 |  |
| `reset_rx_clk` | in | 1 |  |
| `address` | in | 5 |  |
| `read` | in | 1 |  |
| `writedata` | in | 16 |  |
| `write` | in | 1 |  |
| `reset` | in | 1 | reset, active high |
| `rxp` | in | 1 |  |
| `ref_clk` | in | 1 |  |
| `reconfig_clk` | in | 1 |  |
| `reconfig_togxb` | in | 4 |  |
| `gxb_cal_blk_clk` | in | 1 |  |
| `gmii_rx_d` | out | 8 | |
| `gmii_rx_dv` | out | 1 | |
| `gmii_rx_err` | out | 1 | |
| `tx_clk` | out | 1 | |
| `rx_clk` | out | 1 | |
| `readdata` | out | 16 | |
| `waitrequest` | out | 1 | |
| `txp` | out | 1 | |
| `reconfig_fromgxb` | out | 17 | |
| `led_an` | out | 1 | |
| `led_disp_err` | out | 1 | |
| `led_char_err` | out | 1 | |
| `led_link` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_04960.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
