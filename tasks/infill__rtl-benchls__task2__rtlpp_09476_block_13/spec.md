# Fill in the masked region of `rtlpp_09476`

The file `rtlpp_09476.v` holds a Verilog design whose top module is `rtlpp_09476` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_09476`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_09476.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_09476` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_09476.v`. Only these files are graded.

## Interface of `rtlpp_09476`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `ff_tx_data` | in | 32 |  |
| `ff_tx_eop` | in | 1 |  |
| `ff_tx_err` | in | 1 |  |
| `ff_tx_mod` | in | 2 |  |
| `ff_tx_sop` | in | 1 |  |
| `ff_tx_wren` | in | 1 |  |
| `ff_tx_clk` | in | 1 |  |
| `ff_rx_rdy` | in | 1 |  |
| `ff_rx_clk` | in | 1 |  |
| `address` | in | 8 |  |
| `read` | in | 1 |  |
| `writedata` | in | 32 |  |
| `write` | in | 1 |  |
| `reset` | in | 1 | reset, active high |
| `mdio_in` | in | 1 |  |
| `rxp` | in | 1 |  |
| `ref_clk` | in | 1 |  |
| `ff_tx_rdy` | out | 1 | |
| `ff_rx_data` | out | 32 | |
| `ff_rx_dval` | out | 1 | |
| `ff_rx_eop` | out | 1 | |
| `ff_rx_mod` | out | 2 | |
| `ff_rx_sop` | out | 1 | |
| `rx_err` | out | 6 | |
| `readdata` | out | 32 | |
| `waitrequest` | out | 1 | |
| `mdio_out` | out | 1 | |
| `mdio_oen` | out | 1 | |
| `mdc` | out | 1 | |
| `led_an` | out | 1 | |
| `led_char_err` | out | 1 | |
| `led_link` | out | 1 | |
| `led_disp_err` | out | 1 | |
| `led_crs` | out | 1 | |
| `led_col` | out | 1 | |
| `txp` | out | 1 | |
| `rx_recovclkout` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_09476.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
