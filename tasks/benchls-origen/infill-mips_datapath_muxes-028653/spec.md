# Fill in the masked region of `origen_028653`

The file `origen_028653.v` holds a Verilog design whose top module is `origen_028653` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_028653`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_028653.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_028653` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_028653.v`. Only these files are graded.

## Interface of `origen_028653`

| port | dir | width | note |
|---|---|---|---|
| `RegDst` | in | 2 |  |
| `ALUSrc` | in | 1 |  |
| `MemToReg` | in | 2 |  |
| `Branch1` | in | 1 |  |
| `Branch2` | in | 1 |  |
| `Branch3` | in | 1 |  |
| `Branch4` | in | 1 |  |
| `Zero` | in | 1 |  |
| `rt` | in | 5 |  |
| `rd` | in | 5 |  |
| `RD2` | in | 32 |  |
| `imm32` | in | 32 |  |
| `Result` | in | 32 |  |
| `imm16_shifted` | in | 32 |  |
| `RD` | in | 32 |  |
| `PC4` | in | 32 |  |
| `PCbeq` | in | 32 |  |
| `PCj` | in | 32 |  |
| `WA` | out | 5 | |
| `B` | out | 32 | |
| `WD` | out | 32 | |
| `next_pc` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_028653.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
