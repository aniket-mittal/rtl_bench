# Fill in the masked region of `xcvr_ctrl`

The file `xcvr_ctrl.v` holds a Verilog design whose top module is `xcvr_ctrl` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `xcvr_ctrl`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-2.verilog-ethernet.

## Rules

- Edit only `xcvr_ctrl.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `xcvr_ctrl` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `xcvr_ctrl.v`. Only these files are graded.

## Interface of `xcvr_ctrl`

| port | dir | width | note |
|---|---|---|---|
| `reconfig_clk` | in | 1 | clock, rising edge |
| `reconfig_rst` | in | 1 | reset, active high |
| `pll_locked_in` | in | 1 |  |
| `xcvr_reconfig_readdata` | in | 8 |  |
| `xcvr_reconfig_waitrequest` | in | 1 |  |
| `xcvr_reconfig_address` | out | 19 | |
| `xcvr_reconfig_read` | out | 1 | |
| `xcvr_reconfig_write` | out | 1 | |
| `xcvr_reconfig_writedata` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v xcvr_ctrl.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
