# Fill in the masked region of `rtlpp_02735`

The file `rtlpp_02735.v` holds a Verilog design whose top module is `rtlpp_02735` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02735`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02735.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02735` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02735.v`. Only these files are graded.

## Interface of `rtlpp_02735`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `enable_CPU` | in | 1 |  |
| `flush` | in | 1 |  |
| `rs_inw` | in | 32 |  |
| `rt_inw` | in | 32 |  |
| `imm_inw` | in | 32 |  |
| `write_back_data` | in | 32 |  |
| `alu_result_back` | in | 32 |  |
| `alu_op_inw` | in | 6 |  |
| `rs_forward_inw` | in | 2 |  |
| `rt_forward_inw` | in | 2 |  |
| `alu_src_inw` | in | 1 |  |
| `memory_write_inw` | in | 1 |  |
| `memory_to_reg_inw` | in | 1 |  |
| `reg_write_inw` | in | 1 |  |
| `branch_isc_flag_inw` | in | 1 |  |
| `pc_next_inw` | in | 16 |  |
| `write_reg_addr_in_inw` | in | 5 |  |
| `rd_value` | out | 32 | |
| `write_data` | out | 32 | |
| `branch_jump_flag` | out | 1 | |
| `branch_PC` | out | 1 | |
| `branch_addr` | out | 16 | |
| `write_reg_addr_out` | out | 5 | |
| `memory_write` | out | 1 | |
| `memory_to_reg` | out | 1 | |
| `reg_write` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02735.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
