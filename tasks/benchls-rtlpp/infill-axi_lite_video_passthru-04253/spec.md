# Fill in the masked region of `rtlpp_04253`

The file `rtlpp_04253.v` holds a Verilog design whose top module is `rtlpp_04253` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_04253` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_04253.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_04253` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_04253.v`. Only these files are graded.

## Interface of `rtlpp_04253`

| port | dir | width | note |
|---|---|---|---|
| `ap_clk` | in | 1 | clock, rising edge |
| `s_axi_CTRL_AWADDR` | in | 13 |  |
| `s_axi_CTRL_AWVALID` | in | 1 |  |
| `s_axi_CTRL_WDATA` | in | 32 |  |
| `s_axi_CTRL_WSTRB` | in | 4 |  |
| `s_axi_CTRL_WVALID` | in | 1 |  |
| `s_axi_CTRL_BREADY` | in | 1 |  |
| `s_axi_CTRL_ARADDR` | in | 13 |  |
| `s_axi_CTRL_ARVALID` | in | 1 |  |
| `s_axi_CTRL_RREADY` | in | 1 |  |
| `ap_rst_n` | in | 1 | reset, active low |
| `s_axis_video_TVALID` | in | 1 |  |
| `s_axis_video_TDATA` | in | 32 |  |
| `s_axis_video_TKEEP` | in | 4 |  |
| `s_axis_video_TSTRB` | in | 4 |  |
| `s_axis_video_TUSER` | in | 1 |  |
| `s_axis_video_TLAST` | in | 1 |  |
| `s_axis_video_TID` | in | 1 |  |
| `s_axis_video_TDEST` | in | 1 |  |
| `m_axis_video_TREADY` | in | 1 |  |
| `s_axi_CTRL_AWREADY` | out | 1 | |
| `s_axi_CTRL_WREADY` | out | 1 | |
| `s_axi_CTRL_BRESP` | out | 2 | |
| `s_axi_CTRL_BVALID` | out | 1 | |
| `s_axi_CTRL_ARREADY` | out | 1 | |
| `s_axi_CTRL_RDATA` | out | 32 | |
| `s_axi_CTRL_RRESP` | out | 2 | |
| `s_axi_CTRL_RVALID` | out | 1 | |
| `interrupt` | out | 1 | |
| `s_axis_video_TREADY` | out | 1 | |
| `m_axis_video_TVALID` | out | 1 | |
| `m_axis_video_TDATA` | out | 32 | |
| `m_axis_video_TKEEP` | out | 4 | |
| `m_axis_video_TSTRB` | out | 4 | |
| `m_axis_video_TUSER` | out | 1 | |
| `m_axis_video_TLAST` | out | 1 | |
| `m_axis_video_TID` | out | 1 | |
| `m_axis_video_TDEST` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_04253.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
