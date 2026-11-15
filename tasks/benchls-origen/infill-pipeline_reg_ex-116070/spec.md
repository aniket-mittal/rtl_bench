# Fill in the masked region of `origen_116070`

The file `origen_116070.v` holds a Verilog design whose top module is `origen_116070` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_116070`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_116070.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_116070` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_116070.v`. Only these files are graded.

## Interface of `origen_116070`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `A` | in | 32 |  |
| `B` | in | 32 |  |
| `C` | in | 32 |  |
| `ext` | in | 32 |  |
| `WA3` | in | 4 |  |
| `ALUControl` | in | 4 |  |
| `flags` | in | 4 |  |
| `Cond` | in | 4 |  |
| `RegWrite` | in | 1 |  |
| `PlusOne` | in | 1 |  |
| `Branch` | in | 1 |  |
| `PCSource` | in | 1 |  |
| `ALUSrc` | in | 1 |  |
| `MemtoReg` | in | 1 |  |
| `FlagW` | in | 2 |  |
| `AE` | out | 32 | |
| `BE` | out | 32 | |
| `CE` | out | 32 | |
| `extE` | out | 32 | |
| `WA3E` | out | 4 | |
| `ALUControlE` | out | 4 | |
| `flagsE` | out | 4 | |
| `CondE` | out | 4 | |
| `RegWriteE` | out | 1 | |
| `PlusOneE` | out | 1 | |
| `BranchE` | out | 1 | |
| `PCSourceE` | out | 1 | |
| `ALUSrcE` | out | 1 | |
| `MemtoRegE` | out | 1 | |
| `FlagWE` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_116070.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
