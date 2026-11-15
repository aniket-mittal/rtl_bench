# Fill in the masked region of `rtlpp_02877`

The file `rtlpp_02877.v` holds a Verilog design whose top module is `rtlpp_02877` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02877`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02877.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02877` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02877.v`. Only these files are graded.

## Interface of `rtlpp_02877`

| port | dir | width | note |
|---|---|---|---|
| `s_axi_aclk` | in | 1 | clock, rising edge |
| `s_axi_aresetn` | in | 1 | reset, active low |
| `s_axi_awid` | in | 12 |  |
| `s_axi_awaddr` | in | 13 |  |
| `s_axi_awlen` | in | 8 |  |
| `s_axi_awsize` | in | 3 |  |
| `s_axi_awburst` | in | 2 |  |
| `s_axi_awlock` | in | 1 |  |
| `s_axi_awcache` | in | 4 |  |
| `s_axi_awprot` | in | 3 |  |
| `s_axi_awvalid` | in | 1 |  |
| `s_axi_wdata` | in | 32 |  |
| `s_axi_wstrb` | in | 4 |  |
| `s_axi_wlast` | in | 1 |  |
| `s_axi_wvalid` | in | 1 |  |
| `s_axi_bready` | in | 1 |  |
| `s_axi_arid` | in | 12 |  |
| `s_axi_araddr` | in | 13 |  |
| `s_axi_arlen` | in | 8 |  |
| `s_axi_arsize` | in | 3 |  |
| `s_axi_arburst` | in | 2 |  |
| `s_axi_arlock` | in | 1 |  |
| `s_axi_arcache` | in | 4 |  |
| `s_axi_arprot` | in | 3 |  |
| `s_axi_arvalid` | in | 1 |  |
| `s_axi_rready` | in | 1 |  |
| `bram_rddata_a` | in | 32 |  |
| `s_axi_awready` | out | 1 | |
| `s_axi_wready` | out | 1 | |
| `s_axi_bid` | out | 12 | |
| `s_axi_bresp` | out | 2 | |
| `s_axi_bvalid` | out | 1 | |
| `s_axi_arready` | out | 1 | |
| `s_axi_rid` | out | 12 | |
| `s_axi_rdata` | out | 32 | |
| `s_axi_rresp` | out | 2 | |
| `s_axi_rlast` | out | 1 | |
| `s_axi_rvalid` | out | 1 | |
| `bram_rst_a` | out | 1 | |
| `bram_clk_a` | out | 1 | |
| `bram_en_a` | out | 1 | |
| `bram_we_a` | out | 4 | |
| `bram_addr_a` | out | 13 | |
| `bram_wrdata_a` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02877.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
