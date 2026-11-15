# Fill in the masked region of `origen_003867`

The file `origen_003867.v` holds a Verilog design whose top module is `origen_003867` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_003867`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_003867.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_003867` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_003867.v`. Only these files are graded.

## Interface of `origen_003867`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `cout_Multiply` | in | 36 |  |
| `zout_Multiply` | in | 36 |  |
| `sout_Multiply` | in | 32 |  |
| `productout_Multiply` | in | 50 |  |
| `modeout_Multiply` | in | 2 |  |
| `idle_Multiply` | in | 2 |  |
| `operationout_Multiply` | in | 1 |  |
| `NatLogFlagout_Multiply` | in | 1 |  |
| `InsTag_Multiply` | in | 8 |  |
| `cout_Normalise` | out | 36 | |
| `zout_Normalise` | out | 36 | |
| `sout_Normalise` | out | 32 | |
| `productout_Normalise` | out | 50 | |
| `modeout_Normalise` | out | 2 | |
| `idle_Normalise` | out | 2 | |
| `operationout_Normalise` | out | 1 | |
| `NatLogFlagout_Normalise` | out | 1 | |
| `InsTag_Normalise` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_003867.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
