# Fill in the masked region of `origen_060581`

The file `origen_060581.v` holds a Verilog design whose top module is `origen_060581` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_060581`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_060581.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_060581` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_060581.v`. Only these files are graded.

## Interface of `origen_060581`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `EX_MWrite` | in | 1 |  |
| `EX_MemtoReg` | in | 1 |  |
| `EX_RegWrite` | in | 1 |  |
| `EX_MemWrite` | in | 1 |  |
| `EX_Jal` | in | 1 |  |
| `EX_Half` | in | 1 |  |
| `EX_ALU_result` | in | 32 |  |
| `EX_Rt_data` | in | 32 |  |
| `EX_PCplus8` | in | 18 |  |
| `EX_WR_out` | in | 5 |  |
| `M_MemtoReg` | out | 1 | |
| `M_RegWrite` | out | 1 | |
| `M_MemWrite` | out | 1 | |
| `M_Jal` | out | 1 | |
| `M_Half` | out | 1 | |
| `M_ALU_result` | out | 32 | |
| `M_Rt_data` | out | 32 | |
| `M_PCplus8` | out | 18 | |
| `M_WR_out` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_060581.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
