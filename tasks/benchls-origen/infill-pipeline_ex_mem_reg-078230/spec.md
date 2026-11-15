# Fill in the masked region of `origen_078230`

The file `origen_078230.v` holds a Verilog design whose top module is `origen_078230` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_078230`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_078230.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_078230` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_078230.v`. Only these files are graded.

## Interface of `origen_078230`

| port | dir | width | note |
|---|---|---|---|
| `clockIn` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `stall` | in | 1 |  |
| `memStall` | in | 1 |  |
| `haltIn` | in | 1 |  |
| `regWriteIn` | in | 1 |  |
| `mem2RegIn` | in | 1 |  |
| `memWriteIn` | in | 1 |  |
| `memReadIn` | in | 1 |  |
| `data1In` | in | 32 |  |
| `data2In` | in | 32 |  |
| `regIn` | in | 5 |  |
| `reg2In` | in | 5 |  |
| `haltOut` | out | 1 | |
| `regWriteOut` | out | 1 | |
| `mem2RegOut` | out | 1 | |
| `memWriteOut` | out | 1 | |
| `memReadOut` | out | 1 | |
| `data1Out` | out | 32 | |
| `data2Out` | out | 32 | |
| `regOut` | out | 5 | |
| `reg2Out` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_078230.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
