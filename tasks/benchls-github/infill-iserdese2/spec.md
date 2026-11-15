# Fill in the masked region of `ISERDESE2`

The file `ISERDESE2.v` holds a Verilog design whose top module is `ISERDESE2` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `ISERDESE2`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-31.oh.

## Rules

- Edit only `ISERDESE2.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `ISERDESE2` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `ISERDESE2.v`. Only these files are graded.

## Interface of `ISERDESE2`

| port | dir | width | note |
|---|---|---|---|
| `CLK` | in | 1 | clock, rising edge |
| `BITSLIP` | in | 1 |  |
| `CE1` | in | 1 |  |
| `CE2` | in | 1 |  |
| `CLKB` | in | 1 |  |
| `CLKDIV` | in | 1 |  |
| `CLKDIVP` | in | 1 |  |
| `D` | in | 1 |  |
| `DDLY` | in | 1 |  |
| `DYNCLKDIVSEL` | in | 1 |  |
| `DYNCLKSEL` | in | 1 |  |
| `OCLK` | in | 1 |  |
| `OCLKB` | in | 1 |  |
| `OFB` | in | 1 |  |
| `RST` | in | 1 | reset, active high |
| `SHIFTIN1` | in | 1 |  |
| `SHIFTIN2` | in | 1 |  |
| `O` | out | 1 | |
| `Q1` | out | 1 | |
| `Q2` | out | 1 | |
| `Q3` | out | 1 | |
| `Q4` | out | 1 | |
| `Q5` | out | 1 | |
| `Q6` | out | 1 | |
| `Q7` | out | 1 | |
| `Q8` | out | 1 | |
| `SHIFTOUT1` | out | 1 | |
| `SHIFTOUT2` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v ISERDESE2.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
