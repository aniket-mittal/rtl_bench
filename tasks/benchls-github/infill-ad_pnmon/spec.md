# Fill in the masked region of `ad_pnmon`

The file `ad_pnmon.v` holds a Verilog design whose top module is `ad_pnmon` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `ad_pnmon`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-10.analog-hdl.

## Rules

- Edit only `ad_pnmon.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `ad_pnmon` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `ad_pnmon.v`. Only these files are graded.

## Interface of `ad_pnmon`

| port | dir | width | note |
|---|---|---|---|
| `adc_clk` | in | 1 | clock, rising edge |
| `adc_valid_in` | in | 1 |  |
| `adc_data_in` | in | 16 |  |
| `adc_data_pn` | in | 16 |  |
| `adc_pattern_has_zero` | in | 1 |  |
| `adc_pn_oos` | out | 1 | |
| `adc_pn_err` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v ad_pnmon.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
