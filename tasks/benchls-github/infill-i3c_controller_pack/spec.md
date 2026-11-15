# Fill in the masked region of `i3c_controller_pack`

The file `i3c_controller_pack.v` holds a Verilog design whose top module is `i3c_controller_pack` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `i3c_controller_pack`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-10.analog-hdl.

## Rules

- Edit only `i3c_controller_pack.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `i3c_controller_pack` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `i3c_controller_pack.v`. Only these files are graded.

## Interface of `i3c_controller_pack`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset_n` | in | 1 | reset, active low |
| `u32_ready` | in | 1 |  |
| `u8_valid` | in | 1 |  |
| `u8_last` | in | 1 |  |
| `u8` | in | 8 |  |
| `u32_valid` | out | 1 | |
| `u32` | out | 32 | |
| `u8_lvl` | out | 12 | |
| `u8_ready` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v i3c_controller_pack.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
