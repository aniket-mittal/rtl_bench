# Fill in the masked region of `ll_axis_bridge`

The file `ll_axis_bridge.v` holds a Verilog design whose top module is `ll_axis_bridge` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `ll_axis_bridge` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-2.verilog-ethernet.

## Rules

- Edit only `ll_axis_bridge.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `ll_axis_bridge` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `ll_axis_bridge.v`. Only these files are graded.

## Interface of `ll_axis_bridge`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `ll_data_in` | in | 8 |  |
| `ll_sof_in_n` | in | 1 |  |
| `ll_eof_in_n` | in | 1 |  |
| `ll_src_rdy_in_n` | in | 1 |  |
| `m_axis_tready` | in | 1 |  |
| `ll_dst_rdy_out_n` | out | 1 | |
| `m_axis_tdata` | out | 8 | |
| `m_axis_tvalid` | out | 1 | |
| `m_axis_tlast` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v ll_axis_bridge.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
