# Fill in the masked region of `autovcoder_006381`

The file `autovcoder_006381.v` holds a Verilog design whose top module is `autovcoder_006381` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_006381`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_006381.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_006381` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_006381.v`. Only these files are graded.

## Interface of `autovcoder_006381`

| port | dir | width | note |
|---|---|---|---|
| `ACLK` | in | 1 | clock, rising edge |
| `ARESETN` | in | 1 | reset, active low |
| `M_AXI_AWID` | in | 1 |  |
| `M_AXI_AWADDR` | in | 32 |  |
| `M_AXI_AWLEN` | in | 8 |  |
| `M_AXI_AWSIZE` | in | 3 |  |
| `M_AXI_AWBURST` | in | 2 |  |
| `M_AXI_AWLOCK` | in | 1 |  |
| `M_AXI_AWCACHE` | in | 4 |  |
| `M_AXI_AWPROT` | in | 3 |  |
| `M_AXI_AWQOS` | in | 4 |  |
| `M_AXI_AWUSER` | in | 1 |  |
| `M_AXI_AWVALID` | in | 1 |  |
| `M_AXI_WDATA` | in | 32 |  |
| `M_AXI_WSTRB` | in | 4 |  |
| `M_AXI_WLAST` | in | 1 |  |
| `M_AXI_WUSER` | in | 1 |  |
| `M_AXI_WVALID` | in | 1 |  |
| `M_AXI_BREADY` | in | 1 |  |
| `M_AXI_ARID` | in | 1 |  |
| `M_AXI_ARADDR` | in | 32 |  |
| `M_AXI_ARLEN` | in | 8 |  |
| `M_AXI_ARSIZE` | in | 3 |  |
| `M_AXI_ARBURST` | in | 2 |  |
| `M_AXI_ARLOCK` | in | 1 |  |
| `M_AXI_ARCACHE` | in | 4 |  |
| `M_AXI_ARPROT` | in | 3 |  |
| `M_AXI_ARQOS` | in | 4 |  |
| `M_AXI_ARUSER` | in | 1 |  |
| `M_AXI_ARVALID` | in | 1 |  |
| `M_AXI_RREADY` | in | 1 |  |
| `M_AXI_AWREADY` | out | 1 | |
| `M_AXI_WREADY` | out | 1 | |
| `M_AXI_BID` | out | 1 | |
| `M_AXI_BRESP` | out | 2 | |
| `M_AXI_BUSER` | out | 1 | |
| `M_AXI_BVALID` | out | 1 | |
| `M_AXI_ARREADY` | out | 1 | |
| `M_AXI_RID` | out | 1 | |
| `M_AXI_RDATA` | out | 32 | |
| `M_AXI_RRESP` | out | 2 | |
| `M_AXI_RLAST` | out | 1 | |
| `M_AXI_RUSER` | out | 1 | |
| `M_AXI_RVALID` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_006381.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
