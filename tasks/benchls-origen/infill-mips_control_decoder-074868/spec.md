# Fill in the masked region of `origen_074868`

The file `origen_074868.v` holds a Verilog design whose top module is `origen_074868` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_074868`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_074868.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_074868` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_074868.v`. Only these files are graded.

## Interface of `origen_074868`

| port | dir | width | note |
|---|---|---|---|
| `op` | in | 6 |  |
| `low6` | in | 6 |  |
| `instr` | in | 32 |  |
| `aluCtrl` | out | 5 | |
| `ifWrGrf` | out | 1 | |
| `grfWa` | out | 5 | |
| `grfRa1` | out | 5 | |
| `grfRa2` | out | 5 | |
| `ifReDm` | out | 1 | |
| `ifWrDm` | out | 1 | |
| `ifBeq` | out | 1 | |
| `ifJal` | out | 1 | |
| `ifJr` | out | 1 | |
| `ifJ` | out | 1 | |
| `ifImmExt` | out | 1 | |
| `tUseRs` | out | 2 | |
| `tUseRt` | out | 2 | |
| `tNew` | out | 2 | |
| `ifAddu` | out | 1 | |
| `ifSubu` | out | 1 | |
| `ifOri` | out | 1 | |
| `ifLui` | out | 1 | |
| `ifLw` | out | 1 | |
| `ifSw` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_074868.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
