# Fill in the masked region of `rtlpp_03806`

The file `rtlpp_03806.v` holds a Verilog design whose top module is `rtlpp_03806` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_03806`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_03806.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_03806` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_03806.v`. Only these files are graded.

## Interface of `rtlpp_03806`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset_` | in | 1 | reset, active high |
| `tx_mac_wr` | in | 1 |  |
| `tx_mac_data` | in | 64 |  |
| `rx_mac_rd` | in | 1 |  |
| `cs_fifo_rd_en` | in | 1 |  |
| `gmii_rxd` | in | 8 |  |
| `gmii_rx_er` | in | 1 |  |
| `host_addr_reg` | in | 16 |  |
| `SYS_ADDR` | in | 4 |  |
| `fail_over` | in | 1 |  |
| `fmac_ctrl` | in | 32 |  |
| `fmac_ctrl1` | in | 32 |  |
| `fmac_rxd_en` | in | 1 |  |
| `mac_pause_value` | in | 32 |  |
| `mac_addr0` | in | 48 |  |
| `reg_rd_start` | in | 1 |  |
| `fmac_speed` | in | 2 |  |
| `gmii_rx_dv` | in | 1 |  |
| `tx_mac_full` | out | 1 | |
| `tx_mac_usedw` | out | 13 | |
| `rx_mac_data` | out | 64 | |
| `rx_mac_ctrl` | out | 8 | |
| `rx_mac_empty` | out | 1 | |
| `cs_fifo_empty` | out | 1 | |
| `ipcs_fifo_dout` | out | 64 | |
| `gmii_txd` | out | 8 | |
| `xauiA_linkup` | out | 1 | |
| `reg_rd_done_out` | out | 1 | |
| `gmii_tx_er` | out | 1 | |
| `FMAC_REGDOUT` | out | 32 | |
| `FIFO_OV_IPEND` | out | 1 | |
| `gmii_tx_en` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_03806.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
