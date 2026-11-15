# Fill in the masked region of `si570_i2c_init`

The file `si570_i2c_init.v` holds a Verilog design whose top module is `si570_i2c_init` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `si570_i2c_init`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-2.verilog-ethernet.

## Rules

- Edit only `si570_i2c_init.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `si570_i2c_init` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `si570_i2c_init.v`. Only these files are graded.

## Interface of `si570_i2c_init`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `cmd_ready` | in | 1 |  |
| `data_out_ready` | in | 1 |  |
| `start` | in | 1 |  |
| `cmd_address` | out | 7 | |
| `cmd_start` | out | 1 | |
| `cmd_read` | out | 1 | |
| `cmd_write` | out | 1 | |
| `cmd_write_multiple` | out | 1 | |
| `cmd_stop` | out | 1 | |
| `cmd_valid` | out | 1 | |
| `data_out` | out | 8 | |
| `data_out_valid` | out | 1 | |
| `data_out_last` | out | 1 | |
| `busy` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v si570_i2c_init.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
