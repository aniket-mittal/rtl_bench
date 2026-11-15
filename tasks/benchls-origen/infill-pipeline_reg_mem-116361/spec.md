# Fill in the masked region of `origen_116361`

The file `origen_116361.v` holds a Verilog design whose top module is `origen_116361` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_116361`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_116361.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_116361` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_116361.v`. Only these files are graded.

## Interface of `origen_116361`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `ALUInPipeIn` | in | 32 |  |
| `PCSrcInPipeIn` | in | 1 |  |
| `WriteData2InPipeIn` | in | 32 |  |
| `PCDataInPipeIn` | in | 32 |  |
| `RegWrite` | in | 1 |  |
| `MemRead` | in | 1 |  |
| `MemWrite` | in | 1 |  |
| `MemToReg` | in | 1 |  |
| `WriteRegInPipeIn` | in | 5 |  |
| `ControlHazard` | in | 1 |  |
| `ALUInPipeOut` | out | 32 | |
| `PCSrcInPipeOut` | out | 1 | |
| `WriteData2InPipeOut` | out | 32 | |
| `PCDataInPipeOut` | out | 32 | |
| `RegWriteOut` | out | 1 | |
| `MemReadOut` | out | 1 | |
| `MemWriteOut` | out | 1 | |
| `MemToRegOut` | out | 1 | |
| `WriteRegInPipeOut` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_116361.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
