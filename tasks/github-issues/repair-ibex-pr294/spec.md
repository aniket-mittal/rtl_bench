# Fix GitHub issue #290 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `b87ed7c82e0d`), trimmed to the files needed to elaborate the module `ibex_controller`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Incorrect irq_fast ID assignment

**Description:**

According to the documentation, Ibex should assign all of the fast interrupts `irq_fast_i[14:0]` an ID from 16 to 30, so that `irq_fast_i[0]` has an ID of 16, `irq_fast_i[1]` has an ID of 17, and so on.  In the [Ibex CSR register file](https://github.com/lowRISC/ibex/blob/master/rtl/ibex_cs_registers.sv#L572), the entire 15 bit array is output to the [Ibex controller module](https://github.com/lowRISC/ibex/blob/master/rtl/ibex_controller.sv#L165), where `mfip_id` is assigned based on on the value of `irq_fast_i[14:0]`. However these assigned IDs are between 0 and 14. Later on in the controller, `exc_cause_o` is [assigned](https://github.com/lowRISC/ibex/blob/master/rtl/ibex_controller.sv#L363) by appending 1'b1 to `mfip_id`. This is sent to the [Ibex IF stage](https://github.com/lowRISC/ibex/blob/master/rtl/ibex_if_stage.sv#L109), where the 5 bit `irq_id`, which in this case is the ID assigned earlier in the controller, is multiplied by `0x4` and added to the address held in `mtvec` to get the trap address. However, the ID's of all fast interrupts are still from 0 to 14, which seems incorrect according to the RISC-V Privileged Spec Ch. 3.1.16. This means that there are now conflicts with all other interrupts that have ID's between 0 and 14, so Ibex will now jump to the wrong vectored address for all fast interrupts that are sent to the core. I think the `irq_fast` ID assignments in the CSR file should be from between 16 to 30 to fix this issue and comply with the spec.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_controller`.

- Do not change the ports of `ibex_controller` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_controller.v` | `rtl/ibex_controller.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_controller` are the same as upstream.

## Grading

Your `ibex_controller` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_controller.v`. Only these files are graded.

## Interface of `ibex_controller`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `fetch_enable_i` | in | 1 |  |
| `illegal_insn_i` | in | 1 |  |
| `ecall_insn_i` | in | 1 |  |
| `mret_insn_i` | in | 1 |  |
| `dret_insn_i` | in | 1 |  |
| `wfi_insn_i` | in | 1 |  |
| `ebrk_insn_i` | in | 1 |  |
| `csr_pipe_flush_i` | in | 1 |  |
| `instr_valid_i` | in | 1 |  |
| `instr_i` | in | 32 |  |
| `instr_compressed_i` | in | 16 |  |
| `instr_is_compressed_i` | in | 1 |  |
| `instr_fetch_err_i` | in | 1 |  |
| `pc_id_i` | in | 32 |  |
| `lsu_addr_last_i` | in | 32 |  |
| `load_err_i` | in | 1 |  |
| `store_err_i` | in | 1 |  |
| `branch_set_i` | in | 1 |  |
| `jump_set_i` | in | 1 |  |
| `csr_mstatus_mie_i` | in | 1 |  |
| `csr_msip_i` | in | 1 |  |
| `csr_mtip_i` | in | 1 |  |
| `csr_meip_i` | in | 1 |  |
| `csr_mfip_i` | in | 15 |  |
| `irq_pending_i` | in | 1 |  |
| `irq_nm_i` | in | 1 |  |
| `debug_req_i` | in | 1 |  |
| `debug_single_step_i` | in | 1 |  |
| `debug_ebreakm_i` | in | 1 |  |
| `stall_lsu_i` | in | 1 |  |
| `stall_multdiv_i` | in | 1 |  |
| `stall_jump_i` | in | 1 |  |
| `stall_branch_i` | in | 1 |  |
| `ctrl_busy_o` | out | 1 | |
| `first_fetch_o` | out | 1 | |
| `instr_valid_clear_o` | out | 1 | |
| `id_in_ready_o` | out | 1 | |
| `instr_req_o` | out | 1 | |
| `pc_set_o` | out | 1 | |
| `pc_mux_o` | out | 3 | |
| `exc_pc_mux_o` | out | 2 | |
| `exc_cause_o` | out | 6 | |
| `debug_cause_o` | out | 3 | |
| `debug_csr_save_o` | out | 1 | |
| `debug_mode_o` | out | 1 | |
| `csr_save_if_o` | out | 1 | |
| `csr_save_id_o` | out | 1 | |
| `csr_restore_mret_id_o` | out | 1 | |
| `csr_save_cause_o` | out | 1 | |
| `csr_mtval_o` | out | 32 | |
| `perf_jump_o` | out | 1 | |
| `perf_tbranch_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_controller.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
