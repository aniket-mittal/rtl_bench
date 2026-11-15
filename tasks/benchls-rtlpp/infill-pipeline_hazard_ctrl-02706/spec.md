# Fill in the masked region of `rtlpp_02706`

The file `rtlpp_02706.v` holds a Verilog design whose top module is `rtlpp_02706` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02706`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02706.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02706` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02706.v`. Only these files are graded.

## Interface of `rtlpp_02706`

| port | dir | width | note |
|---|---|---|---|
| `br_taken` | in | 1 |  |
| `src_reg_used` | in | 2 |  |
| `is_eret` | in | 1 |  |
| `id_en` | in | 1 |  |
| `id_rd_addr` | in | 5 |  |
| `id_gpr_we_` | in | 1 |  |
| `id_mem_op` | in | 5 |  |
| `op` | in | 7 |  |
| `rs1_addr` | in | 5 |  |
| `rs2_addr` | in | 5 |  |
| `id_rs1_addr` | in | 5 |  |
| `id_rs2_addr` | in | 5 |  |
| `ex_en` | in | 1 |  |
| `ex_rd_addr` | in | 5 |  |
| `ex_gpr_we_` | in | 1 |  |
| `ex_mem_op` | in | 5 |  |
| `mem_pc` | in | 32 |  |
| `mem_en` | in | 1 |  |
| `mem_exp_code` | in | 4 |  |
| `mepc_i` | in | 32 |  |
| `ic_busy` | in | 1 |  |
| `dc_busy` | in | 1 |  |
| `issue_id` | in | 2 |  |
| `if_hart_id` | in | 2 |  |
| `id_hart_id` | in | 2 |  |
| `ex_hart_id` | in | 2 |  |
| `hart_ic_stall` | in | 1 |  |
| `hart_dc_stall` | in | 1 |  |
| `hart_ic_flush` | in | 1 |  |
| `hart_dc_flush` | in | 1 |  |
| `if_pc` | in | 32 |  |
| `ex_pc` | in | 32 |  |
| `mepc_o` | out | 32 | |
| `exp_code` | out | 4 | |
| `save_exp` | out | 1 | |
| `restore_exp` | out | 1 | |
| `if_stall` | out | 1 | |
| `id_stall` | out | 1 | |
| `ex_stall` | out | 1 | |
| `mem_stall` | out | 1 | |
| `if_flush` | out | 1 | |
| `id_flush` | out | 1 | |
| `ex_flush` | out | 1 | |
| `mem_flush` | out | 1 | |
| `new_pc` | out | 32 | |
| `rs1_fwd_ctrl` | out | 2 | |
| `rs2_fwd_ctrl` | out | 2 | |
| `ex_rs1_fwd_en` | out | 1 | |
| `ex_rs2_fwd_en` | out | 1 | |
| `cache_miss` | out | 1 | |
| `cm_hart_id` | out | 2 | |
| `cm_addr` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02706.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
