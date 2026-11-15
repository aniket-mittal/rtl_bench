# Fill in the masked region of `origen_010967`

The file `origen_010967.v` holds a Verilog design whose top module is `origen_010967` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_010967`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_010967.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_010967` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_010967.v`. Only these files are graded.

## Interface of `origen_010967`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `en` | in | 1 |  |
| `IRin` | in | 32 |  |
| `PCin` | in | 32 |  |
| `JRin` | in | 1 |  |
| `JMPin` | in | 1 |  |
| `LBUin` | in | 1 |  |
| `BEQin` | in | 1 |  |
| `BNEin` | in | 1 |  |
| `BGEZin` | in | 1 |  |
| `MemToRegin` | in | 1 |  |
| `MemWritein` | in | 1 |  |
| `RegWritein` | in | 1 |  |
| `AluOpin` | in | 4 |  |
| `R1_numin` | in | 5 |  |
| `R2_numin` | in | 5 |  |
| `R1in` | in | 32 |  |
| `R2in` | in | 32 |  |
| `W_numin` | in | 5 |  |
| `imm16in` | in | 16 |  |
| `imm26in` | in | 26 |  |
| `shamtin` | in | 5 |  |
| `IRout` | out | 32 | |
| `PCout` | out | 32 | |
| `JRout` | out | 1 | |
| `JMPout` | out | 1 | |
| `LBUout` | out | 1 | |
| `BEQout` | out | 1 | |
| `BNEout` | out | 1 | |
| `BGEZout` | out | 1 | |
| `MemToRegout` | out | 1 | |
| `MemWriteout` | out | 1 | |
| `RegWriteout` | out | 1 | |
| `AluOpout` | out | 4 | |
| `R1_numout` | out | 5 | |
| `R2_numout` | out | 5 | |
| `R1out` | out | 32 | |
| `R2out` | out | 32 | |
| `W_numout` | out | 5 | |
| `imm16out` | out | 16 | |
| `imm26out` | out | 26 | |
| `shamtout` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_010967.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
