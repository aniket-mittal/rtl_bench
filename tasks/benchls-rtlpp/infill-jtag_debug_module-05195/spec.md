# Fill in the masked region of `rtlpp_05195`

The file `rtlpp_05195.v` holds a Verilog design whose top module is `rtlpp_05195` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_05195`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_05195.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_05195` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_05195.v`. Only these files are graded.

## Interface of `rtlpp_05195`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `MonDReg` | in | 32 |  |
| `break_readreg` | in | 32 |  |
| `dbrk_hit0_latch` | in | 1 |  |
| `dbrk_hit1_latch` | in | 1 |  |
| `dbrk_hit2_latch` | in | 1 |  |
| `dbrk_hit3_latch` | in | 1 |  |
| `debugack` | in | 1 |  |
| `monitor_error` | in | 1 |  |
| `monitor_ready` | in | 1 |  |
| `reset_n` | in | 1 | reset, active low |
| `resetlatch` | in | 1 |  |
| `tracemem_on` | in | 1 |  |
| `tracemem_trcdata` | in | 36 |  |
| `tracemem_tw` | in | 1 |  |
| `trc_im_addr` | in | 7 |  |
| `trc_on` | in | 1 |  |
| `trc_wrap` | in | 1 |  |
| `trigbrktype` | in | 1 |  |
| `trigger_state_1` | in | 1 |  |
| `jdo` | out | 38 | |
| `jrst_n` | out | 1 | |
| `st_ready_test_idle` | out | 1 | |
| `take_action_break_a` | out | 1 | |
| `take_action_break_b` | out | 1 | |
| `take_action_break_c` | out | 1 | |
| `take_action_ocimem_a` | out | 1 | |
| `take_action_ocimem_b` | out | 1 | |
| `take_action_tracectrl` | out | 1 | |
| `take_no_action_break_a` | out | 1 | |
| `take_no_action_break_b` | out | 1 | |
| `take_no_action_break_c` | out | 1 | |
| `take_no_action_ocimem_a` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_05195.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
