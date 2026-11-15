# Fill in the masked region of `origen_209255`

The file `origen_209255.v` holds a Verilog design whose top module is `origen_209255` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_209255`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_209255.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_209255` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_209255.v`. Only these files are graded.

## Interface of `origen_209255`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_i` | in | 1 | reset, active high |
| `halt_i` | in | 1 |  |
| `WB_i` | in | 2 |  |
| `M_i` | in | 2 |  |
| `EX_i` | in | 4 |  |
| `data1_i` | in | 32 |  |
| `data2_i` | in | 32 |  |
| `signextend_i` | in | 32 |  |
| `rs_i` | in | 5 |  |
| `rt_i` | in | 5 |  |
| `rd_i` | in | 5 |  |
| `WB_o` | out | 2 | |
| `M_o` | out | 2 | |
| `EX_o` | out | 4 | |
| `data1_o` | out | 32 | |
| `data2_o` | out | 32 | |
| `signextend_o` | out | 32 | |
| `rs_o` | out | 5 | |
| `rt_o` | out | 5 | |
| `rd_o` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_209255.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
