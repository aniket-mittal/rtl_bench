# Fill in the masked region of `rtlpp_01886`

The file `rtlpp_01886.v` holds a Verilog design whose top module is `rtlpp_01886` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_01886`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01886.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01886` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01886.v`. Only these files are graded.

## Interface of `rtlpp_01886`

| port | dir | width | note |
|---|---|---|---|
| `s_axi_aclk` | in | 1 | clock, rising edge |
| `AXI_LITE_GPIO_araddr` | in | 9 |  |
| `AXI_LITE_GPIO_arvalid` | in | 1 |  |
| `AXI_LITE_GPIO_awaddr` | in | 9 |  |
| `AXI_LITE_GPIO_awvalid` | in | 1 |  |
| `AXI_LITE_GPIO_bready` | in | 1 |  |
| `AXI_LITE_GPIO_rready` | in | 1 |  |
| `AXI_LITE_GPIO_wdata` | in | 32 |  |
| `AXI_LITE_GPIO_wstrb` | in | 4 |  |
| `AXI_LITE_GPIO_wvalid` | in | 1 |  |
| `Pmod_out_pin10_i` | in | 1 |  |
| `Pmod_out_pin1_i` | in | 1 |  |
| `Pmod_out_pin2_i` | in | 1 |  |
| `Pmod_out_pin3_i` | in | 1 |  |
| `Pmod_out_pin4_i` | in | 1 |  |
| `Pmod_out_pin7_i` | in | 1 |  |
| `Pmod_out_pin8_i` | in | 1 |  |
| `Pmod_out_pin9_i` | in | 1 |  |
| `s_axi_aresetn` | in | 1 | reset, active low |
| `AXI_LITE_GPIO_arready` | out | 1 | |
| `AXI_LITE_GPIO_awready` | out | 1 | |
| `AXI_LITE_GPIO_bresp` | out | 2 | |
| `AXI_LITE_GPIO_bvalid` | out | 1 | |
| `AXI_LITE_GPIO_rdata` | out | 32 | |
| `AXI_LITE_GPIO_rresp` | out | 2 | |
| `AXI_LITE_GPIO_rvalid` | out | 1 | |
| `AXI_LITE_GPIO_wready` | out | 1 | |
| `Pmod_out_pin10_o` | out | 1 | |
| `Pmod_out_pin10_t` | out | 1 | |
| `Pmod_out_pin1_o` | out | 1 | |
| `Pmod_out_pin1_t` | out | 1 | |
| `Pmod_out_pin2_o` | out | 1 | |
| `Pmod_out_pin2_t` | out | 1 | |
| `Pmod_out_pin3_o` | out | 1 | |
| `Pmod_out_pin3_t` | out | 1 | |
| `Pmod_out_pin4_o` | out | 1 | |
| `Pmod_out_pin4_t` | out | 1 | |
| `Pmod_out_pin7_o` | out | 1 | |
| `Pmod_out_pin7_t` | out | 1 | |
| `Pmod_out_pin8_o` | out | 1 | |
| `Pmod_out_pin8_t` | out | 1 | |
| `Pmod_out_pin9_o` | out | 1 | |
| `Pmod_out_pin9_t` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01886.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
