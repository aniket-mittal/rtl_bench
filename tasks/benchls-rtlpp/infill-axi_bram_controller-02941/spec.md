# Fill in the masked region of `rtlpp_02941`

The file `rtlpp_02941.v` holds a Verilog design whose top module is `rtlpp_02941` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02941`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02941.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02941` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02941.v`. Only these files are graded.

## Interface of `rtlpp_02941`

| port | dir | width | note |
|---|---|---|---|
| `s_axi_aclk_0` | in | 1 | clock, rising edge |
| `BRAM_PORTA_0_dout` | in | 32 |  |
| `S_AXI_0_araddr` | in | 15 |  |
| `S_AXI_0_arburst` | in | 2 |  |
| `S_AXI_0_arcache` | in | 4 |  |
| `S_AXI_0_arlen` | in | 8 |  |
| `S_AXI_0_arlock` | in | 1 |  |
| `S_AXI_0_arprot` | in | 3 |  |
| `S_AXI_0_arsize` | in | 3 |  |
| `S_AXI_0_arvalid` | in | 1 |  |
| `S_AXI_0_awaddr` | in | 15 |  |
| `S_AXI_0_awburst` | in | 2 |  |
| `S_AXI_0_awcache` | in | 4 |  |
| `S_AXI_0_awlen` | in | 8 |  |
| `S_AXI_0_awlock` | in | 1 |  |
| `S_AXI_0_awprot` | in | 3 |  |
| `S_AXI_0_awsize` | in | 3 |  |
| `S_AXI_0_awvalid` | in | 1 |  |
| `S_AXI_0_bready` | in | 1 |  |
| `S_AXI_0_rready` | in | 1 |  |
| `S_AXI_0_wdata` | in | 32 |  |
| `S_AXI_0_wlast` | in | 1 |  |
| `S_AXI_0_wstrb` | in | 4 |  |
| `S_AXI_0_wvalid` | in | 1 |  |
| `s_axi_aresetn_0` | in | 1 | reset, active high |
| `BRAM_PORTA_0_addr` | out | 15 | |
| `BRAM_PORTA_0_clk` | out | 1 | |
| `BRAM_PORTA_0_din` | out | 32 | |
| `BRAM_PORTA_0_en` | out | 1 | |
| `BRAM_PORTA_0_rst` | out | 1 | |
| `BRAM_PORTA_0_we` | out | 4 | |
| `S_AXI_0_arready` | out | 1 | |
| `S_AXI_0_awready` | out | 1 | |
| `S_AXI_0_bresp` | out | 2 | |
| `S_AXI_0_bvalid` | out | 1 | |
| `S_AXI_0_rdata` | out | 32 | |
| `S_AXI_0_rlast` | out | 1 | |
| `S_AXI_0_rresp` | out | 2 | |
| `S_AXI_0_rvalid` | out | 1 | |
| `S_AXI_0_wready` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02941.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
