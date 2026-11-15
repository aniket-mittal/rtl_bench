# Fill in the masked region of `mg_02698`

The file `mg_02698.v` holds a Verilog design whose top module is `mg_02698` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_02698`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_02698.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_02698` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_02698.v`. Only these files are graded.

## Interface of `mg_02698`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `io_out_ready` | in | 1 |  |
| `io_in_0_valid` | in | 1 |  |
| `io_in_0_bits_centeroidsFinished` | in | 1 |  |
| `io_in_0_bits_pointsFinished` | in | 1 |  |
| `io_in_0_bits_centeroidIndex` | in | 16 |  |
| `io_in_0_bits_point_x` | in | 64 |  |
| `io_in_0_bits_point_y` | in | 64 |  |
| `io_in_0_bits_point_z` | in | 64 |  |
| `io_in_0_tag` | in | 5 |  |
| `io_out_valid` | out | 1 | |
| `io_out_bits_centeroidsFinished` | out | 1 | |
| `io_out_bits_pointsFinished` | out | 1 | |
| `io_out_bits_centeroidIndex` | out | 16 | |
| `io_out_bits_point_x` | out | 64 | |
| `io_out_bits_point_y` | out | 64 | |
| `io_out_bits_point_z` | out | 64 | |
| `io_out_tag` | out | 5 | |
| `io_in_0_ready` | out | 1 | |
| `io_chosen` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_02698.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
