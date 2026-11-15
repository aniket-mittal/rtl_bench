# Fill in the masked region of `rtlpp_01348`

The file `rtlpp_01348.v` holds a Verilog design whose top module is `rtlpp_01348` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_01348` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01348.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01348` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01348.v`. Only these files are graded.

## Interface of `rtlpp_01348`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `s_axi_awid` | in | 15 |  |
| `s_axi_awaddr` | in | 160 |  |
| `s_axi_awlen` | in | 40 |  |
| `s_axi_awsize` | in | 15 |  |
| `s_axi_awburst` | in | 10 |  |
| `s_axi_awlock` | in | 5 |  |
| `s_axi_awcache` | in | 20 |  |
| `s_axi_awprot` | in | 15 |  |
| `s_axi_awqos` | in | 20 |  |
| `s_axi_awvalid` | in | 5 |  |
| `s_axi_wdata` | in | 160 |  |
| `s_axi_wstrb` | in | 20 |  |
| `s_axi_wlast` | in | 5 |  |
| `s_axi_wvalid` | in | 5 |  |
| `s_axi_bready` | in | 5 |  |
| `s_axi_arid` | in | 15 |  |
| `s_axi_araddr` | in | 160 |  |
| `s_axi_arlen` | in | 40 |  |
| `s_axi_arsize` | in | 15 |  |
| `s_axi_arburst` | in | 10 |  |
| `s_axi_arlock` | in | 5 |  |
| `s_axi_arcache` | in | 20 |  |
| `s_axi_arprot` | in | 15 |  |
| `s_axi_arqos` | in | 20 |  |
| `s_axi_arvalid` | in | 5 |  |
| `s_axi_rready` | in | 5 |  |
| `m_axi_awready` | in | 7 |  |
| `m_axi_wready` | in | 7 |  |
| `m_axi_bid` | in | 21 |  |
| `m_axi_bresp` | in | 14 |  |
| `m_axi_bvalid` | in | 7 |  |
| `m_axi_arready` | in | 7 |  |
| `m_axi_rid` | in | 21 |  |
| `m_axi_rdata` | in | 224 |  |
| `m_axi_rresp` | in | 14 |  |
| `m_axi_rlast` | in | 7 |  |
| `m_axi_rvalid` | in | 7 |  |
| `s_axi_awready` | out | 5 | |
| `s_axi_wready` | out | 5 | |
| `s_axi_bid` | out | 15 | |
| `s_axi_bresp` | out | 10 | |
| `s_axi_bvalid` | out | 5 | |
| `s_axi_arready` | out | 5 | |
| `s_axi_rid` | out | 15 | |
| `s_axi_rdata` | out | 160 | |
| `s_axi_rresp` | out | 10 | |
| `s_axi_rlast` | out | 5 | |
| `s_axi_rvalid` | out | 5 | |
| `m_axi_awid` | out | 21 | |
| `m_axi_awaddr` | out | 224 | |
| `m_axi_awlen` | out | 56 | |
| `m_axi_awsize` | out | 21 | |
| `m_axi_awburst` | out | 14 | |
| `m_axi_awlock` | out | 7 | |
| `m_axi_awcache` | out | 28 | |
| `m_axi_awprot` | out | 21 | |
| `m_axi_awregion` | out | 28 | |
| `m_axi_awqos` | out | 28 | |
| `m_axi_awvalid` | out | 7 | |
| `m_axi_wdata` | out | 224 | |
| `m_axi_wstrb` | out | 28 | |
| `m_axi_wlast` | out | 7 | |
| `m_axi_wvalid` | out | 7 | |
| `m_axi_bready` | out | 7 | |
| `m_axi_arid` | out | 21 | |
| `m_axi_araddr` | out | 224 | |
| `m_axi_arlen` | out | 56 | |
| `m_axi_arsize` | out | 21 | |
| `m_axi_arburst` | out | 14 | |
| `m_axi_arlock` | out | 7 | |
| `m_axi_arcache` | out | 28 | |
| `m_axi_arprot` | out | 21 | |
| `m_axi_arregion` | out | 28 | |
| `m_axi_arqos` | out | 28 | |
| `m_axi_arvalid` | out | 7 | |
| `m_axi_rready` | out | 7 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01348.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
