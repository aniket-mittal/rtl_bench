# Fill in the masked region of `adc_ad7928`

The file `adc_ad7928.v` holds a Verilog design whose top module is `adc_ad7928` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `adc_ad7928`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-25.FPGA-FOC.

## Rules

- Edit only `adc_ad7928.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `adc_ad7928` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `adc_ad7928.v`. Only these files are graded.

## Interface of `adc_ad7928`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rstn` | in | 1 | reset, active low |
| `spi_miso` | in | 1 |  |
| `i_sn_adc` | in | 1 |  |
| `spi_ss` | out | 1 | |
| `spi_sck` | out | 1 | |
| `spi_mosi` | out | 1 | |
| `o_en_adc` | out | 1 | |
| `o_adc_value0` | out | 12 | |
| `o_adc_value1` | out | 12 | |
| `o_adc_value2` | out | 12 | |
| `o_adc_value3` | out | 12 | |
| `o_adc_value4` | out | 12 | |
| `o_adc_value5` | out | 12 | |
| `o_adc_value6` | out | 12 | |
| `o_adc_value7` | out | 12 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v adc_ad7928.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
