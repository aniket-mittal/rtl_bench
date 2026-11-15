# Fill in the masked region of `rtlpp_02530`

The file `rtlpp_02530.v` holds a Verilog design whose top module is `rtlpp_02530` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02530`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02530.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02530` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02530.v`. Only these files are graded.

## Interface of `rtlpp_02530`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `S00_AXI_araddr` | in | 32 |  |
| `S00_AXI_arlen` | in | 8 |  |
| `S00_AXI_arsize` | in | 3 |  |
| `S00_AXI_arburst` | in | 2 |  |
| `S00_AXI_arlock` | in | 1 |  |
| `S00_AXI_arcache` | in | 4 |  |
| `S00_AXI_arprot` | in | 3 |  |
| `S00_AXI_arqos` | in | 4 |  |
| `S00_AXI_arvalid` | in | 1 |  |
| `S00_AXI_rready` | in | 1 |  |
| `S01_AXI_awaddr` | in | 32 |  |
| `S01_AXI_awlen` | in | 8 |  |
| `S01_AXI_awsize` | in | 3 |  |
| `S01_AXI_awburst` | in | 2 |  |
| `S01_AXI_awlock` | in | 1 |  |
| `S01_AXI_awcache` | in | 4 |  |
| `S01_AXI_awprot` | in | 3 |  |
| `S01_AXI_awqos` | in | 4 |  |
| `S01_AXI_awvalid` | in | 1 |  |
| `S01_AXI_wdata` | in | 64 |  |
| `S01_AXI_wstrb` | in | 8 |  |
| `S01_AXI_wlast` | in | 1 |  |
| `S01_AXI_wvalid` | in | 1 |  |
| `S01_AXI_bready` | in | 1 |  |
| `M00_AXI_awready` | in | 1 |  |
| `M00_AXI_wready` | in | 1 |  |
| `M00_AXI_bresp` | in | 2 |  |
| `M00_AXI_bvalid` | in | 1 |  |
| `M00_AXI_arready` | in | 1 |  |
| `M00_AXI_rdata` | in | 64 |  |
| `M00_AXI_rresp` | in | 2 |  |
| `M00_AXI_rlast` | in | 1 |  |
| `M00_AXI_rvalid` | in | 1 |  |
| `S00_AXI_arready` | out | 1 | |
| `S00_AXI_rdata` | out | 64 | |
| `S00_AXI_rresp` | out | 2 | |
| `S00_AXI_rlast` | out | 1 | |
| `S00_AXI_rvalid` | out | 1 | |
| `S01_AXI_awready` | out | 1 | |
| `S01_AXI_wready` | out | 1 | |
| `S01_AXI_bresp` | out | 2 | |
| `S01_AXI_bvalid` | out | 1 | |
| `M00_AXI_awaddr` | out | 49 | |
| `M00_AXI_awlen` | out | 8 | |
| `M00_AXI_awsize` | out | 3 | |
| `M00_AXI_awburst` | out | 2 | |
| `M00_AXI_awlock` | out | 1 | |
| `M00_AXI_awcache` | out | 4 | |
| `M00_AXI_awprot` | out | 3 | |
| `M00_AXI_awqos` | out | 4 | |
| `M00_AXI_awvalid` | out | 1 | |
| `M00_AXI_wdata` | out | 64 | |
| `M00_AXI_wstrb` | out | 8 | |
| `M00_AXI_wlast` | out | 1 | |
| `M00_AXI_wvalid` | out | 1 | |
| `M00_AXI_bready` | out | 1 | |
| `M00_AXI_araddr` | out | 49 | |
| `M00_AXI_arlen` | out | 8 | |
| `M00_AXI_arsize` | out | 3 | |
| `M00_AXI_arburst` | out | 2 | |
| `M00_AXI_arlock` | out | 1 | |
| `M00_AXI_arcache` | out | 4 | |
| `M00_AXI_arprot` | out | 3 | |
| `M00_AXI_arqos` | out | 4 | |
| `M00_AXI_arvalid` | out | 1 | |
| `M00_AXI_rready` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02530.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
