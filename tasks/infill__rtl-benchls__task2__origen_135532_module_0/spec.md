# Fill in the masked region of `origen_135532`

The file `origen_135532.v` holds a Verilog design whose top module is `origen_135532` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **module**. The body of `module ripple_carry_adder` (a sub-module) was removed. Its header (`module ripple_carry_adder ... );`) and its `endmodule` are still in place. `[MASKED]` stands for everything in between: port direction and width declarations (for a non-ANSI header), internal signals, and logic.
- See how `ripple_carry_adder` is instantiated elsewhere in the design. Its port connections and parameters show what it must compute.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_135532.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_135532` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_135532.v`. Only these files are graded.

## Interface of `origen_135532`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 16 |  |
| `B` | in | 16 |  |
| `CTRL` | in | 4 |  |
| `Result` | out | 16 | |
| `Overflow` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_135532.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
