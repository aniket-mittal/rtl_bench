# Fill in the masked region of `rtlpp_08895`

The file `rtlpp_08895.v` holds a Verilog design whose top module is `rtlpp_08895` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_08895` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_08895.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_08895` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_08895.v`. Only these files are graded.

## Interface of `rtlpp_08895`

| port | dir | width | note |
|---|---|---|---|
| `Clk` | in | 1 | clock, rising edge |
| `Reset` | in | 1 | reset, active high |
| `IO_read_data` | in | 32 |  |
| `IO_ready` | in | 1 |  |
| `TRACE_data_access` | out | 1 | |
| `TRACE_data_address` | out | 32 | |
| `TRACE_data_byte_enable` | out | 4 | |
| `TRACE_data_read` | out | 1 | |
| `TRACE_data_write` | out | 1 | |
| `TRACE_data_write_value` | out | 32 | |
| `TRACE_dcache_hit` | out | 1 | |
| `TRACE_dcache_rdy` | out | 1 | |
| `TRACE_dcache_read` | out | 1 | |
| `TRACE_dcache_req` | out | 1 | |
| `TRACE_delay_slot` | out | 1 | |
| `TRACE_ex_piperun` | out | 1 | |
| `TRACE_exception_kind` | out | 5 | |
| `TRACE_exception_taken` | out | 1 | |
| `TRACE_icache_hit` | out | 1 | |
| `TRACE_icache_rdy` | out | 1 | |
| `TRACE_icache_req` | out | 1 | |
| `TRACE_instruction` | out | 32 | |
| `TRACE_jump_hit` | out | 1 | |
| `TRACE_jump_taken` | out | 1 | |
| `TRACE_mb_halted` | out | 1 | |
| `TRACE_mem_piperun` | out | 1 | |
| `TRACE_msr_reg` | out | 15 | |
| `TRACE_new_reg_value` | out | 32 | |
| `TRACE_of_piperun` | out | 1 | |
| `TRACE_pc` | out | 32 | |
| `TRACE_pid_reg` | out | 8 | |
| `TRACE_reg_addr` | out | 5 | |
| `TRACE_reg_write` | out | 1 | |
| `TRACE_valid_instr` | out | 1 | |
| `IO_addr_strobe` | out | 1 | |
| `IO_address` | out | 32 | |
| `IO_byte_enable` | out | 4 | |
| `IO_read_strobe` | out | 1 | |
| `IO_write_data` | out | 32 | |
| `IO_write_strobe` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_08895.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
