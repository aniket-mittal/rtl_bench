# Fill in the masked region of `timer_cntrl`

The file `timer_cntrl.v` holds a Verilog design whose top module is `timer_cntrl` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `timer_cntrl`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-29.e203_hbirdv2.

## Rules

- Edit only `timer_cntrl.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `timer_cntrl` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `timer_cntrl.v`. Only these files are graded.

## Interface of `timer_cntrl`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rstn_i` | in | 1 | reset, active high |
| `cfg_start_i` | in | 1 |  |
| `cfg_stop_i` | in | 1 |  |
| `cfg_rst_i` | in | 1 |  |
| `cfg_update_i` | in | 1 |  |
| `cfg_arm_i` | in | 1 |  |
| `cnt_update_i` | in | 1 |  |
| `ctrl_cnt_upd_o` | out | 1 | |
| `ctrl_all_upd_o` | out | 1 | |
| `ctrl_active_o` | out | 1 | |
| `ctrl_rst_o` | out | 1 | |
| `ctrl_arm_o` | out | 1 | |
| `status_o` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v timer_cntrl.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
