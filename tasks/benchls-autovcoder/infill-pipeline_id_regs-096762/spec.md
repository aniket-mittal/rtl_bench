# Fill in the masked region of `autovcoder_096762`

The file `autovcoder_096762.v` holds a Verilog design whose top module is `autovcoder_096762` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_096762`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_096762.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_096762` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_096762.v`. Only these files are graded.

## Interface of `autovcoder_096762`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `clr` | in | 1 |  |
| `newPC` | in | 32 |  |
| `busA` | in | 32 |  |
| `busB` | in | 32 |  |
| `Inst` | in | 32 |  |
| `ExtOp` | in | 1 |  |
| `ALUSrc` | in | 1 |  |
| `ALUop` | in | 4 |  |
| `RegDst` | in | 1 |  |
| `MemWr` | in | 1 |  |
| `RegWr` | in | 1 |  |
| `RegWr_4` | in | 1 |  |
| `RegWr_3` | in | 1 |  |
| `RegWr_2` | in | 1 |  |
| `RegWr_1` | in | 1 |  |
| `MemtoReg` | in | 1 |  |
| `Branch` | in | 1 |  |
| `Jump` | in | 1 |  |
| `l_r` | in | 1 |  |
| `lorr` | in | 1 |  |
| `shift` | in | 5 |  |
| `OVSel` | in | 1 |  |
| `newPC_f` | out | 32 | |
| `busA_f` | out | 32 | |
| `busB_f` | out | 32 | |
| `Inst_f` | out | 32 | |
| `ExtOp_f` | out | 1 | |
| `ALUSrc_f` | out | 1 | |
| `ALUop_f` | out | 4 | |
| `RegDst_f` | out | 1 | |
| `MemWr_f` | out | 1 | |
| `RegWr_f` | out | 1 | |
| `RegWr_4f` | out | 1 | |
| `RegWr_3f` | out | 1 | |
| `RegWr_2f` | out | 1 | |
| `RegWr_1f` | out | 1 | |
| `MemtoReg_f` | out | 1 | |
| `Branch_f` | out | 1 | |
| `Jump_f` | out | 1 | |
| `l_rf` | out | 1 | |
| `lorr_f` | out | 1 | |
| `shift_f` | out | 5 | |
| `OVSel_f` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_096762.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
