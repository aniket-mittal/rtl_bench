# Fill in the masked region of `rtlpp_07943`

The file `rtlpp_07943.v` holds a Verilog design whose top module is `rtlpp_07943` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_07943`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_07943.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_07943` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_07943.v`. Only these files are graded.

## Interface of `rtlpp_07943`

| port | dir | width | note |
|---|---|---|---|
| `CLK` | in | 1 | clock, rising edge |
| `RESET` | in | 1 | reset, active high |
| `CE_N` | in | 1 |  |
| `CE_P` | in | 1 |  |
| `A` | in | 1 |  |
| `DI` | in | 8 |  |
| `CS_n` | in | 1 |  |
| `WR_n` | in | 1 |  |
| `RD_n` | in | 1 |  |
| `MEM_DO` | in | 8 |  |
| `MEM_WAIT` | in | 1 |  |
| `DO` | out | 8 | |
| `MEM_ADDR` | out | 21 | |
| `MEM_DI` | out | 8 | |
| `MEM_RD` | out | 1 | |
| `MEM_WR` | out | 1 | |
| `OUTL` | out | 15 | |
| `OUTR` | out | 15 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_07943.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
