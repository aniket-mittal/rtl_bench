# Fill in the masked region of `origen_162416`

The file `origen_162416.v` holds a Verilog design whose top module is `origen_162416` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_162416`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_162416.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_162416` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_162416.v`. Only these files are graded.

## Interface of `origen_162416`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `umbralMF` | in | 1 |  |
| `umbralVC` | in | 1 |  |
| `umbralD` | in | 1 |  |
| `Fifo_empties` | in | 1 |  |
| `Fifo_errors` | in | 1 |  |
| `init` | in | 1 |  |
| `init_out` | out | 1 | |
| `idle_out` | out | 1 | |
| `active_out` | out | 1 | |
| `error_out` | out | 1 | |
| `umbralMF_out` | out | 8 | |
| `umbralVC_out` | out | 8 | |
| `umbralD_out` | out | 8 | |
| `state` | out | 3 | |
| `next_state` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_162416.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
