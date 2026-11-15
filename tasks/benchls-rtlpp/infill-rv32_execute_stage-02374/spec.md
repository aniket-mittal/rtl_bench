# Fill in the masked region of `rtlpp_02374`

The file `rtlpp_02374.v` holds a Verilog design whose top module is `rtlpp_02374` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02374`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02374.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02374` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02374.v`. Only these files are graded.

## Interface of `rtlpp_02374`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset_n` | in | 1 | reset, active low |
| `stall` | in | 1 |  |
| `a_decode` | in | 32 |  |
| `b_decode` | in | 32 |  |
| `offset_decode` | in | 32 |  |
| `a_rs_idx` | in | 5 |  |
| `b_rs_idx` | in | 5 |  |
| `regfile_rd_idx` | in | 5 |  |
| `regfile_rd_val` | in | 32 |  |
| `pc_in` | in | 32 |  |
| `rd_in` | in | 5 |  |
| `branch_in` | in | 1 |  |
| `jump_in` | in | 1 |  |
| `system_in` | in | 1 |  |
| `load_in` | in | 1 |  |
| `store_in` | in | 1 |  |
| `ld_store_width` | in | 3 |  |
| `cancelled` | in | 1 |  |
| `add_nsub` | in | 1 |  |
| `arith` | in | 1 |  |
| `cmp_unsigned` | in | 1 |  |
| `cmp_is_lt` | in | 1 |  |
| `cmp_is_ge` | in | 1 |  |
| `cmp_is_eq` | in | 1 |  |
| `cmp_is_ne` | in | 1 |  |
| `bit_is_and` | in | 1 |  |
| `bit_is_or` | in | 1 |  |
| `bit_is_xor` | in | 1 |  |
| `shift_arith` | in | 1 |  |
| `shift_left` | in | 1 |  |
| `shift_right` | in | 1 |  |
| `extm_update_rd` | in | 1 |  |
| `extm_rd_idx` | in | 5 |  |
| `extm_rd_val` | in | 32 |  |
| `clr_load_op` | in | 1 |  |
| `ld_data` | in | 32 |  |
| `rd` | out | 5 | |
| `update_pc` | out | 1 | |
| `load` | out | 1 | |
| `store` | out | 1 | |
| `pc` | out | 32 | |
| `c` | out | 32 | |
| `addr` | out | 32 | |
| `st_be` | out | 4 | |
| `retired_instr` | out | 1 | |
| `misaligned_load` | out | 1 | |
| `misaligned_store` | out | 1 | |
| `misaligned_addr` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02374.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
