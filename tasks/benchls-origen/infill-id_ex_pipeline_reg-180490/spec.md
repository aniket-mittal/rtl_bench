# Fill in the masked region of `origen_180490`

The file `origen_180490.v` holds a Verilog design whose top module is `origen_180490` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_180490`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_180490.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_180490` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_180490.v`. Only these files are graded.

## Interface of `origen_180490`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `Reset` | in | 1 | reset, active high |
| `WB` | in | 2 |  |
| `Mem` | in | 2 |  |
| `EX` | in | 7 |  |
| `PC_id` | in | 32 |  |
| `Imm_id` | in | 32 |  |
| `rdAddr_id` | in | 5 |  |
| `rs1Addr_id` | in | 5 |  |
| `rs2Addr_id` | in | 5 |  |
| `rs1Data_id` | in | 32 |  |
| `rs2Data_id` | in | 32 |  |
| `WB_out_ID_EX` | out | 2 | |
| `Mem_out_ID_EX` | out | 2 | |
| `EX_out` | out | 7 | |
| `PC_ex` | out | 32 | |
| `Imm_ex` | out | 32 | |
| `rdAddr_ex` | out | 5 | |
| `rs1Addr_ex` | out | 5 | |
| `rs2Addr_ex` | out | 5 | |
| `rs1Data_ex` | out | 32 | |
| `rs2Data_ex` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_180490.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
