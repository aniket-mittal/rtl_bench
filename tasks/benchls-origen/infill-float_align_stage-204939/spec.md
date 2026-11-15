# Fill in the masked region of `origen_204939`

The file `origen_204939.v` holds a Verilog design whose top module is `origen_204939` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_204939`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_204939.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_204939` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_204939.v`. Only these files are graded.

## Interface of `origen_204939`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `idle_Allign` | in | 2 |  |
| `cout_Allign` | in | 36 |  |
| `zout_Allign` | in | 36 |  |
| `sout_Allign` | in | 32 |  |
| `modeout_Allign` | in | 2 |  |
| `operationout_Allign` | in | 1 |  |
| `NatLogFlagout_Allign` | in | 1 |  |
| `difference_Allign` | in | 8 |  |
| `InsTag_Allign` | in | 8 |  |
| `idle_Allign2` | out | 2 | |
| `cout_Allign2` | out | 36 | |
| `zout_Allign2` | out | 36 | |
| `sout_Allign2` | out | 32 | |
| `modeout_Allign2` | out | 2 | |
| `operationout_Allign2` | out | 1 | |
| `NatLogFlagout_Allign2` | out | 1 | |
| `InsTag_Allign2` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_204939.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
