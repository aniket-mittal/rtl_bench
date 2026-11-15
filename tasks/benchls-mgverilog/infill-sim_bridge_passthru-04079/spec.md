# Fill in the masked region of `mg_04079`

The file `mg_04079.v` holds a Verilog design whose top module is `mg_04079` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_04079`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_04079.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_04079` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_04079.v`. Only these files are graded.

## Interface of `mg_04079`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `i_sim_in_reset` | in | 1 |  |
| `i_sim_in_ready` | in | 1 |  |
| `i_sim_in_command` | in | 32 |  |
| `i_sim_in_address` | in | 32 |  |
| `i_sim_in_data` | in | 32 |  |
| `i_sim_in_data_count` | in | 32 |  |
| `i_sim_out_ready` | in | 1 |  |
| `i_master_ready` | in | 1 |  |
| `i_oh_en` | in | 1 |  |
| `i_out_status` | in | 32 |  |
| `i_out_address` | in | 32 |  |
| `i_out_data` | in | 32 |  |
| `i_out_data_count` | in | 28 |  |
| `o_sim_master_ready` | out | 1 | |
| `o_sim_out_en` | out | 1 | |
| `o_sim_out_status` | out | 32 | |
| `o_sim_out_address` | out | 32 | |
| `o_sim_out_data` | out | 32 | |
| `o_sim_out_data_count` | out | 28 | |
| `o_ih_reset` | out | 1 | |
| `o_ih_ready` | out | 1 | |
| `o_in_command` | out | 32 | |
| `o_in_address` | out | 32 | |
| `o_in_data` | out | 32 | |
| `o_in_data_count` | out | 28 | |
| `o_oh_ready` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_04079.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
