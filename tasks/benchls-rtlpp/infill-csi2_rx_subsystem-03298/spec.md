# Fill in the masked region of `rtlpp_03298`

The file `rtlpp_03298.v` holds a Verilog design whose top module is `rtlpp_03298` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_03298` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_03298.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_03298` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_03298.v`. Only these files are graded.

## Interface of `rtlpp_03298`

| port | dir | width | note |
|---|---|---|---|
| `lite_aclk` | in | 1 |  |
| `lite_aresetn` | in | 1 | reset, active low |
| `dphy_clk_200M` | in | 1 |  |
| `video_aclk` | in | 1 |  |
| `video_aresetn` | in | 1 |  |
| `csirxss_s_axi_araddr` | in | 8 |  |
| `csirxss_s_axi_arvalid` | in | 1 |  |
| `csirxss_s_axi_awaddr` | in | 8 |  |
| `csirxss_s_axi_awvalid` | in | 1 |  |
| `csirxss_s_axi_bready` | in | 1 |  |
| `csirxss_s_axi_rready` | in | 1 |  |
| `csirxss_s_axi_wdata` | in | 32 |  |
| `csirxss_s_axi_wstrb` | in | 4 |  |
| `csirxss_s_axi_wvalid` | in | 1 |  |
| `video_out_tready` | in | 1 |  |
| `mipi_phy_if_clk_n` | in | 1 |  |
| `mipi_phy_if_clk_p` | in | 1 |  |
| `mipi_phy_if_data_n` | in | 4 |  |
| `mipi_phy_if_data_p` | in | 4 |  |
| `rxbyteclkhs` | out | 1 | |
| `clkoutphy_out` | out | 1 | |
| `system_rst_out` | out | 1 | |
| `pll_lock_out` | out | 1 | |
| `csirxss_csi_irq` | out | 1 | |
| `frame_rcvd_pulse_out` | out | 1 | |
| `csirxss_s_axi_arready` | out | 1 | |
| `csirxss_s_axi_awready` | out | 1 | |
| `csirxss_s_axi_bresp` | out | 2 | |
| `csirxss_s_axi_bvalid` | out | 1 | |
| `csirxss_s_axi_rdata` | out | 32 | |
| `csirxss_s_axi_rresp` | out | 2 | |
| `csirxss_s_axi_rvalid` | out | 1 | |
| `csirxss_s_axi_wready` | out | 1 | |
| `video_out_tdata` | out | 24 | |
| `video_out_tdest` | out | 10 | |
| `video_out_tlast` | out | 1 | |
| `video_out_tuser` | out | 1 | |
| `video_out_tvalid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_03298.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
