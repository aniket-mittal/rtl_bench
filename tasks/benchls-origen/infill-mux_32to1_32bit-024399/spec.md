# Fill in the masked region of `origen_024399`

The file `origen_024399.v` holds a Verilog design whose top module is `origen_024399` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_024399`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_024399.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_024399` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_024399.v`. Only these files are graded.

## Interface of `origen_024399`

| port | dir | width | note |
|---|---|---|---|
| `R0` | in | 32 |  |
| `R1` | in | 32 |  |
| `R2` | in | 32 |  |
| `R3` | in | 32 |  |
| `R4` | in | 32 |  |
| `R5` | in | 32 |  |
| `R6` | in | 32 |  |
| `R7` | in | 32 |  |
| `R8` | in | 32 |  |
| `R9` | in | 32 |  |
| `R10` | in | 32 |  |
| `R11` | in | 32 |  |
| `R12` | in | 32 |  |
| `R13` | in | 32 |  |
| `R14` | in | 32 |  |
| `R15` | in | 32 |  |
| `R16` | in | 32 |  |
| `R17` | in | 32 |  |
| `R18` | in | 32 |  |
| `R19` | in | 32 |  |
| `R20` | in | 32 |  |
| `R21` | in | 32 |  |
| `R22` | in | 32 |  |
| `R23` | in | 32 |  |
| `R24` | in | 32 |  |
| `R25` | in | 32 |  |
| `R26` | in | 32 |  |
| `R27` | in | 32 |  |
| `R28` | in | 32 |  |
| `R29` | in | 32 |  |
| `R30` | in | 32 |  |
| `R31` | in | 32 |  |
| `s` | in | 5 |  |
| `out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_024399.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
