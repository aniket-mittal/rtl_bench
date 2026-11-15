# Fill in the masked region of `mg_02887`

The file `mg_02887.v` holds a Verilog design whose top module is `mg_02887` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **module**. The body of `module mg_02887` (the top module) was removed. Its header (`module mg_02887 ... );`) and its `endmodule` are still in place. `[MASKED]` stands for everything in between: port direction and width declarations (for a non-ANSI header), internal signals, and logic.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_02887.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_02887` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_02887.v`. Only these files are graded.

## Interface of `mg_02887`

| port | dir | width | note |
|---|---|---|---|
| `WVAL` | in | 1 |  |
| `WGET` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_02887.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
