# Fill in the masked region of `origen_070793`

The file `origen_070793.v` holds a Verilog design whose top module is `origen_070793` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_070793`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_070793.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_070793` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_070793.v`. Only these files are graded.

## Interface of `origen_070793`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `clrn` | in | 1 | reset, active low |
| `ealu` | in | 32 |  |
| `eb` | in | 32 |  |
| `pce` | in | 32 |  |
| `ern` | in | 5 |  |
| `ewreg` | in | 1 |  |
| `em2reg` | in | 1 |  |
| `ewmem` | in | 1 |  |
| `ermem` | in | 1 |  |
| `erio` | in | 1 |  |
| `ewio` | in | 1 |  |
| `malu` | out | 32 | |
| `mb` | out | 32 | |
| `pcm` | out | 32 | |
| `mrn` | out | 5 | |
| `mwreg` | out | 1 | |
| `mm2reg` | out | 1 | |
| `mwmem` | out | 1 | |
| `mrmem` | out | 1 | |
| `mrio` | out | 1 | |
| `mwio` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_070793.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
