# Fill in the masked region of `origen_168584`

The file `origen_168584.v` holds a Verilog design whose top module is `origen_168584` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_168584`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_168584.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_168584` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_168584.v`. Only these files are graded.

## Interface of `origen_168584`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `MemtoReg_i` | in | 1 |  |
| `MemRead_i` | in | 1 |  |
| `MemWrite_i` | in | 1 |  |
| `Branch_i` | in | 1 |  |
| `RegWrite_i` | in | 1 |  |
| `BranchType_i` | in | 1 |  |
| `RegDst_i` | in | 1 |  |
| `ALUSrc_i` | in | 1 |  |
| `ALUOP_i` | in | 4 |  |
| `program_suppose_i` | in | 32 |  |
| `readData1_i` | in | 32 |  |
| `readData2_i` | in | 32 |  |
| `instance_signExtend_i` | in | 32 |  |
| `instance_zeroFilled_i` | in | 32 |  |
| `instruction_i` | in | 32 |  |
| `MemtoReg_o` | out | 1 | |
| `MemRead_o` | out | 1 | |
| `MemWrite_o` | out | 1 | |
| `Branch_o` | out | 1 | |
| `RegWrite_o` | out | 1 | |
| `BranchType_o` | out | 1 | |
| `RegDst_o` | out | 1 | |
| `ALUSrc_o` | out | 1 | |
| `ALUOP_o` | out | 4 | |
| `program_suppose_o` | out | 32 | |
| `readData1_o` | out | 32 | |
| `readData2_o` | out | 32 | |
| `instance_signExtend_o` | out | 32 | |
| `instance_zeroFilled_o` | out | 32 | |
| `instruction_o` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_168584.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
