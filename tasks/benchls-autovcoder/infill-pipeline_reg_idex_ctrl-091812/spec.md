# Fill in the masked region of `autovcoder_091812`

The file `autovcoder_091812.v` holds a Verilog design whose top module is `autovcoder_091812` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_091812`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_091812.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_091812` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_091812.v`. Only these files are graded.

## Interface of `autovcoder_091812`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `control_signal` | in | 10 |  |
| `Read_Data1` | in | 32 |  |
| `Read_Data2` | in | 32 |  |
| `Sign_Ext` | in | 32 |  |
| `IF_Inst` | in | 32 |  |
| `Reg_Write` | out | 1 | |
| `Mem_to_Reg` | out | 1 | |
| `Mem_Write` | out | 1 | |
| `Mem_Read` | out | 1 | |
| `ALU_Src` | out | 1 | |
| `Reg_Dst` | out | 1 | |
| `ALU_Op` | out | 4 | |
| `Read_Data1_Out` | out | 32 | |
| `Read_Data2_Out` | out | 32 | |
| `shift_amount_out` | out | 5 | |
| `Sign_Ext_out` | out | 32 | |
| `rs` | out | 5 | |
| `rt` | out | 5 | |
| `rd` | out | 5 | |
| `func_field` | out | 6 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_091812.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
