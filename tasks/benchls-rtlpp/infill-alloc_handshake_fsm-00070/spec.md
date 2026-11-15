# Fill in the masked region of `rtlpp_00070`

The file `rtlpp_00070.v` holds a Verilog design whose top module is `rtlpp_00070` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_00070`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_00070.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_00070` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_00070.v`. Only these files are graded.

## Interface of `rtlpp_00070`

| port | dir | width | note |
|---|---|---|---|
| `ap_clk` | in | 1 | clock, rising edge |
| `alloc_size_ap_vld` | in | 1 |  |
| `alloc_addr_ap_ack` | in | 1 |  |
| `alloc_free_target_ap_vld` | in | 1 |  |
| `alloc_cmd_ap_vld` | in | 1 |  |
| `ap_rst` | in | 1 | reset, active high |
| `ap_start` | in | 1 |  |
| `alloc_size` | in | 32 |  |
| `alloc_free_target` | in | 32 |  |
| `alloc_cmd` | in | 8 |  |
| `alloc_size_ap_ack` | out | 1 | |
| `alloc_addr_ap_vld` | out | 1 | |
| `alloc_free_target_ap_ack` | out | 1 | |
| `alloc_cmd_ap_ack` | out | 1 | |
| `ap_done` | out | 1 | |
| `ap_idle` | out | 1 | |
| `ap_ready` | out | 1 | |
| `alloc_addr` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_00070.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
