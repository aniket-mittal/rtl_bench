# Fill in the masked region of `origen_158808`

The file `origen_158808.v` holds a Verilog design whose top module is `origen_158808` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_158808`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_158808.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_158808` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_158808.v`. Only these files are graded.

## Interface of `origen_158808`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `stall` | in | 1 |  |
| `id_inst` | in | 32 |  |
| `id_RFRD1` | in | 32 |  |
| `id_RFRD2` | in | 32 |  |
| `id_RegDst` | in | 1 |  |
| `id_MemRead` | in | 1 |  |
| `id_MemtoReg` | in | 1 |  |
| `id_ALUOp` | in | 2 |  |
| `id_MemWrite` | in | 1 |  |
| `id_ALUSrc` | in | 1 |  |
| `id_RegWrite` | in | 1 |  |
| `id_ShiftIndex` | in | 5 |  |
| `id_ShiftDirection` | in | 1 |  |
| `id_ALUasrc` | in | 1 |  |
| `id_call` | in | 1 |  |
| `id_EXTOUT` | in | 32 |  |
| `id_RegisterRd` | in | 5 |  |
| `id_RegisterRs` | in | 5 |  |
| `id_RegisterRt` | in | 5 |  |
| `id_pcplus4` | in | 32 |  |
| `exe_imm32` | out | 32 | |
| `exe_inst` | out | 32 | |
| `exe_RFRD1` | out | 32 | |
| `exe_RFRD2` | out | 32 | |
| `exe_RegDst` | out | 1 | |
| `exe_MemRead` | out | 1 | |
| `exe_MemtoReg` | out | 1 | |
| `exe_ALUOp` | out | 2 | |
| `exe_MemWrite` | out | 1 | |
| `exe_ALUSrc` | out | 1 | |
| `exe_RegWrite` | out | 1 | |
| `exe_ShiftIndex` | out | 5 | |
| `exe_ShiftDirection` | out | 1 | |
| `exe_ALUasrc` | out | 1 | |
| `exe_call` | out | 1 | |
| `exe_RegisterRd` | out | 5 | |
| `exe_RegisterRs` | out | 5 | |
| `exe_RegisterRt` | out | 5 | |
| `exe_pcplus4` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_158808.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
