# Fill in the masked region of `origen_212139`

The file `origen_212139.v` holds a Verilog design whose top module is `origen_212139` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_212139`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_212139.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_212139` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_212139.v`. Only these files are graded.

## Interface of `origen_212139`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `DX_PC` | in | 32 |  |
| `DX_Branch` | in | 1 |  |
| `DX_MemWrite` | in | 1 |  |
| `DX_MemToReg` | in | 1 |  |
| `DX_RegWrite` | in | 1 |  |
| `lhWrite` | in | 1 |  |
| `lhRead` | in | 1 |  |
| `mflo` | in | 1 |  |
| `ALUSrc` | in | 1 |  |
| `ALUCtr` | in | 4 |  |
| `DX_RD` | in | 5 |  |
| `A` | in | 32 |  |
| `B` | in | 32 |  |
| `Imm` | in | 32 |  |
| `BAddr` | out | 32 | |
| `XF_Branch` | out | 1 | |
| `XM_MemWrite` | out | 1 | |
| `XM_MemToReg` | out | 1 | |
| `XM_RegWrite` | out | 1 | |
| `XM_RD` | out | 5 | |
| `XM_B` | out | 32 | |
| `ALUout` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_212139.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
