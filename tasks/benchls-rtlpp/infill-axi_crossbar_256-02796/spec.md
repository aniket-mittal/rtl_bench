# Fill in the masked region of `rtlpp_02796`

The file `rtlpp_02796.v` holds a Verilog design whose top module is `rtlpp_02796` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_02796` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02796.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02796` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02796.v`. Only these files are graded.

## Interface of `rtlpp_02796`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `s_axi_awid` | in | 12 |  |
| `s_axi_awaddr` | in | 256 |  |
| `s_axi_awlen` | in | 32 |  |
| `s_axi_awsize` | in | 12 |  |
| `s_axi_awburst` | in | 8 |  |
| `s_axi_awlock` | in | 4 |  |
| `s_axi_awcache` | in | 16 |  |
| `s_axi_awprot` | in | 12 |  |
| `s_axi_awqos` | in | 16 |  |
| `s_axi_awuser` | in | 4 |  |
| `s_axi_awvalid` | in | 4 |  |
| `s_axi_wdata` | in | 256 |  |
| `s_axi_wstrb` | in | 32 |  |
| `s_axi_wlast` | in | 4 |  |
| `s_axi_wuser` | in | 4 |  |
| `s_axi_wvalid` | in | 4 |  |
| `s_axi_bready` | in | 4 |  |
| `s_axi_arid` | in | 12 |  |
| `s_axi_araddr` | in | 256 |  |
| `s_axi_arlen` | in | 32 |  |
| `s_axi_arsize` | in | 12 |  |
| `s_axi_arburst` | in | 8 |  |
| `s_axi_arlock` | in | 4 |  |
| `s_axi_arcache` | in | 16 |  |
| `s_axi_arprot` | in | 12 |  |
| `s_axi_arqos` | in | 16 |  |
| `s_axi_aruser` | in | 4 |  |
| `s_axi_arvalid` | in | 4 |  |
| `s_axi_rready` | in | 4 |  |
| `m_axi_awready` | in | 5 |  |
| `m_axi_wready` | in | 5 |  |
| `m_axi_bid` | in | 15 |  |
| `m_axi_bresp` | in | 10 |  |
| `m_axi_buser` | in | 5 |  |
| `m_axi_bvalid` | in | 5 |  |
| `m_axi_arready` | in | 5 |  |
| `m_axi_rid` | in | 15 |  |
| `m_axi_rdata` | in | 320 |  |
| `m_axi_rresp` | in | 10 |  |
| `m_axi_rlast` | in | 5 |  |
| `m_axi_ruser` | in | 5 |  |
| `m_axi_rvalid` | in | 5 |  |
| `s_axi_awready` | out | 4 | |
| `s_axi_wready` | out | 4 | |
| `s_axi_bid` | out | 12 | |
| `s_axi_bresp` | out | 8 | |
| `s_axi_buser` | out | 4 | |
| `s_axi_bvalid` | out | 4 | |
| `s_axi_arready` | out | 4 | |
| `s_axi_rid` | out | 12 | |
| `s_axi_rdata` | out | 256 | |
| `s_axi_rresp` | out | 8 | |
| `s_axi_rlast` | out | 4 | |
| `s_axi_ruser` | out | 4 | |
| `s_axi_rvalid` | out | 4 | |
| `m_axi_awid` | out | 15 | |
| `m_axi_awaddr` | out | 320 | |
| `m_axi_awlen` | out | 40 | |
| `m_axi_awsize` | out | 15 | |
| `m_axi_awburst` | out | 10 | |
| `m_axi_awlock` | out | 5 | |
| `m_axi_awcache` | out | 20 | |
| `m_axi_awprot` | out | 15 | |
| `m_axi_awregion` | out | 20 | |
| `m_axi_awqos` | out | 20 | |
| `m_axi_awuser` | out | 5 | |
| `m_axi_awvalid` | out | 5 | |
| `m_axi_wdata` | out | 320 | |
| `m_axi_wstrb` | out | 40 | |
| `m_axi_wlast` | out | 5 | |
| `m_axi_wuser` | out | 5 | |
| `m_axi_wvalid` | out | 5 | |
| `m_axi_bready` | out | 5 | |
| `m_axi_arid` | out | 15 | |
| `m_axi_araddr` | out | 320 | |
| `m_axi_arlen` | out | 40 | |
| `m_axi_arsize` | out | 15 | |
| `m_axi_arburst` | out | 10 | |
| `m_axi_arlock` | out | 5 | |
| `m_axi_arcache` | out | 20 | |
| `m_axi_arprot` | out | 15 | |
| `m_axi_arregion` | out | 20 | |
| `m_axi_arqos` | out | 20 | |
| `m_axi_aruser` | out | 5 | |
| `m_axi_arvalid` | out | 5 | |
| `m_axi_rready` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02796.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
