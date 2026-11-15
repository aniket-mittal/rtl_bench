# Fill in the masked region of `origen_136391`

The file `origen_136391.v` holds a Verilog design whose top module is `origen_136391` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_136391`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_136391.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_136391` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_136391.v`. Only these files are graded.

## Interface of `origen_136391`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `host_cmd` | in | 48 |  |
| `host_dat_in` | in | 32 |  |
| `host_cmd_en` | in | 1 |  |
| `host_dat_en` | in | 1 |  |
| `host_dat_dir` | in | 1 |  |
| `host_dat_ack` | in | 1 |  |
| `device_cmd` | in | 48 |  |
| `device_dat_in` | in | 32 |  |
| `device_cmd_en` | in | 1 |  |
| `device_dat_en` | in | 1 |  |
| `device_dat_dir` | in | 1 |  |
| `device_dat_ack` | in | 1 |  |
| `host_cmd_ack` | out | 1 | |
| `host_dat_rdy` | out | 1 | |
| `host_dat_out` | out | 32 | |
| `device_cmd_ack` | out | 1 | |
| `device_dat_rdy` | out | 1 | |
| `device_dat_out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_136391.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
