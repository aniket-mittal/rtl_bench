# Fill in the masked region of `origen_124249`

The file `origen_124249.v` holds a Verilog design whose top module is `origen_124249` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_124249`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_124249.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_124249` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_124249.v`. Only these files are graded.

## Interface of `origen_124249`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `m_axi_awid` | in | 4 |  |
| `m_axi_awaddr` | in | 32 |  |
| `m_axi_awlen` | in | 8 |  |
| `m_axi_awsize` | in | 3 |  |
| `m_axi_awburst` | in | 2 |  |
| `m_axi_awlock` | in | 1 |  |
| `m_axi_awcache` | in | 4 |  |
| `m_axi_awprot` | in | 3 |  |
| `m_axi_awqos` | in | 4 |  |
| `m_axi_awvalid` | in | 1 |  |
| `m_axi_wdata` | in | 32 |  |
| `m_axi_wstrb` | in | 4 |  |
| `m_axi_wlast` | in | 1 |  |
| `m_axi_wvalid` | in | 1 |  |
| `m_axi_bid` | in | 4 |  |
| `m_axi_bresp` | in | 2 |  |
| `m_axi_bvalid` | in | 1 |  |
| `m_axi_arid` | in | 4 |  |
| `m_axi_araddr` | in | 32 |  |
| `m_axi_arlen` | in | 8 |  |
| `m_axi_arsize` | in | 3 |  |
| `m_axi_arburst` | in | 2 |  |
| `m_axi_arlock` | in | 1 |  |
| `m_axi_arcache` | in | 4 |  |
| `m_axi_arprot` | in | 3 |  |
| `m_axi_arqos` | in | 4 |  |
| `m_axi_arvalid` | in | 1 |  |
| `m_axi_rready` | in | 1 |  |
| `m_axi_awready` | out | 1 | |
| `m_axi_wready` | out | 1 | |
| `m_axi_bready` | out | 1 | |
| `m_axi_arready` | out | 1 | |
| `m_axi_rid` | out | 4 | |
| `m_axi_rdata` | out | 32 | |
| `m_axi_rresp` | out | 2 | |
| `m_axi_rlast` | out | 1 | |
| `m_axi_rvalid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_124249.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
