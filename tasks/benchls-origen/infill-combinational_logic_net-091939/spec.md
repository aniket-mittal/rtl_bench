# Fill in the masked region of `origen_091939`

The file `origen_091939.v` holds a Verilog design whose top module is `origen_091939` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `origen_091939`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_091939.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_091939` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_091939.v`. Only these files are graded.

## Interface of `origen_091939`

| port | dir | width | note |
|---|---|---|---|
| `x00` | in | 1 |  |
| `x01` | in | 1 |  |
| `x02` | in | 1 |  |
| `x03` | in | 1 |  |
| `x04` | in | 1 |  |
| `x05` | in | 1 |  |
| `x06` | in | 1 |  |
| `x07` | in | 1 |  |
| `x08` | in | 1 |  |
| `x09` | in | 1 |  |
| `x10` | in | 1 |  |
| `x11` | in | 1 |  |
| `x12` | in | 1 |  |
| `x13` | in | 1 |  |
| `x14` | in | 1 |  |
| `x15` | in | 1 |  |
| `x16` | in | 1 |  |
| `x17` | in | 1 |  |
| `x18` | in | 1 |  |
| `x19` | in | 1 |  |
| `x20` | in | 1 |  |
| `x21` | in | 1 |  |
| `x22` | in | 1 |  |
| `x23` | in | 1 |  |
| `x24` | in | 1 |  |
| `z00` | out | 1 | |
| `z01` | out | 1 | |
| `z02` | out | 1 | |
| `z03` | out | 1 | |
| `z04` | out | 1 | |
| `z05` | out | 1 | |
| `z06` | out | 1 | |
| `z07` | out | 1 | |
| `z08` | out | 1 | |
| `z09` | out | 1 | |
| `z10` | out | 1 | |
| `z11` | out | 1 | |
| `z12` | out | 1 | |
| `z13` | out | 1 | |
| `z14` | out | 1 | |
| `z15` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_091939.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
