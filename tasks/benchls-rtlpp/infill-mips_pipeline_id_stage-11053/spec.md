# Fill in the masked region of `rtlpp_11053`

The file `rtlpp_11053.v` holds a Verilog design whose top module is `rtlpp_11053` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_11053`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_11053.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_11053` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_11053.v`. Only these files are graded.

## Interface of `rtlpp_11053`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `ID_Flush` | in | 1 |  |
| `ID_Stall` | in | 1 |  |
| `EX_Stall` | in | 1 |  |
| `ID_Link` | in | 1 |  |
| `ID_RegDst` | in | 1 |  |
| `ID_ALUSrcImm` | in | 1 |  |
| `ID_ALUOp` | in | 5 |  |
| `ID_Movn` | in | 1 |  |
| `ID_Movz` | in | 1 |  |
| `ID_LLSC` | in | 1 |  |
| `ID_MemRead` | in | 1 |  |
| `ID_MemWrite` | in | 1 |  |
| `ID_MemByte` | in | 1 |  |
| `ID_MemHalf` | in | 1 |  |
| `ID_MemSignExtend` | in | 1 |  |
| `ID_Left` | in | 1 |  |
| `ID_Right` | in | 1 |  |
| `ID_RegWrite` | in | 1 |  |
| `ID_MemtoReg` | in | 1 |  |
| `ID_ReverseEndian` | in | 1 |  |
| `ID_Rs` | in | 5 |  |
| `ID_Rt` | in | 5 |  |
| `ID_WantRsByEX` | in | 1 |  |
| `ID_NeedRsByEX` | in | 1 |  |
| `ID_WantRtByEX` | in | 1 |  |
| `ID_NeedRtByEX` | in | 1 |  |
| `ID_KernelMode` | in | 1 |  |
| `ID_RestartPC` | in | 32 |  |
| `ID_IsBDS` | in | 1 |  |
| `ID_Trap` | in | 1 |  |
| `ID_TrapCond` | in | 1 |  |
| `ID_EX_CanErr` | in | 1 |  |
| `ID_M_CanErr` | in | 1 |  |
| `ID_ReadData1` | in | 32 |  |
| `ID_ReadData2` | in | 32 |  |
| `ID_SignExtImm` | in | 17 |  |
| `EX_Link` | out | 1 | |
| `EX_LinkRegDst` | out | 2 | |
| `EX_ALUSrcImm` | out | 1 | |
| `EX_ALUOp` | out | 5 | |
| `EX_Movn` | out | 1 | |
| `EX_Movz` | out | 1 | |
| `EX_LLSC` | out | 1 | |
| `EX_MemRead` | out | 1 | |
| `EX_MemWrite` | out | 1 | |
| `EX_MemByte` | out | 1 | |
| `EX_MemHalf` | out | 1 | |
| `EX_MemSignExtend` | out | 1 | |
| `EX_Left` | out | 1 | |
| `EX_Right` | out | 1 | |
| `EX_RegWrite` | out | 1 | |
| `EX_MemtoReg` | out | 1 | |
| `EX_ReverseEndian` | out | 1 | |
| `EX_Rs` | out | 5 | |
| `EX_Rt` | out | 5 | |
| `EX_WantRsByEX` | out | 1 | |
| `EX_NeedRsByEX` | out | 1 | |
| `EX_WantRtByEX` | out | 1 | |
| `EX_NeedRtByEX` | out | 1 | |
| `EX_KernelMode` | out | 1 | |
| `EX_RestartPC` | out | 32 | |
| `EX_IsBDS` | out | 1 | |
| `EX_Trap` | out | 1 | |
| `EX_TrapCond` | out | 1 | |
| `EX_EX_CanErr` | out | 1 | |
| `EX_M_CanErr` | out | 1 | |
| `EX_ReadData1` | out | 32 | |
| `EX_ReadData2` | out | 32 | |
| `EX_SignExtImm` | out | 32 | |
| `EX_Rd` | out | 5 | |
| `EX_Shamt` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_11053.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
