# Fill in the masked region of `autovcoder_079878`

The file `autovcoder_079878.v` holds a Verilog design whose top module is `autovcoder_079878` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_079878`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_079878.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_079878` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_079878.v`. Only these files are graded.

## Interface of `autovcoder_079878`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `samp_done` | in | 1 |  |
| `phy_rddata_en_2` | in | 1 |  |
| `reset_scan` | in | 1 | reset, active low |
| `scanning_right` | in | 1 |  |
| `samp_result` | in | 2 |  |
| `stg3` | in | 6 |  |
| `scan_right` | out | 1 | |
| `z2f` | out | 1 | |
| `f2z` | out | 1 | |
| `o2f` | out | 1 | |
| `f2o` | out | 1 | |
| `zero2fuzz` | out | 6 | |
| `fuzz2zero` | out | 6 | |
| `oneeighty2fuzz` | out | 6 | |
| `fuzz2oneeighty` | out | 6 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_079878.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
