# Fill in the masked region of `origen_148357`

The file `origen_148357.v` holds a Verilog design whose top module is `origen_148357` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_148357`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_148357.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_148357` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_148357.v`. Only these files are graded.

## Interface of `origen_148357`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `mwaddr` | in | 6 |  |
| `mraddr` | in | 6 |  |
| `win_ready` | in | 1 |  |
| `win_valid` | in | 1 |  |
| `mrdata_s` | in | 17 |  |
| `mrd` | out | 1 | |
| `mrvalid` | out | 1 | |
| `mrdata` | out | 17 | |
| `mdata_0` | out | 17 | |
| `mdata_1` | out | 17 | |
| `mdata_2` | out | 17 | |
| `mdata_3` | out | 17 | |
| `mvalid_0` | out | 1 | |
| `mvalid_1` | out | 1 | |
| `mvalid_2` | out | 1 | |
| `mvalid_3` | out | 1 | |
| `win_last` | out | 1 | |
| `win_data` | out | 68 | |
| `adc_ready` | out | 1 | |
| `win_valid_out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_148357.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
