# Fill in the masked region of `origen_186560`

The file `origen_186560.v` holds a Verilog design whose top module is `origen_186560` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_186560`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_186560.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_186560` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_186560.v`. Only these files are graded.

## Interface of `origen_186560`

| port | dir | width | note |
|---|---|---|---|
| `clk25` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `hsync` | out | 1 | |
| `hsync_n` | out | 1 | |
| `vsync` | out | 1 | |
| `vsync_n` | out | 1 | |
| `x` | out | 11 | |
| `x_n` | out | 11 | |
| `y` | out | 11 | |
| `y_n` | out | 11 | |
| `sx` | out | 11 | |
| `sx_n` | out | 11 | |
| `sy` | out | 11 | |
| `sy_n` | out | 11 | |
| `sx_counter` | out | 10 | |
| `sx_counter_n` | out | 10 | |
| `sy_counter` | out | 10 | |
| `sy_counter_n` | out | 10 | |
| `bit_num` | out | 8 | |
| `bit_num_n` | out | 8 | |
| `byte_num` | out | 16 | |
| `byte_num_n` | out | 16 | |
| `next_byte_num` | out | 16 | |
| `next_byte_num_n` | out | 16 | |
| `next_y` | out | 11 | |
| `next_y_n` | out | 11 | |
| `next_sy` | out | 11 | |
| `next_sy_n` | out | 11 | |
| `blank` | out | 1 | |
| `blank_n` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_186560.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
