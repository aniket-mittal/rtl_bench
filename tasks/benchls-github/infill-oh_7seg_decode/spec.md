# Fill in the masked region of `oh_7seg_decode`

The file `oh_7seg_decode.v` holds a Verilog design whose top module is `oh_7seg_decode` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `oh_7seg_decode`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: SEC-Flow-Star-repos-31.oh.

## Rules

- Edit only `oh_7seg_decode.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `oh_7seg_decode` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `oh_7seg_decode.v`. Only these files are graded.

## Interface of `oh_7seg_decode`

| port | dir | width | note |
|---|---|---|---|
| `bcd` | in | 4 |  |
| `a` | out | 1 | |
| `b` | out | 1 | |
| `c` | out | 1 | |
| `d` | out | 1 | |
| `e` | out | 1 | |
| `f` | out | 1 | |
| `g` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v oh_7seg_decode.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
