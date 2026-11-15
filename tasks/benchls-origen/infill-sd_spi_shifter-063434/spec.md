# Fill in the masked region of `origen_063434`

The file `origen_063434.v` holds a Verilog design whose top module is `origen_063434` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_063434`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_063434.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_063434` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_063434.v`. Only these files are graded.

## Interface of `origen_063434`

| port | dir | width | note |
|---|---|---|---|
| `CLOCK` | in | 1 | clock, rising edge |
| `nRESET` | in | 1 | reset, active high |
| `CLKEN` | in | 1 |  |
| `ENABLE` | in | 1 |  |
| `nWR` | in | 1 |  |
| `DI` | in | 8 |  |
| `DUMMY` | in | 1 |  |
| `SD_MISO` | in | 1 |  |
| `DO` | out | 8 | |
| `DONE` | out | 1 | |
| `SD_CS` | out | 1 | |
| `SD_CLK` | out | 1 | |
| `SD_MOSI` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_063434.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
