# Fill in the masked region of `origen_035064`

The file `origen_035064.v` holds a Verilog design whose top module is `origen_035064` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `origen_035064`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_035064.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_035064` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_035064.v`. Only these files are graded.

## Interface of `origen_035064`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `memory_stall` | in | 1 |  |
| `ALU_result_3` | in | 32 |  |
| `writedata_3` | in | 32 |  |
| `D_readData` | in | 32 |  |
| `WriteBack_3` | in | 1 |  |
| `Mem_3` | in | 2 |  |
| `Rd_3` | in | 5 |  |
| `memory_result_4` | out | 32 | |
| `ALU_result_4` | out | 32 | |
| `forward_result_4` | out | 32 | |
| `Rd_4` | out | 5 | |
| `WriteBack_4` | out | 1 | |
| `Mem2Reg` | out | 1 | |
| `D_addr` | out | 30 | |
| `D_wen` | out | 1 | |
| `D_ren` | out | 1 | |
| `D_writeData` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_035064.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
