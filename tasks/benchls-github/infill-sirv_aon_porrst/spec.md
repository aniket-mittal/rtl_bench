# Fill in the masked region of `sirv_aon_porrst`

The file `sirv_aon_porrst.v` holds a Verilog design whose top module is `sirv_aon_porrst` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **module**. The body of `module sirv_aon_porrst` (the top module) was removed. Its header (`module sirv_aon_porrst ... );`) and its `endmodule` are still in place. `[MASKED]` stands for everything in between: port direction and width declarations (for a non-ANSI header), internal signals, and logic.
- Design type: combinational. Origin: SEC-Flow-Star-repos-4.e200_opensource.

## Rules

- Edit only `sirv_aon_porrst.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `sirv_aon_porrst` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `sirv_aon_porrst.v`. Only these files are graded.

## Interface of `sirv_aon_porrst`

| port | dir | width | note |
|---|---|---|---|
| `porrst_n` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v sirv_aon_porrst.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
