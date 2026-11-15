# Fill in the masked region of `origen_096374`

The file `origen_096374.v` holds a Verilog design whose top module is `origen_096374` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_096374`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_096374.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_096374` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_096374.v`. Only these files are graded.

## Interface of `origen_096374`

| port | dir | width | note |
|---|---|---|---|
| `clk_2` | in | 1 | clock, rising edge |
| `SWI` | in | 8 |  |
| `LED` | out | 8 | |
| `SEG` | out | 8 | |
| `lcd_a` | out | 8 | |
| `lcd_b` | out | 8 | |
| `lcd_instruction` | out | 8 | |
| `lcd_registrador` | out | 8 | |
| `lcd_pc` | out | 8 | |
| `lcd_SrcA` | out | 8 | |
| `lcd_SrcB` | out | 8 | |
| `lcd_ALUResult` | out | 8 | |
| `lcd_Result` | out | 8 | |
| `lcd_WriteData` | out | 8 | |
| `lcd_ReadData` | out | 8 | |
| `lcd_MemWrite` | out | 1 | |
| `lcd_Branch` | out | 1 | |
| `lcd_MemtoReg` | out | 1 | |
| `lcd_RegWrite` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_096374.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
