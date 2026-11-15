# Fill in the masked region of `filtersIP_0`

The file `filtersIP_0.v` holds a Verilog design whose top module is `filtersIP_0` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `filtersIP_0` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `filtersIP_0.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `filtersIP_0` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `filtersIP_0.v`. Only these files are graded.

## Interface of `filtersIP_0`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `filt_select` | in | 2 |  |
| `rstn` | in | 1 | reset, active low |
| `start` | in | 1 |  |
| `val` | in | 16 |  |
| `done` | out | 1 | |
| `result` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v filtersIP_0.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
