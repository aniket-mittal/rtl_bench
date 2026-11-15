# Fill in the masked region of `origen_163217`

The file `origen_163217.v` holds a Verilog design whose top module is `origen_163217` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_163217`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_163217.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_163217` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_163217.v`. Only these files are graded.

## Interface of `origen_163217`

| port | dir | width | note |
|---|---|---|---|
| `i_Clk` | in | 1 | clock, rising edge |
| `i_Reset_n` | in | 1 | reset, active low |
| `i_Flush` | in | 1 |  |
| `i_Stall` | in | 1 |  |
| `i_PC` | in | 32 |  |
| `i_Value_Predicted` | in | 1 |  |
| `i_Instruction` | in | 32 |  |
| `i_ALU_Result` | in | 64 |  |
| `i_Mem_Valid` | in | 1 |  |
| `i_Mem_Mask` | in | 8 |  |
| `i_Mem_Read_Write_n` | in | 1 |  |
| `i_Mem_Write_Data` | in | 64 |  |
| `i_Writes_Back` | in | 1 |  |
| `i_VWrite_Addr` | in | 5 |  |
| `i_PWrite_Addr` | in | 5 |  |
| `i_Phys_Active_List_Index` | in | 6 |  |
| `i_Checkpoint` | in | 8 |  |
| `i_Is_Branch` | in | 1 |  |
| `o_PC` | out | 32 | |
| `o_Value_Predicted` | out | 1 | |
| `o_Instruction` | out | 32 | |
| `o_ALU_Result` | out | 64 | |
| `o_Mem_Valid` | out | 1 | |
| `o_Mem_Mask` | out | 8 | |
| `o_Mem_Read_Write_n` | out | 1 | |
| `o_Mem_Write_Data` | out | 64 | |
| `o_Writes_Back` | out | 1 | |
| `o_VWrite_Addr` | out | 5 | |
| `o_PWrite_Addr` | out | 5 | |
| `o_Phys_Active_List_Index` | out | 6 | |
| `o_Checkpoint` | out | 8 | |
| `o_Is_Branch` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_163217.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
