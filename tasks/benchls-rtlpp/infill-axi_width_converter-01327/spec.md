# Fill in the masked region of `rtlpp_01327`

The file `rtlpp_01327.v` holds a Verilog design whose top module is `rtlpp_01327` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_01327`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01327.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01327` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01327.v`. Only these files are graded.

## Interface of `rtlpp_01327`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `s_axi_awid` | in | 1 |  |
| `s_axi_awaddr` | in | 32 |  |
| `s_axi_awlen` | in | 8 |  |
| `s_axi_awsize` | in | 3 |  |
| `s_axi_awburst` | in | 2 |  |
| `s_axi_awlock` | in | 1 |  |
| `s_axi_awcache` | in | 4 |  |
| `s_axi_awprot` | in | 3 |  |
| `s_axi_awregion` | in | 4 |  |
| `s_axi_awqos` | in | 4 |  |
| `s_axi_awuser` | in | 1 |  |
| `s_axi_awvalid` | in | 1 |  |
| `s_axi_wdata` | in | 64 |  |
| `s_axi_wstrb` | in | 8 |  |
| `s_axi_wlast` | in | 1 |  |
| `s_axi_wuser` | in | 1 |  |
| `s_axi_wvalid` | in | 1 |  |
| `s_axi_bready` | in | 1 |  |
| `s_axi_arid` | in | 1 |  |
| `s_axi_araddr` | in | 32 |  |
| `s_axi_arlen` | in | 8 |  |
| `s_axi_arsize` | in | 3 |  |
| `s_axi_arburst` | in | 2 |  |
| `s_axi_arlock` | in | 1 |  |
| `s_axi_arcache` | in | 4 |  |
| `s_axi_arprot` | in | 3 |  |
| `s_axi_arregion` | in | 4 |  |
| `s_axi_arqos` | in | 4 |  |
| `s_axi_aruser` | in | 1 |  |
| `s_axi_arvalid` | in | 1 |  |
| `s_axi_rready` | in | 1 |  |
| `m_axi_awready` | in | 1 |  |
| `m_axi_wready` | in | 1 |  |
| `m_axi_bid` | in | 1 |  |
| `m_axi_bresp` | in | 2 |  |
| `m_axi_bvalid` | in | 1 |  |
| `m_axi_arready` | in | 1 |  |
| `m_axi_rid` | in | 1 |  |
| `m_axi_rdata` | in | 64 |  |
| `m_axi_rresp` | in | 2 |  |
| `m_axi_rlast` | in | 1 |  |
| `m_axi_ruser` | in | 1 |  |
| `m_axi_rvalid` | in | 1 |  |
| `s_axi_awready` | out | 1 | |
| `s_axi_wready` | out | 1 | |
| `s_axi_bid` | out | 1 | |
| `s_axi_bresp` | out | 2 | |
| `s_axi_bvalid` | out | 1 | |
| `s_axi_arready` | out | 1 | |
| `s_axi_rid` | out | 1 | |
| `s_axi_rdata` | out | 64 | |
| `s_axi_rresp` | out | 2 | |
| `s_axi_rlast` | out | 1 | |
| `s_axi_ruser` | out | 1 | |
| `s_axi_rvalid` | out | 1 | |
| `m_axi_awid` | out | 1 | |
| `m_axi_awaddr` | out | 32 | |
| `m_axi_awlen` | out | 4 | |
| `m_axi_awsize` | out | 3 | |
| `m_axi_awburst` | out | 2 | |
| `m_axi_awlock` | out | 2 | |
| `m_axi_awcache` | out | 4 | |
| `m_axi_awprot` | out | 3 | |
| `m_axi_awqos` | out | 4 | |
| `m_axi_awuser` | out | 1 | |
| `m_axi_awvalid` | out | 1 | |
| `m_axi_wid` | out | 1 | |
| `m_axi_wdata` | out | 64 | |
| `m_axi_wstrb` | out | 8 | |
| `m_axi_wlast` | out | 1 | |
| `m_axi_wuser` | out | 1 | |
| `m_axi_wvalid` | out | 1 | |
| `m_axi_bready` | out | 1 | |
| `m_axi_arid` | out | 1 | |
| `m_axi_araddr` | out | 32 | |
| `m_axi_arlen` | out | 4 | |
| `m_axi_arsize` | out | 3 | |
| `m_axi_arburst` | out | 2 | |
| `m_axi_arlock` | out | 2 | |
| `m_axi_arcache` | out | 4 | |
| `m_axi_arprot` | out | 3 | |
| `m_axi_arqos` | out | 4 | |
| `m_axi_aruser` | out | 1 | |
| `m_axi_arvalid` | out | 1 | |
| `m_axi_rready` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01327.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
