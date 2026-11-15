# Fill in the masked region of `origen_070832`

The file `origen_070832.v` holds a Verilog design whose top module is `origen_070832` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_070832`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_070832.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_070832` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_070832.v`. Only these files are graded.

## Interface of `origen_070832`

| port | dir | width | note |
|---|---|---|---|
| `Clk` | in | 1 | clock, rising edge |
| `MemRead_in` | in | 1 |  |
| `MemWrite_in` | in | 1 |  |
| `RegWrite_in` | in | 1 |  |
| `regWrite_jal_in` | in | 1 |  |
| `MemToReg_in` | in | 1 |  |
| `HiOrLo_in` | in | 1 |  |
| `HiLoReg_in` | in | 1 |  |
| `Add64_in` | in | 1 |  |
| `HiLoSelect_in` | in | 1 |  |
| `HiRsSel_in` | in | 1 |  |
| `WriteHi_in` | in | 1 |  |
| `WriteLo_in` | in | 1 |  |
| `ALU_in` | in | 32 |  |
| `ALU_hi_in` | in | 32 |  |
| `RtRd_in` | in | 5 |  |
| `Read1_in` | in | 32 |  |
| `Read2_in` | in | 32 |  |
| `PC_in` | in | 32 |  |
| `MEMop_in` | in | 4 |  |
| `MemRead_out` | out | 1 | |
| `MemWrite_out` | out | 1 | |
| `RegWrite_out` | out | 1 | |
| `regWrite_jal_out` | out | 1 | |
| `MemToReg_out` | out | 1 | |
| `HiOrLo_out` | out | 1 | |
| `HiLoReg_out` | out | 1 | |
| `Add64_out` | out | 1 | |
| `HiLoSelect_out` | out | 1 | |
| `HiRsSel_out` | out | 1 | |
| `WriteHi_out` | out | 1 | |
| `WriteLo_out` | out | 1 | |
| `ALU_out` | out | 32 | |
| `ALU_hi_out` | out | 32 | |
| `RtRd_out` | out | 5 | |
| `Read1_out` | out | 32 | |
| `Read2_out` | out | 32 | |
| `PC_out` | out | 32 | |
| `MEMop_out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_070832.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
