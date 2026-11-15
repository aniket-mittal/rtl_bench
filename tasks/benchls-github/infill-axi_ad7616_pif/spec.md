# Fill in the masked region of `axi_ad7616_pif`

The file `axi_ad7616_pif.v` holds a Verilog design whose top module is `axi_ad7616_pif` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `axi_ad7616_pif`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-10.analog-hdl.

## Rules

- Edit only `axi_ad7616_pif.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `axi_ad7616_pif` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `axi_ad7616_pif.v`. Only these files are graded.

## Interface of `axi_ad7616_pif`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `db_i` | in | 16 |  |
| `end_of_conv` | in | 1 |  |
| `burst_length` | in | 5 |  |
| `rstn` | in | 1 | reset, active low |
| `rd_req` | in | 1 |  |
| `wr_req` | in | 1 |  |
| `wr_data` | in | 16 |  |
| `cs_n` | out | 1 | |
| `db_o` | out | 16 | |
| `db_t` | out | 1 | |
| `rd_n` | out | 1 | |
| `wr_n` | out | 1 | |
| `adc_data_0` | out | 16 | |
| `adc_data_1` | out | 16 | |
| `adc_data_2` | out | 16 | |
| `adc_data_3` | out | 16 | |
| `adc_data_4` | out | 16 | |
| `adc_data_5` | out | 16 | |
| `adc_data_6` | out | 16 | |
| `adc_data_7` | out | 16 | |
| `adc_data_8` | out | 16 | |
| `adc_data_9` | out | 16 | |
| `adc_data_10` | out | 16 | |
| `adc_data_11` | out | 16 | |
| `adc_data_12` | out | 16 | |
| `adc_data_13` | out | 16 | |
| `adc_data_14` | out | 16 | |
| `adc_data_15` | out | 16 | |
| `adc_valid` | out | 1 | |
| `rd_data` | out | 16 | |
| `rd_valid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v axi_ad7616_pif.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
