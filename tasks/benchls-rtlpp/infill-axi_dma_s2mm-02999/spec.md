# Fill in the masked region of `rtlpp_02999`

The file `rtlpp_02999.v` holds a Verilog design whose top module is `rtlpp_02999` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02999`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02999.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02999` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02999.v`. Only these files are graded.

## Interface of `rtlpp_02999`

| port | dir | width | note |
|---|---|---|---|
| `s_axi_lite_aclk` | in | 1 | clock, rising edge |
| `m_axi_s2mm_aclk` | in | 1 |  |
| `s_axis_s2mm_aclk` | in | 1 |  |
| `axi_resetn` | in | 1 | reset, active low |
| `s_axi_lite_awvalid` | in | 1 |  |
| `s_axi_lite_awaddr` | in | 9 |  |
| `s_axi_lite_wvalid` | in | 1 |  |
| `s_axi_lite_wdata` | in | 32 |  |
| `s_axi_lite_bready` | in | 1 |  |
| `s_axi_lite_arvalid` | in | 1 |  |
| `s_axi_lite_araddr` | in | 9 |  |
| `s_axi_lite_rready` | in | 1 |  |
| `m_axi_s2mm_awready` | in | 1 |  |
| `m_axi_s2mm_wready` | in | 1 |  |
| `m_axi_s2mm_bresp` | in | 2 |  |
| `m_axi_s2mm_bvalid` | in | 1 |  |
| `s_axis_s2mm_tdata` | in | 24 |  |
| `s_axis_s2mm_tkeep` | in | 3 |  |
| `s_axis_s2mm_tuser` | in | 1 |  |
| `s_axis_s2mm_tvalid` | in | 1 |  |
| `s_axis_s2mm_tlast` | in | 1 |  |
| `s_axi_lite_awready` | out | 1 | |
| `s_axi_lite_wready` | out | 1 | |
| `s_axi_lite_bresp` | out | 2 | |
| `s_axi_lite_bvalid` | out | 1 | |
| `s_axi_lite_arready` | out | 1 | |
| `s_axi_lite_rvalid` | out | 1 | |
| `s_axi_lite_rdata` | out | 32 | |
| `s_axi_lite_rresp` | out | 2 | |
| `s2mm_frame_ptr_out` | out | 6 | |
| `m_axi_s2mm_awaddr` | out | 32 | |
| `m_axi_s2mm_awlen` | out | 8 | |
| `m_axi_s2mm_awsize` | out | 3 | |
| `m_axi_s2mm_awburst` | out | 2 | |
| `m_axi_s2mm_awprot` | out | 3 | |
| `m_axi_s2mm_awcache` | out | 4 | |
| `m_axi_s2mm_awvalid` | out | 1 | |
| `m_axi_s2mm_wdata` | out | 64 | |
| `m_axi_s2mm_wstrb` | out | 8 | |
| `m_axi_s2mm_wlast` | out | 1 | |
| `m_axi_s2mm_wvalid` | out | 1 | |
| `m_axi_s2mm_bready` | out | 1 | |
| `s_axis_s2mm_tready` | out | 1 | |
| `s2mm_introut` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02999.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
