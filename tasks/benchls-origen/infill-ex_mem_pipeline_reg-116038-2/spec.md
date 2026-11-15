# Fill in the masked region of `origen_116038`

The file `origen_116038.v` holds a Verilog design whose top module is `origen_116038` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_116038`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_116038.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_116038` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_116038.v`. Only these files are graded.

## Interface of `origen_116038`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `Branch` | in | 1 |  |
| `MemRead` | in | 1 |  |
| `MemWrite` | in | 1 |  |
| `RegWrite` | in | 1 |  |
| `MemtoReg` | in | 1 |  |
| `mux_ForwardB` | in | 64 |  |
| `mux_ALU` | in | 64 |  |
| `ALUzero` | in | 1 |  |
| `adder2out` | in | 64 |  |
| `rd` | in | 5 |  |
| `EX_MEM_Branch` | out | 1 | |
| `EX_MEM_MemRead` | out | 1 | |
| `EX_MEM_MemWrite` | out | 1 | |
| `EX_MEM_RegWrite` | out | 1 | |
| `EX_MEM_MemtoReg` | out | 1 | |
| `EX_MEM_mux_ForwardB` | out | 64 | |
| `EX_MEM_mux_ALU` | out | 64 | |
| `EX_MEM_ALUzero` | out | 1 | |
| `EX_MEM_adder2out` | out | 64 | |
| `EX_MEM_rd` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_116038.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
