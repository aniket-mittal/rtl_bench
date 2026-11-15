# Fill in the masked region of `origen_041289`

The file `origen_041289.v` holds a Verilog design whose top module is `origen_041289` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_041289`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_041289.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_041289` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_041289.v`. Only these files are graded.

## Interface of `origen_041289`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `WBE` | in | 2 |  |
| `MemE` | in | 5 |  |
| `PCAdderE` | in | 32 |  |
| `zeroE` | in | 1 |  |
| `ALUResultE` | in | 32 |  |
| `ReadData2E` | in | 32 |  |
| `RegDstE` | in | 5 |  |
| `WBM` | out | 2 | |
| `MemWrite` | out | 1 | |
| `MemRead` | out | 1 | |
| `Branch` | out | 1 | |
| `PCAdderM` | out | 32 | |
| `zeroM` | out | 1 | |
| `ALUResultM` | out | 32 | |
| `ReadData2M` | out | 32 | |
| `RegDstM` | out | 5 | |
| `lbSel` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_041289.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
