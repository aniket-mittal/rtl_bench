# Fill in the masked region of `rtlpp_01351`

The file `rtlpp_01351.v` holds a Verilog design whose top module is `rtlpp_01351` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_01351`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01351.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01351` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01351.v`. Only these files are graded.

## Interface of `rtlpp_01351`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `router_wrap_reset` | in | 1 |  |
| `router_wrap_router_address` | in | 4 |  |
| `router_wrap_channel_in_ip_0` | in | 70 |  |
| `router_wrap_channel_in_ip_1` | in | 70 |  |
| `router_wrap_channel_in_ip_2` | in | 70 |  |
| `router_wrap_channel_in_ip_3` | in | 70 |  |
| `router_wrap_channel_in_ip_4` | in | 70 |  |
| `router_wrap_flow_ctrl_in_op_0` | in | 3 |  |
| `router_wrap_flow_ctrl_in_op_1` | in | 3 |  |
| `router_wrap_flow_ctrl_in_op_2` | in | 3 |  |
| `router_wrap_flow_ctrl_in_op_3` | in | 3 |  |
| `router_wrap_flow_ctrl_in_op_4` | in | 3 |  |
| `router_wrap_clk` | in | 1 |  |
| `router_wrap_error` | out | 1 | |
| `router_wrap_channel_out_op_0` | out | 70 | |
| `router_wrap_channel_out_op_1` | out | 70 | |
| `router_wrap_channel_out_op_2` | out | 70 | |
| `router_wrap_channel_out_op_3` | out | 70 | |
| `router_wrap_channel_out_op_4` | out | 70 | |
| `router_wrap_flow_ctrl_out_ip_0` | out | 3 | |
| `router_wrap_flow_ctrl_out_ip_1` | out | 3 | |
| `router_wrap_flow_ctrl_out_ip_2` | out | 3 | |
| `router_wrap_flow_ctrl_out_ip_3` | out | 3 | |
| `router_wrap_flow_ctrl_out_ip_4` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01351.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
