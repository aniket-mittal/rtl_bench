# Fill in the masked region of `autovcoder_124239`

The file `autovcoder_124239.v` holds a Verilog design whose top module is `autovcoder_124239` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_124239`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_124239.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_124239` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_124239.v`. Only these files are graded.

## Interface of `autovcoder_124239`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `x0_real` | in | 16 |  |
| `x0_imag` | in | 16 |  |
| `x1_real` | in | 16 |  |
| `x1_imag` | in | 16 |  |
| `x2_real` | in | 16 |  |
| `x2_imag` | in | 16 |  |
| `x3_real` | in | 16 |  |
| `x3_imag` | in | 16 |  |
| `start` | in | 1 |  |
| `y0_real` | out | 16 | |
| `y0_imag` | out | 16 | |
| `y1_real` | out | 16 | |
| `y1_imag` | out | 16 | |
| `y2_real` | out | 16 | |
| `y2_imag` | out | 16 | |
| `y3_real` | out | 16 | |
| `y3_imag` | out | 16 | |
| `done` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_124239.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
