# Fill in the masked region of `rtlpp_03483`

The file `rtlpp_03483.v` holds a Verilog design whose top module is `rtlpp_03483` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_03483`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_03483.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_03483` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_03483.v`. Only these files are graded.

## Interface of `rtlpp_03483`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `s_axi_awid` | in | 18 |  |
| `s_axi_awaddr` | in | 96 |  |
| `s_axi_awlen` | in | 24 |  |
| `s_axi_awsize` | in | 9 |  |
| `s_axi_awburst` | in | 6 |  |
| `s_axi_awlock` | in | 3 |  |
| `s_axi_awcache` | in | 12 |  |
| `s_axi_awprot` | in | 9 |  |
| `s_axi_awqos` | in | 12 |  |
| `s_axi_awvalid` | in | 3 |  |
| `s_axi_wdata` | in | 192 |  |
| `s_axi_wstrb` | in | 24 |  |
| `s_axi_wlast` | in | 3 |  |
| `s_axi_wvalid` | in | 3 |  |
| `s_axi_bready` | in | 3 |  |
| `s_axi_arid` | in | 18 |  |
| `s_axi_araddr` | in | 96 |  |
| `s_axi_arlen` | in | 24 |  |
| `s_axi_arsize` | in | 9 |  |
| `s_axi_arburst` | in | 6 |  |
| `s_axi_arlock` | in | 3 |  |
| `s_axi_arcache` | in | 12 |  |
| `s_axi_arprot` | in | 9 |  |
| `s_axi_arqos` | in | 12 |  |
| `s_axi_arvalid` | in | 3 |  |
| `s_axi_rready` | in | 3 |  |
| `m_axi_awready` | in | 2 |  |
| `m_axi_wready` | in | 2 |  |
| `m_axi_bid` | in | 12 |  |
| `m_axi_bresp` | in | 4 |  |
| `m_axi_bvalid` | in | 2 |  |
| `m_axi_arready` | in | 2 |  |
| `m_axi_rid` | in | 12 |  |
| `m_axi_rdata` | in | 128 |  |
| `m_axi_rresp` | in | 4 |  |
| `m_axi_rlast` | in | 2 |  |
| `m_axi_rvalid` | in | 2 |  |
| `s_axi_awready` | out | 3 | |
| `s_axi_wready` | out | 3 | |
| `s_axi_bid` | out | 18 | |
| `s_axi_bresp` | out | 6 | |
| `s_axi_bvalid` | out | 3 | |
| `s_axi_arready` | out | 3 | |
| `s_axi_rid` | out | 18 | |
| `s_axi_rdata` | out | 192 | |
| `s_axi_rresp` | out | 6 | |
| `s_axi_rlast` | out | 3 | |
| `s_axi_rvalid` | out | 3 | |
| `m_axi_awid` | out | 12 | |
| `m_axi_awaddr` | out | 64 | |
| `m_axi_awlen` | out | 16 | |
| `m_axi_awsize` | out | 6 | |
| `m_axi_awburst` | out | 4 | |
| `m_axi_awlock` | out | 2 | |
| `m_axi_awcache` | out | 8 | |
| `m_axi_awprot` | out | 6 | |
| `m_axi_awregion` | out | 8 | |
| `m_axi_awqos` | out | 8 | |
| `m_axi_awvalid` | out | 2 | |
| `m_axi_wdata` | out | 128 | |
| `m_axi_wstrb` | out | 16 | |
| `m_axi_wlast` | out | 2 | |
| `m_axi_wvalid` | out | 2 | |
| `m_axi_bready` | out | 2 | |
| `m_axi_arid` | out | 12 | |
| `m_axi_araddr` | out | 64 | |
| `m_axi_arlen` | out | 16 | |
| `m_axi_arsize` | out | 6 | |
| `m_axi_arburst` | out | 4 | |
| `m_axi_arlock` | out | 2 | |
| `m_axi_arcache` | out | 8 | |
| `m_axi_arprot` | out | 6 | |
| `m_axi_arregion` | out | 8 | |
| `m_axi_arqos` | out | 8 | |
| `m_axi_arvalid` | out | 2 | |
| `m_axi_rready` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_03483.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
