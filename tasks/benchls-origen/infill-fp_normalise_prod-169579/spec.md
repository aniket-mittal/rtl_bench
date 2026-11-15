# Fill in the masked region of `origen_169579`

The file `origen_169579.v` holds a Verilog design whose top module is `origen_169579` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_169579`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_169579.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_169579` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_169579.v`. Only these files are graded.

## Interface of `origen_169579`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `cout_Multiply` | in | 32 |  |
| `zout_Multiply` | in | 32 |  |
| `sout_Multiply` | in | 32 |  |
| `productout_Multiply` | in | 32 |  |
| `modeout_Multiply` | in | 2 |  |
| `operationout_Multiply` | in | 2 |  |
| `NatLogFlagout_Multiply` | in | 1 |  |
| `InsTag_Multiply` | in | 1 |  |
| `idle_Multiply` | in | 1 |  |
| `idle_NormaliseProd` | out | 1 | |
| `cout_NormaliseProd` | out | 32 | |
| `zout_NormaliseProd` | out | 32 | |
| `sout_NormaliseProd` | out | 32 | |
| `productout_NormaliseProd` | out | 32 | |
| `modeout_NormaliseProd` | out | 2 | |
| `operationout_NormaliseProd` | out | 2 | |
| `NatLogFlagout_NormaliseProd` | out | 1 | |
| `InsTag_NormaliseProd` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_169579.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
