# Fill in the masked region of `origen_056421`

The file `origen_056421.v` holds a Verilog design whose top module is `origen_056421` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_056421`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_056421.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_056421` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_056421.v`. Only these files are graded.

## Interface of `origen_056421`

| port | dir | width | note |
|---|---|---|---|
| `clk160M` | in | 1 | clock, rising edge |
| `rst0` | in | 1 | reset, active high |
| `hsync` | in | 1 |  |
| `vsync` | in | 1 |  |
| `cnt_r` | in | 10 |  |
| `p_sum0` | in | 32 |  |
| `p_sum1` | in | 32 |  |
| `x_sum0` | in | 32 |  |
| `x_sum1` | in | 32 |  |
| `y_sum0` | in | 32 |  |
| `y_sum1` | in | 32 |  |
| `xmin0` | in | 11 |  |
| `xmin1` | in | 11 |  |
| `ymin0` | in | 11 |  |
| `ymin1` | in | 11 |  |
| `xmax0` | in | 11 |  |
| `xmax1` | in | 11 |  |
| `ymax0` | in | 11 |  |
| `ymax1` | in | 11 |  |
| `en0` | in | 1 |  |
| `en1` | in | 1 |  |
| `done0` | in | 1 |  |
| `done1` | in | 1 |  |
| `ap_start0` | out | 1 | |
| `ap_start1` | out | 1 | |
| `ap_rst_n0` | out | 1 | |
| `ap_rst_n1` | out | 1 | |
| `p_sum` | out | 32 | |
| `x_sum` | out | 32 | |
| `y_sum` | out | 32 | |
| `xmin` | out | 11 | |
| `ymin` | out | 11 | |
| `xmax` | out | 11 | |
| `ymax` | out | 11 | |
| `en` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_056421.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
