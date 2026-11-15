# Fill in the masked region of `origen_038531`

The file `origen_038531.v` holds a Verilog design whose top module is `origen_038531` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_038531`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_038531.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_038531` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_038531.v`. Only these files are graded.

## Interface of `origen_038531`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `bitsCtr` | in | 9 |  |
| `newpc` | in | 32 |  |
| `read1` | in | 32 |  |
| `read2` | in | 32 |  |
| `extensor` | in | 32 |  |
| `instr_2` | in | 5 |  |
| `instr_1` | in | 5 |  |
| `rs` | in | 5 |  |
| `rt` | in | 5 |  |
| `saidaBitsCtr` | out | 9 | |
| `saidaNewPC` | out | 32 | |
| `saidaRead1` | out | 32 | |
| `saidaRead2` | out | 32 | |
| `saidaExtensor` | out | 32 | |
| `saidaInst_2` | out | 5 | |
| `saidaInst_1` | out | 5 | |
| `rsout` | out | 5 | |
| `rtout` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_038531.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
