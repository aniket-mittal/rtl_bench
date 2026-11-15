# Fill in the masked region of `fiftyfivenm_io_obuf`

The file `fiftyfivenm_io_obuf.v` holds a Verilog design whose top module is `fiftyfivenm_io_obuf` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `fiftyfivenm_io_obuf`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `fiftyfivenm_io_obuf.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `fiftyfivenm_io_obuf` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `fiftyfivenm_io_obuf.v`. Only these files are graded.

## Interface of `fiftyfivenm_io_obuf`

| port | dir | width | note |
|---|---|---|---|
| `i` | in | 1 |  |
| `oe` | in | 1 |  |
| `seriesterminationcontrol` | in | 16 |  |
| `devoe` | in | 1 |  |
| `o` | out | 1 | |
| `obar` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v fiftyfivenm_io_obuf.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
