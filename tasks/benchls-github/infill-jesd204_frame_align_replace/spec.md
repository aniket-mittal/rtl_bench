# Fill in the masked region of `jesd204_frame_align_replace`

The file `jesd204_frame_align_replace.v` holds a Verilog design whose top module is `jesd204_frame_align_replace` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `jesd204_frame_align_replace`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-10.analog-hdl.

## Rules

- Edit only `jesd204_frame_align_replace.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `jesd204_frame_align_replace` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `jesd204_frame_align_replace.v`. Only these files are graded.

## Interface of `jesd204_frame_align_replace`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `cfg_octets_per_frame` | in | 8 |  |
| `cfg_disable_char_replacement` | in | 1 |  |
| `cfg_disable_scrambler` | in | 1 |  |
| `data` | in | 32 |  |
| `eof` | in | 4 |  |
| `rx_char_is_a` | in | 4 |  |
| `rx_char_is_f` | in | 4 |  |
| `tx_eomf` | in | 4 |  |
| `data_out` | out | 32 | |
| `charisk_out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v jesd204_frame_align_replace.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
