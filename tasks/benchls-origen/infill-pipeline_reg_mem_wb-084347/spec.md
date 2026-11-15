# Fill in the masked region of `origen_084347`

The file `origen_084347.v` holds a Verilog design whose top module is `origen_084347` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_084347`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_084347.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_084347` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_084347.v`. Only these files are graded.

## Interface of `origen_084347`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `ALU_R_in` | in | 32 |  |
| `ALU_R2_in` | in | 32 |  |
| `ALU_equal_in` | in | 1 |  |
| `instr_in` | in | 32 |  |
| `ctrl_in` | in | 32 |  |
| `b_equal_res_in` | in | 32 |  |
| `PC0_in` | in | 16 |  |
| `jump_res_in` | in | 32 |  |
| `RF_R2_in` | in | 32 |  |
| `RF_R1_in` | in | 32 |  |
| `ALU_R_out` | out | 32 | |
| `ALU_R2_out` | out | 32 | |
| `ALU_equal_out` | out | 1 | |
| `instr_out` | out | 32 | |
| `ctrl_out` | out | 32 | |
| `b_equal_res_out` | out | 32 | |
| `PC0_out` | out | 16 | |
| `jump_res_out` | out | 32 | |
| `RF_R2_out` | out | 32 | |
| `RF_R1_out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_084347.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
