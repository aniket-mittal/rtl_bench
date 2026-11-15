# Fill in the masked region of `rtlpp_08418`

The file `rtlpp_08418.v` holds a Verilog design whose top module is `rtlpp_08418` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_08418`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_08418.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_08418` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_08418.v`. Only these files are graded.

## Interface of `rtlpp_08418`

| port | dir | width | note |
|---|---|---|---|
| `CLK` | in | 1 | clock, rising edge |
| `RST_N` | in | 1 | reset, active low |
| `write_0` | in | 1 |  |
| `EN_write_0` | in | 1 |  |
| `write_1` | in | 1 |  |
| `EN_write_1` | in | 1 |  |
| `write_2` | in | 1 |  |
| `EN_write_2` | in | 1 |  |
| `write_3` | in | 1 |  |
| `EN_write_3` | in | 1 |  |
| `write_4` | in | 1 |  |
| `EN_write_4` | in | 1 |  |
| `write_5` | in | 1 |  |
| `EN_write_5` | in | 1 |  |
| `write_6` | in | 1 |  |
| `EN_write_6` | in | 1 |  |
| `write_7` | in | 1 |  |
| `EN_write_7` | in | 1 |  |
| `read_0` | out | 1 | |
| `read_1` | out | 1 | |
| `read_2` | out | 1 | |
| `read_3` | out | 1 | |
| `read_4` | out | 1 | |
| `read_5` | out | 1 | |
| `read_6` | out | 1 | |
| `read_7` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_08418.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
