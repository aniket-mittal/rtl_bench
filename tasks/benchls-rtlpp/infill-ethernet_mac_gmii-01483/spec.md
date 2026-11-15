# Fill in the masked region of `rtlpp_01483`

The file `rtlpp_01483.v` holds a Verilog design whose top module is `rtlpp_01483` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_01483` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01483.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01483` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01483.v`. Only these files are graded.

## Interface of `rtlpp_01483`

| port | dir | width | note |
|---|---|---|---|
| `gtx_clk` | in | 1 |  |
| `glbl_rstn` | in | 1 | reset, active low |
| `rx_axi_rstn` | in | 1 |  |
| `tx_axi_rstn` | in | 1 |  |
| `tx_ifg_delay` | in | 8 |  |
| `tx_axis_mac_tdata` | in | 8 |  |
| `tx_axis_mac_tvalid` | in | 1 |  |
| `tx_axis_mac_tlast` | in | 1 |  |
| `tx_axis_mac_tuser` | in | 1 |  |
| `pause_req` | in | 1 |  |
| `pause_val` | in | 16 |  |
| `clk_enable` | in | 1 |  |
| `gmii_rxd` | in | 8 |  |
| `gmii_rx_dv` | in | 1 |  |
| `gmii_rx_er` | in | 1 |  |
| `mdio_i` | in | 1 |  |
| `s_axi_aclk` | in | 1 |  |
| `s_axi_resetn` | in | 1 |  |
| `s_axi_awaddr` | in | 12 |  |
| `s_axi_awvalid` | in | 1 |  |
| `s_axi_wdata` | in | 32 |  |
| `s_axi_wvalid` | in | 1 |  |
| `s_axi_bready` | in | 1 |  |
| `s_axi_araddr` | in | 12 |  |
| `s_axi_arvalid` | in | 1 |  |
| `s_axi_rready` | in | 1 |  |
| `rx_statistics_vector` | out | 28 | |
| `rx_statistics_valid` | out | 1 | |
| `rx_mac_aclk` | out | 1 | |
| `rx_reset` | out | 1 | |
| `rx_axis_mac_tdata` | out | 8 | |
| `rx_axis_mac_tvalid` | out | 1 | |
| `rx_axis_mac_tlast` | out | 1 | |
| `rx_axis_mac_tuser` | out | 1 | |
| `tx_statistics_vector` | out | 32 | |
| `tx_statistics_valid` | out | 1 | |
| `tx_mac_aclk` | out | 1 | |
| `tx_reset` | out | 1 | |
| `tx_axis_mac_tready` | out | 1 | |
| `speedis100` | out | 1 | |
| `speedis10100` | out | 1 | |
| `gmii_txd` | out | 8 | |
| `gmii_tx_en` | out | 1 | |
| `gmii_tx_er` | out | 1 | |
| `mdio_o` | out | 1 | |
| `mdio_t` | out | 1 | |
| `mdc` | out | 1 | |
| `s_axi_awready` | out | 1 | |
| `s_axi_wready` | out | 1 | |
| `s_axi_bresp` | out | 2 | |
| `s_axi_bvalid` | out | 1 | |
| `s_axi_arready` | out | 1 | |
| `s_axi_rdata` | out | 32 | |
| `s_axi_rresp` | out | 2 | |
| `s_axi_rvalid` | out | 1 | |
| `mac_irq` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01483.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
