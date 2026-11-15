# Fill in the masked region of `mg_06420`

The file `mg_06420.v` holds a Verilog design whose top module is `mg_06420` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `mg_06420` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_06420.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_06420` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_06420.v`. Only these files are graded.

## Interface of `mg_06420`

| port | dir | width | note |
|---|---|---|---|
| `o1` | out | 4 | |
| `o2` | out | 4 | |
| `o3` | out | 4 | |
| `o4` | out | 4 | |
| `o5` | out | 4 | |
| `o6` | out | 4 | |
| `o7` | out | 4 | |
| `o8` | out | 4 | |
| `o9` | out | 4 | |
| `yay1` | out | 3 | |
| `nay1` | out | 3 | |
| `yay2` | out | 3 | |
| `nay2` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_06420.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
