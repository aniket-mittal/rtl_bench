# Fill in the masked region of `rtlpp_06308`

The file `rtlpp_06308.v` holds a Verilog design whose top module is `rtlpp_06308` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_06308`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_06308.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_06308` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_06308.v`. Only these files are graded.

## Interface of `rtlpp_06308`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `sw_reset` | in | 1 |  |
| `sw_stop` | in | 1 |  |
| `length` | in | 32 |  |
| `eop_enabled` | in | 1 |  |
| `eop` | in | 1 |  |
| `ready` | in | 1 |  |
| `valid` | in | 1 |  |
| `early_termination` | in | 1 |  |
| `address_in` | in | 32 |  |
| `write_in` | in | 1 |  |
| `max_burst_count` | in | 3 |  |
| `write_fifo_used` | in | 6 |  |
| `waitrequest` | in | 1 |  |
| `short_first_access_enable` | in | 1 |  |
| `short_last_access_enable` | in | 1 |  |
| `short_first_and_last_access_enable` | in | 1 |  |
| `last_access` | in | 1 |  |
| `address_out` | out | 32 | |
| `write_out` | out | 1 | |
| `burst_count` | out | 3 | |
| `stall` | out | 1 | |
| `reset_taken` | out | 1 | |
| `stopped` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_06308.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
