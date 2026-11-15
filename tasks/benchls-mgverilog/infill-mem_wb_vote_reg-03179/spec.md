# Fill in the masked region of `mg_03179`

The file `mg_03179.v` holds a Verilog design whose top module is `mg_03179` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_03179`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03179.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03179` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03179.v`. Only these files are graded.

## Interface of `mg_03179`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `M_Flush` | in | 1 |  |
| `M_Stall` | in | 1 |  |
| `WB_Stall` | in | 1 |  |
| `M_RegWrite` | in | 1 |  |
| `M_MemtoReg` | in | 1 |  |
| `M_ReadData` | in | 32 |  |
| `M_ALU_Result` | in | 32 |  |
| `M_RtRd` | in | 5 |  |
| `WB_RegWrite` | in | 1 |  |
| `WB_MemtoReg` | in | 1 |  |
| `WB_ReadData` | in | 32 |  |
| `WB_ALU_Result` | in | 32 |  |
| `WB_RtRd` | in | 5 |  |
| `vote_WB_RegWrite` | out | 1 | |
| `vote_WB_MemtoReg` | out | 1 | |
| `vote_WB_ReadData` | out | 32 | |
| `vote_WB_ALU_Result` | out | 32 | |
| `vote_WB_RtRd` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03179.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
