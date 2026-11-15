# Fill in the masked region of `rtlpp_02533`

The file `rtlpp_02533.v` holds a Verilog design whose top module is `rtlpp_02533` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02533`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02533.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02533` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02533.v`. Only these files are graded.

## Interface of `rtlpp_02533`

| port | dir | width | note |
|---|---|---|---|
| `sys_clk` | in | 1 | clock, rising edge |
| `sys_rst_n` | in | 1 | reset, active low |
| `accu_en` | in | 1 |  |
| `s_axis_aresetn` | in | 1 |  |
| `s_axis_aclk` | in | 1 |  |
| `s_axis_tvalid` | in | 1 |  |
| `s_axis_tdata` | in | 64 |  |
| `s_axis_tkeep` | in | 8 |  |
| `s_axis_tlast` | in | 1 |  |
| `m_axis_aresetn` | in | 1 |  |
| `m_axis_aclk` | in | 1 |  |
| `m_axis_tready` | in | 1 |  |
| `accu_finished` | out | 1 | |
| `s_axis_tready` | out | 1 | |
| `m_axis_tvalid` | out | 1 | |
| `m_axis_tdata` | out | 64 | |
| `m_axis_tkeep` | out | 8 | |
| `m_axis_tlast` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02533.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
