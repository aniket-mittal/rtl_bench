# Fill in the masked region of `origen_174007`

The file `origen_174007.v` holds a Verilog design whose top module is `origen_174007` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_174007`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_174007.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_174007` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_174007.v`. Only these files are graded.

## Interface of `origen_174007`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `reset_game_control` | in | 1 | reset, active high |
| `play_game` | in | 1 |  |
| `all_bricks_down` | in | 1 |  |
| `ball_down` | in | 1 |  |
| `play_again` | in | 1 |  |
| `startup_done` | in | 1 |  |
| `over_done` | in | 1 |  |
| `reset_startup_counter` | out | 1 | |
| `enable_startup_counter` | out | 1 | |
| `reset_over_counter` | out | 1 | |
| `enable_over_counter` | out | 1 | |
| `startup_plot` | out | 1 | |
| `over_plot` | out | 1 | |
| `reset_brick_count` | out | 1 | |
| `enable_brick_count` | out | 1 | |
| `run_game` | out | 1 | |
| `reset_control` | out | 1 | |
| `sel_screen` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_174007.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
