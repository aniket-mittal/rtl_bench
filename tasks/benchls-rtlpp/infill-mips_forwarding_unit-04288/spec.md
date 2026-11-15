# Fill in the masked region of `rtlpp_04288`

The file `rtlpp_04288.v` holds a Verilog design whose top module is `rtlpp_04288` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_04288`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_04288.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_04288` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_04288.v`. Only these files are graded.

## Interface of `rtlpp_04288`

| port | dir | width | note |
|---|---|---|---|
| `DP_Hazards` | in | 8 |  |
| `ID_Rs` | in | 5 |  |
| `ID_Rt` | in | 5 |  |
| `EX_Rs` | in | 5 |  |
| `EX_Rt` | in | 5 |  |
| `EX_RtRd` | in | 5 |  |
| `MEM_RtRd` | in | 5 |  |
| `WB_RtRd` | in | 5 |  |
| `EX_Link` | in | 1 |  |
| `EX_RegWrite` | in | 1 |  |
| `MEM_RegWrite` | in | 1 |  |
| `WB_RegWrite` | in | 1 |  |
| `MEM_MemRead` | in | 1 |  |
| `MEM_MemWrite` | in | 1 |  |
| `InstMem_Read` | in | 1 |  |
| `InstMem_Ready` | in | 1 |  |
| `Mfc0` | in | 1 |  |
| `IF_Exception_Stall` | in | 1 |  |
| `ID_Exception_Stall` | in | 1 |  |
| `EX_Exception_Stall` | in | 1 |  |
| `EX_ALU_Stall` | in | 1 |  |
| `M_Stall_Controller` | in | 1 |  |
| `IF_Stall` | out | 1 | |
| `ID_Stall` | out | 1 | |
| `EX_Stall` | out | 1 | |
| `M_Stall` | out | 1 | |
| `WB_Stall` | out | 1 | |
| `ID_RsFwdSel` | out | 2 | |
| `ID_RtFwdSel` | out | 2 | |
| `EX_RsFwdSel` | out | 2 | |
| `EX_RtFwdSel` | out | 2 | |
| `M_WriteDataFwdSel` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_04288.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
