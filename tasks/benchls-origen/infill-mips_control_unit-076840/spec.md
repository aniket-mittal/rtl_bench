# Fill in the masked region of `origen_076840`

The file `origen_076840.v` holds a Verilog design whose top module is `origen_076840` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_076840`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_076840.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_076840` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_076840.v`. Only these files are graded.

## Interface of `origen_076840`

| port | dir | width | note |
|---|---|---|---|
| `OP` | in | 6 |  |
| `FUNCT` | in | 6 |  |
| `zero` | in | 1 |  |
| `overflow` | in | 1 |  |
| `RegDst` | out | 1 | |
| `RegWr` | out | 1 | |
| `MemWr` | out | 1 | |
| `MemToReg` | out | 1 | |
| `ALUctrl` | out | 4 | |
| `ALUsrc` | out | 1 | |
| `IsJump` | out | 1 | |
| `IsJAL` | out | 1 | |
| `IsJR` | out | 1 | |
| `IsBranch` | out | 1 | |
| `pcEnable` | out | 1 | |
| `controlLUT0` | out | 1 | |
| `if_Idreg` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_076840.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
