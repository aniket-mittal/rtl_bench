# Fill in the masked region of `origen_209229`

The file `origen_209229.v` holds a Verilog design whose top module is `origen_209229` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_209229`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_209229.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_209229` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_209229.v`. Only these files are graded.

## Interface of `origen_209229`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `EX_MEM_Branch` | in | 1 |  |
| `EX_MEM_RegWrite` | in | 1 |  |
| `EX_MEM_MemToReg` | in | 1 |  |
| `EX_MEM_MemRead` | in | 1 |  |
| `EX_MEM_MemWrite` | in | 1 |  |
| `EX_MEM_Zero` | in | 1 |  |
| `reset` | in | 1 | reset, active high |
| `EX_MEM_Rd` | in | 5 |  |
| `EX_MEM_Lower_Forwarding_MUX_out` | in | 64 |  |
| `EX_MEM_ALU_result` | in | 64 |  |
| `EX_MEM_Adder` | in | 64 |  |
| `EX_MEM_output_Branch` | out | 1 | |
| `EX_MEM_output_RegWrite` | out | 1 | |
| `EX_MEM_output_MemToReg` | out | 1 | |
| `EX_MEM_output_MemRead` | out | 1 | |
| `EX_MEM_output_MemWrite` | out | 1 | |
| `EX_MEM_output_zero` | out | 1 | |
| `EX_MEM_Adder_output` | out | 64 | |
| `EX_MEM_Lower_Forwarding_MUX_output` | out | 64 | |
| `EX_MEM_ALU_result_output` | out | 64 | |
| `EX_MEM_output_rd` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_209229.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
