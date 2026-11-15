# Fill in the masked region of `rtlpp_07229`

The file `rtlpp_07229.v` holds a Verilog design whose top module is `rtlpp_07229` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_07229`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_07229.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_07229` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_07229.v`. Only these files are graded.

## Interface of `rtlpp_07229`

| port | dir | width | note |
|---|---|---|---|
| `Clk` | in | 1 | clock, rising edge |
| `R` | in | 1 |  |
| `L` | in | 1 |  |
| `U` | in | 1 |  |
| `D` | in | 1 |  |
| `C` | in | 1 |  |
| `Reset` | in | 1 | reset, active high |
| `Ack` | in | 1 |  |
| `CheckSolu` | in | 1 |  |
| `userIn` | in | 5 |  |
| `disp_i` | in | 5 |  |
| `disp_j` | in | 5 |  |
| `q_I` | out | 1 | |
| `q_Solve` | out | 1 | |
| `q_Check` | out | 1 | |
| `q_Correct` | out | 1 | |
| `q_Incorrect` | out | 1 | |
| `i` | out | 5 | |
| `j` | out | 5 | |
| `row` | out | 4 | |
| `col` | out | 4 | |
| `puzzle_ij` | out | 5 | |
| `solu_ij` | out | 5 | |
| `disp_value` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_07229.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
