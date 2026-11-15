# Fill in the masked region of `oks8_ior`

The file `oks8_ior.v` holds a Verilog design whose top module is `oks8_ior` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **module**. The body of `module oks8_ior` (the top module) was removed. Its header (`module oks8_ior ... );`) and its `endmodule` are still in place. `[MASKED]` stands for everything in between: port direction and width declarations (for a non-ANSI header), internal signals, and logic.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `oks8_ior.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `oks8_ior` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `oks8_ior.v`. Only these files are graded.

## Interface of `oks8_ior`

| port | dir | width | note |
|---|---|---|---|
| `a_i` | in | 8 |  |
| `b_i` | in | 8 |  |
| `c_o` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v oks8_ior.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
