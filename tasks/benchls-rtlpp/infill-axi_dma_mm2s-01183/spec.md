# Fill in the masked region of `rtlpp_01183`

The file `rtlpp_01183.v` holds a Verilog design whose top module is `rtlpp_01183` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_01183`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01183.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01183` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01183.v`. Only these files are graded.

## Interface of `rtlpp_01183`

| port | dir | width | note |
|---|---|---|---|
| `s_axi_lite_aclk` | in | 1 | clock, rising edge |
| `M_AXI_MM2S_arready` | in | 1 |  |
| `M_AXI_MM2S_rdata` | in | 32 |  |
| `M_AXI_MM2S_rlast` | in | 1 |  |
| `M_AXI_MM2S_rresp` | in | 2 |  |
| `M_AXI_MM2S_rvalid` | in | 1 |  |
| `S_AXI_LITE_araddr` | in | 10 |  |
| `S_AXI_LITE_arvalid` | in | 1 |  |
| `S_AXI_LITE_awaddr` | in | 10 |  |
| `S_AXI_LITE_awvalid` | in | 1 |  |
| `S_AXI_LITE_bready` | in | 1 |  |
| `S_AXI_LITE_rready` | in | 1 |  |
| `S_AXI_LITE_wdata` | in | 32 |  |
| `S_AXI_LITE_wvalid` | in | 1 |  |
| `axi_resetn` | in | 1 | reset, active low |
| `Lcl_M_AXIS_MM2S_TDATA` | in | 32 |  |
| `Lcl_M_AXIS_MM2S_TLAST` | in | 1 |  |
| `Lcl_M_AXIS_MM2S_TVALID` | in | 1 |  |
| `useLcl` | in | 1 |  |
| `M_AXI_MM2S_araddr` | out | 32 | |
| `M_AXI_MM2S_arburst` | out | 2 | |
| `M_AXI_MM2S_arcache` | out | 4 | |
| `M_AXI_MM2S_arlen` | out | 8 | |
| `M_AXI_MM2S_arprot` | out | 3 | |
| `M_AXI_MM2S_arsize` | out | 3 | |
| `M_AXI_MM2S_arvalid` | out | 1 | |
| `M_AXI_MM2S_rready` | out | 1 | |
| `S_AXI_LITE_arready` | out | 1 | |
| `S_AXI_LITE_awready` | out | 1 | |
| `S_AXI_LITE_bresp` | out | 2 | |
| `S_AXI_LITE_bvalid` | out | 1 | |
| `S_AXI_LITE_rdata` | out | 32 | |
| `S_AXI_LITE_rresp` | out | 2 | |
| `S_AXI_LITE_rvalid` | out | 1 | |
| `S_AXI_LITE_wready` | out | 1 | |
| `Lcl_M_AXIS_MM2S_TREADY` | out | 1 | |
| `mm2s_introut` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01183.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
