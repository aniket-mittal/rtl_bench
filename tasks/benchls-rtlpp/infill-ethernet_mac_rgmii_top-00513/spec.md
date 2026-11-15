# Fill in the masked region of `rtlpp_00513`

The file `rtlpp_00513.v` holds a Verilog design whose top module is `rtlpp_00513` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_00513`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_00513.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_00513` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_00513.v`. Only these files are graded.

## Interface of `rtlpp_00513`

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
| `rgmii_in` | in | 4 |  |
| `rx_control` | in | 1 |  |
| `tx_clk` | in | 1 |  |
| `rx_clk` | in | 1 |  |
| `set_10` | in | 1 |  |
| `set_1000` | in | 1 |  |
| `mdio_in` | in | 1 |  |
| `ff_tx_rdy` | out | 1 | |
| `ff_rx_data` | out | 32 | |
| `ff_rx_dval` | out | 1 | |
| `ff_rx_eop` | out | 1 | |
| `ff_rx_mod` | out | 2 | |
| `ff_rx_sop` | out | 1 | |
| `rx_err` | out | 6 | |
| `readdata` | out | 32 | |
| `waitrequest` | out | 1 | |
| `rgmii_out` | out | 4 | |
| `tx_control` | out | 1 | |
| `ena_10` | out | 1 | |
| `eth_mode` | out | 1 | |
| `mdio_out` | out | 1 | |
| `mdio_oen` | out | 1 | |
| `mdc` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_00513.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
