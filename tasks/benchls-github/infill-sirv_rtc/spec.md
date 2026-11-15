# Fill in the masked region of `sirv_rtc`

The file `sirv_rtc.v` holds a Verilog design whose top module is `sirv_rtc` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `sirv_rtc`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-4.e200_opensource.

## Rules

- Edit only `sirv_rtc.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `sirv_rtc` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `sirv_rtc.v`. Only these files are graded.

## Interface of `sirv_rtc`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `io_regs_cfg_write_valid` | in | 1 |  |
| `io_regs_cfg_write_bits` | in | 32 |  |
| `io_regs_countLo_write_valid` | in | 1 |  |
| `io_regs_countLo_write_bits` | in | 32 |  |
| `io_regs_countHi_write_valid` | in | 1 |  |
| `io_regs_countHi_write_bits` | in | 32 |  |
| `io_regs_s_write_valid` | in | 1 |  |
| `io_regs_s_write_bits` | in | 32 |  |
| `io_regs_cmp_0_write_valid` | in | 1 |  |
| `io_regs_cmp_0_write_bits` | in | 32 |  |
| `io_regs_feed_write_valid` | in | 1 |  |
| `io_regs_feed_write_bits` | in | 32 |  |
| `io_regs_key_write_valid` | in | 1 |  |
| `io_regs_key_write_bits` | in | 32 |  |
| `io_regs_cfg_read` | out | 32 | |
| `io_regs_countLo_read` | out | 32 | |
| `io_regs_countHi_read` | out | 32 | |
| `io_regs_s_read` | out | 32 | |
| `io_regs_cmp_0_read` | out | 32 | |
| `io_regs_feed_read` | out | 32 | |
| `io_regs_key_read` | out | 32 | |
| `io_ip_0` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v sirv_rtc.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
