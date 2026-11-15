# Fill in the masked region of `rtlpp_05346`

The file `rtlpp_05346.v` holds a Verilog design whose top module is `rtlpp_05346` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_05346`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_05346.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_05346` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_05346.v`. Only these files are graded.

## Interface of `rtlpp_05346`

| port | dir | width | note |
|---|---|---|---|
| `core_clk` | in | 1 | clock, rising edge |
| `core_rst` | in | 1 | reset, active high |
| `cl_enable` | in | 1 |  |
| `dl0_forcerxmode` | in | 1 |  |
| `dl0_enable` | in | 1 |  |
| `dl1_forcerxmode` | in | 1 |  |
| `dl1_enable` | in | 1 |  |
| `dl2_forcerxmode` | in | 1 |  |
| `dl2_enable` | in | 1 |  |
| `dl3_forcerxmode` | in | 1 |  |
| `dl3_enable` | in | 1 |  |
| `s_axi_aclk` | in | 1 |  |
| `s_axi_aresetn` | in | 1 |  |
| `s_axi_awaddr` | in | 7 |  |
| `s_axi_awvalid` | in | 1 |  |
| `s_axi_araddr` | in | 7 |  |
| `s_axi_arvalid` | in | 1 |  |
| `s_axi_wdata` | in | 32 |  |
| `s_axi_wstrb` | in | 4 |  |
| `s_axi_wvalid` | in | 1 |  |
| `s_axi_rready` | in | 1 |  |
| `s_axi_bready` | in | 1 |  |
| `clk_hs_rxp` | in | 1 |  |
| `clk_hs_rxn` | in | 1 |  |
| `data_hs_rxp` | in | 4 |  |
| `data_hs_rxn` | in | 4 |  |
| `clk_lp_rxp` | in | 1 |  |
| `clk_lp_rxn` | in | 1 |  |
| `data_lp_rxp` | in | 4 |  |
| `data_lp_rxn` | in | 4 |  |
| `rxbyteclkhs` | out | 1 | |
| `system_rst_out` | out | 1 | |
| `init_done` | out | 1 | |
| `cl_rxclkactivehs` | out | 1 | |
| `cl_stopstate` | out | 1 | |
| `cl_rxulpsclknot` | out | 1 | |
| `cl_ulpsactivenot` | out | 1 | |
| `dl0_rxdatahs` | out | 8 | |
| `dl0_rxvalidhs` | out | 1 | |
| `dl0_rxactivehs` | out | 1 | |
| `dl0_rxsynchs` | out | 1 | |
| `dl0_stopstate` | out | 1 | |
| `dl0_ulpsactivenot` | out | 1 | |
| `dl0_rxclkesc` | out | 1 | |
| `dl0_rxlpdtesc` | out | 1 | |
| `dl0_rxulpsesc` | out | 1 | |
| `dl0_rxtriggeresc` | out | 4 | |
| `dl0_rxdataesc` | out | 8 | |
| `dl0_rxvalidesc` | out | 1 | |
| `dl0_errsoths` | out | 1 | |
| `dl0_errsotsynchs` | out | 1 | |
| `dl0_erresc` | out | 1 | |
| `dl0_errsyncesc` | out | 1 | |
| `dl0_errcontrol` | out | 1 | |
| `dl1_rxdatahs` | out | 8 | |
| `dl1_rxvalidhs` | out | 1 | |
| `dl1_rxactivehs` | out | 1 | |
| `dl1_rxsynchs` | out | 1 | |
| `dl1_stopstate` | out | 1 | |
| `dl1_ulpsactivenot` | out | 1 | |
| `dl1_rxclkesc` | out | 1 | |
| `dl1_rxlpdtesc` | out | 1 | |
| `dl1_rxulpsesc` | out | 1 | |
| `dl1_rxtriggeresc` | out | 4 | |
| `dl1_rxdataesc` | out | 8 | |
| `dl1_rxvalidesc` | out | 1 | |
| `dl1_errsoths` | out | 1 | |
| `dl1_errsotsynchs` | out | 1 | |
| `dl1_erresc` | out | 1 | |
| `dl1_errsyncesc` | out | 1 | |
| `dl1_errcontrol` | out | 1 | |
| `dl2_rxdatahs` | out | 8 | |
| `dl2_rxvalidhs` | out | 1 | |
| `dl2_rxactivehs` | out | 1 | |
| `dl2_rxsynchs` | out | 1 | |
| `dl2_stopstate` | out | 1 | |
| `dl2_ulpsactivenot` | out | 1 | |
| `dl2_rxclkesc` | out | 1 | |
| `dl2_rxlpdtesc` | out | 1 | |
| `dl2_rxulpsesc` | out | 1 | |
| `dl2_rxtriggeresc` | out | 4 | |
| `dl2_rxdataesc` | out | 8 | |
| `dl2_rxvalidesc` | out | 1 | |
| `dl2_errsoths` | out | 1 | |
| `dl2_errsotsynchs` | out | 1 | |
| `dl2_erresc` | out | 1 | |
| `dl2_errsyncesc` | out | 1 | |
| `dl2_errcontrol` | out | 1 | |
| `dl3_rxdatahs` | out | 8 | |
| `dl3_rxvalidhs` | out | 1 | |
| `dl3_rxactivehs` | out | 1 | |
| `dl3_rxsynchs` | out | 1 | |
| `dl3_stopstate` | out | 1 | |
| `dl3_ulpsactivenot` | out | 1 | |
| `dl3_rxclkesc` | out | 1 | |
| `dl3_rxlpdtesc` | out | 1 | |
| `dl3_rxulpsesc` | out | 1 | |
| `dl3_rxtriggeresc` | out | 4 | |
| `dl3_rxdataesc` | out | 8 | |
| `dl3_rxvalidesc` | out | 1 | |
| `dl3_errsoths` | out | 1 | |
| `dl3_errsotsynchs` | out | 1 | |
| `dl3_erresc` | out | 1 | |
| `dl3_errsyncesc` | out | 1 | |
| `dl3_errcontrol` | out | 1 | |
| `s_axi_awready` | out | 1 | |
| `s_axi_arready` | out | 1 | |
| `s_axi_wready` | out | 1 | |
| `s_axi_rdata` | out | 32 | |
| `s_axi_rresp` | out | 2 | |
| `s_axi_rvalid` | out | 1 | |
| `s_axi_bresp` | out | 2 | |
| `s_axi_bvalid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_05346.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
