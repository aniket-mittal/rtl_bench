# Fill in the masked region of `origen_180655`

The file `origen_180655.v` holds a Verilog design whose top module is `origen_180655` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_180655`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_180655.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_180655` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_180655.v`. Only these files are graded.

## Interface of `origen_180655`

| port | dir | width | note |
|---|---|---|---|
| `Clk` | in | 1 | clock, rising edge |
| `RA` | in | 5 |  |
| `RB` | in | 5 |  |
| `RW` | in | 5 |  |
| `BusW` | in | 32 |  |
| `RegWr` | in | 1 |  |
| `Rst` | in | 1 | reset, active high |
| `BusA` | out | 32 | |
| `BusB` | out | 32 | |
| `regOut0` | out | 32 | |
| `regOut1` | out | 32 | |
| `regOut2` | out | 32 | |
| `regOut3` | out | 32 | |
| `regOut4` | out | 32 | |
| `regOut5` | out | 32 | |
| `regOut6` | out | 32 | |
| `regOut7` | out | 32 | |
| `regOut8` | out | 32 | |
| `regOut9` | out | 32 | |
| `regOut10` | out | 32 | |
| `regOut11` | out | 32 | |
| `regOut12` | out | 32 | |
| `regOut13` | out | 32 | |
| `regOut14` | out | 32 | |
| `regOut15` | out | 32 | |
| `regOut16` | out | 32 | |
| `regOut17` | out | 32 | |
| `regOut18` | out | 32 | |
| `regOut19` | out | 32 | |
| `regOut20` | out | 32 | |
| `regOut21` | out | 32 | |
| `regOut22` | out | 32 | |
| `regOut23` | out | 32 | |
| `regOut24` | out | 32 | |
| `regOut25` | out | 32 | |
| `regOut26` | out | 32 | |
| `regOut27` | out | 32 | |
| `regOut28` | out | 32 | |
| `regOut29` | out | 32 | |
| `regOut30` | out | 32 | |
| `regOut31` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_180655.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
