# Fill in the masked region of `rtlpp_03972`

The file `rtlpp_03972.v` holds a Verilog design whose top module is `rtlpp_03972` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_03972` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_03972.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_03972` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_03972.v`. Only these files are graded.

## Interface of `rtlpp_03972`

| port | dir | width | note |
|---|---|---|---|
| `s_axi_lite_aclk` | in | 1 |  |
| `m_axi_mm2s_aclk` | in | 1 |  |
| `axi_resetn` | in | 1 | reset, active low |
| `s_axi_lite_awvalid` | in | 1 |  |
| `s_axi_lite_awaddr` | in | 10 |  |
| `s_axi_lite_wvalid` | in | 1 |  |
| `s_axi_lite_wdata` | in | 32 |  |
| `s_axi_lite_bready` | in | 1 |  |
| `s_axi_lite_arvalid` | in | 1 |  |
| `s_axi_lite_araddr` | in | 10 |  |
| `s_axi_lite_rready` | in | 1 |  |
| `m_axi_mm2s_arready` | in | 1 |  |
| `m_axi_mm2s_rdata` | in | 32 |  |
| `m_axi_mm2s_rresp` | in | 2 |  |
| `m_axi_mm2s_rlast` | in | 1 |  |
| `m_axi_mm2s_rvalid` | in | 1 |  |
| `m_axis_mm2s_tready` | in | 1 |  |
| `s_axi_lite_awready` | out | 1 | |
| `s_axi_lite_wready` | out | 1 | |
| `s_axi_lite_bresp` | out | 2 | |
| `s_axi_lite_bvalid` | out | 1 | |
| `s_axi_lite_arready` | out | 1 | |
| `s_axi_lite_rvalid` | out | 1 | |
| `s_axi_lite_rdata` | out | 32 | |
| `s_axi_lite_rresp` | out | 2 | |
| `m_axi_mm2s_araddr` | out | 32 | |
| `m_axi_mm2s_arlen` | out | 8 | |
| `m_axi_mm2s_arsize` | out | 3 | |
| `m_axi_mm2s_arburst` | out | 2 | |
| `m_axi_mm2s_arprot` | out | 3 | |
| `m_axi_mm2s_arcache` | out | 4 | |
| `m_axi_mm2s_arvalid` | out | 1 | |
| `m_axi_mm2s_rready` | out | 1 | |
| `mm2s_prmry_reset_out_n` | out | 1 | |
| `m_axis_mm2s_tdata` | out | 32 | |
| `m_axis_mm2s_tkeep` | out | 4 | |
| `m_axis_mm2s_tvalid` | out | 1 | |
| `m_axis_mm2s_tlast` | out | 1 | |
| `mm2s_introut` | out | 1 | |
| `axi_dma_tstvec` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_03972.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
