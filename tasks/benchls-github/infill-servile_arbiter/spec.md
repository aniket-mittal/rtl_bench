# Fill in the masked region of `servile_arbiter`

The file `servile_arbiter.v` holds a Verilog design whose top module is `servile_arbiter` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `servile_arbiter`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: SEC-Flow-Star-repos-7.serv.

## Rules

- Edit only `servile_arbiter.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `servile_arbiter` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `servile_arbiter.v`. Only these files are graded.

## Interface of `servile_arbiter`

| port | dir | width | note |
|---|---|---|---|
| `i_wb_cpu_dbus_adr` | in | 32 |  |
| `i_wb_cpu_dbus_dat` | in | 32 |  |
| `i_wb_cpu_dbus_sel` | in | 4 |  |
| `i_wb_cpu_dbus_we` | in | 1 |  |
| `i_wb_cpu_dbus_stb` | in | 1 |  |
| `i_wb_cpu_ibus_adr` | in | 32 |  |
| `i_wb_cpu_ibus_stb` | in | 1 |  |
| `i_wb_mem_rdt` | in | 32 |  |
| `i_wb_mem_ack` | in | 1 |  |
| `o_wb_cpu_dbus_rdt` | out | 32 | |
| `o_wb_cpu_dbus_ack` | out | 1 | |
| `o_wb_cpu_ibus_rdt` | out | 32 | |
| `o_wb_cpu_ibus_ack` | out | 1 | |
| `o_wb_mem_adr` | out | 32 | |
| `o_wb_mem_dat` | out | 32 | |
| `o_wb_mem_sel` | out | 4 | |
| `o_wb_mem_we` | out | 1 | |
| `o_wb_mem_stb` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v servile_arbiter.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
