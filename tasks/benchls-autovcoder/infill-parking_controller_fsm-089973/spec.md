# Fill in the masked region of `autovcoder_089973`

The file `autovcoder_089973.v` holds a Verilog design whose top module is `autovcoder_089973` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_089973`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_089973.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_089973` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_089973.v`. Only these files are graded.

## Interface of `autovcoder_089973`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `gl_reset` | in | 1 |  |
| `city_done` | in | 1 |  |
| `parkpick_confirm` | in | 1 |  |
| `parkpick` | in | 1 |  |
| `spot_entered` | in | 1 |  |
| `leave` | in | 1 |  |
| `size_entered` | in | 1 |  |
| `fit` | in | 1 |  |
| `car_in_done` | in | 1 |  |
| `resetn` | in | 1 | reset, active low |
| `read_vehicle_size` | out | 1 | |
| `read_park_pick` | out | 1 | |
| `read_spot` | out | 1 | |
| `read_city` | out | 1 | |
| `current_state_out` | out | 4 | |
| `go` | out | 1 | |
| `reverse` | out | 1 | |
| `change_background` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_089973.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
