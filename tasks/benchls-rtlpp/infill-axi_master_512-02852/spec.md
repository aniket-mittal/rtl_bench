# Fill in the masked region of `rtlpp_02852`

The file `rtlpp_02852.v` holds a Verilog design whose top module is `rtlpp_02852` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02852`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02852.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02852` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02852.v`. Only these files are graded.

## Interface of `rtlpp_02852`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `m_axi_awready` | in | 1 |  |
| `m_axi_wready` | in | 1 |  |
| `m_axi_bid` | in | 4 |  |
| `m_axi_bresp` | in | 2 |  |
| `m_axi_bvalid` | in | 1 |  |
| `m_axi_arready` | in | 1 |  |
| `m_axi_rid` | in | 4 |  |
| `m_axi_rdata` | in | 512 |  |
| `m_axi_rresp` | in | 2 |  |
| `m_axi_rlast` | in | 1 |  |
| `m_axi_rvalid` | in | 1 |  |
| `m_axi_awid` | out | 4 | |
| `m_axi_awaddr` | out | 64 | |
| `m_axi_awlen` | out | 8 | |
| `m_axi_awsize` | out | 3 | |
| `m_axi_awburst` | out | 2 | |
| `m_axi_awlock` | out | 1 | |
| `m_axi_awcache` | out | 4 | |
| `m_axi_awprot` | out | 3 | |
| `m_axi_awregion` | out | 4 | |
| `m_axi_awqos` | out | 4 | |
| `m_axi_awvalid` | out | 1 | |
| `m_axi_wdata` | out | 512 | |
| `m_axi_wstrb` | out | 64 | |
| `m_axi_wlast` | out | 1 | |
| `m_axi_wvalid` | out | 1 | |
| `m_axi_bready` | out | 1 | |
| `m_axi_arid` | out | 4 | |
| `m_axi_araddr` | out | 64 | |
| `m_axi_arlen` | out | 8 | |
| `m_axi_arsize` | out | 3 | |
| `m_axi_arburst` | out | 2 | |
| `m_axi_arlock` | out | 1 | |
| `m_axi_arcache` | out | 4 | |
| `m_axi_arprot` | out | 3 | |
| `m_axi_arregion` | out | 4 | |
| `m_axi_arqos` | out | 4 | |
| `m_axi_arvalid` | out | 1 | |
| `m_axi_rready` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02852.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
