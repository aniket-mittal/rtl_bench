# Fill in the masked region of `origen_132545`

The file `origen_132545.v` holds a Verilog design whose top module is `origen_132545` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_132545`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_132545.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_132545` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_132545.v`. Only these files are graded.

## Interface of `origen_132545`

| port | dir | width | note |
|---|---|---|---|
| `s_axi_aclk` | in | 1 | clock, rising edge |
| `ext_spi_clk` | in | 1 |  |
| `s_axi_aresetn` | in | 1 | reset, active low |
| `AXI_LITE_SPI_araddr` | in | 7 |  |
| `AXI_LITE_SPI_arvalid` | in | 1 |  |
| `AXI_LITE_SPI_awaddr` | in | 7 |  |
| `AXI_LITE_SPI_awvalid` | in | 1 |  |
| `AXI_LITE_SPI_bready` | in | 1 |  |
| `AXI_LITE_SPI_rready` | in | 1 |  |
| `AXI_LITE_SPI_wdata` | in | 32 |  |
| `AXI_LITE_SPI_wstrb` | in | 4 |  |
| `AXI_LITE_SPI_wvalid` | in | 1 |  |
| `Pmod_out_pin1` | out | 1 | |
| `Pmod_out_pin2` | out | 1 | |
| `Pmod_out_pin3` | out | 1 | |
| `Pmod_out_pin4` | out | 1 | |
| `Pmod_out_pin5` | out | 1 | |
| `Pmod_out_pin6` | out | 1 | |
| `Pmod_out_pin7` | out | 1 | |
| `Pmod_out_pin8` | out | 1 | |
| `Pmod_out_pin9` | out | 1 | |
| `Pmod_out_pin10` | out | 1 | |
| `AXI_LITE_SPI_arready` | out | 1 | |
| `AXI_LITE_SPI_awready` | out | 1 | |
| `AXI_LITE_SPI_bresp` | out | 2 | |
| `AXI_LITE_SPI_bvalid` | out | 1 | |
| `AXI_LITE_SPI_rdata` | out | 32 | |
| `AXI_LITE_SPI_rresp` | out | 2 | |
| `AXI_LITE_SPI_rvalid` | out | 1 | |
| `AXI_LITE_SPI_wready` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_132545.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
