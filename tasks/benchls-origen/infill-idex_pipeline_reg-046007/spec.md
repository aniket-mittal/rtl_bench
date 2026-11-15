# Fill in the masked region of `origen_046007`

The file `origen_046007.v` holds a Verilog design whose top module is `origen_046007` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_046007`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_046007.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_046007` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_046007.v`. Only these files are graded.

## Interface of `origen_046007`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `Flush` | in | 1 |  |
| `Freeze` | in | 1 |  |
| `Dest_in` | in | 5 |  |
| `Val1_in` | in | 32 |  |
| `Val2_in` | in | 32 |  |
| `Reg2_in` | in | 32 |  |
| `PC_in` | in | 32 |  |
| `EXE_CMD_in` | in | 4 |  |
| `MEM_R_EN_in` | in | 1 |  |
| `MEM_W_EN_in` | in | 1 |  |
| `WB_EN_in` | in | 1 |  |
| `Branch_Type_in` | in | 2 |  |
| `is_imm_in` | in | 1 |  |
| `src1_in` | in | 5 |  |
| `src2_in` | in | 5 |  |
| `Dest` | out | 5 | |
| `Val1` | out | 32 | |
| `Val2` | out | 32 | |
| `Reg2` | out | 32 | |
| `PC` | out | 32 | |
| `EXE_CMD` | out | 4 | |
| `MEM_R_EN` | out | 1 | |
| `MEM_W_EN` | out | 1 | |
| `WB_EN` | out | 1 | |
| `Branch_Type` | out | 2 | |
| `is_imm` | out | 1 | |
| `src1` | out | 5 | |
| `src2` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_046007.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
