# Fix GitHub issue #2099 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `439513ba68b5`), trimmed to the files needed to elaborate the module `ibex_id_stage`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [dv] Improve instruction trace around faulting instructions

**Description:**

When an executed instruction generates a fault we suppress its destination register write. On the RVFI interface this mean setting the write register index to 0. On the instruction trace this results in seeing `x0` as the destination register, rather than the actual destination register. This can be confusing. We should improve our trace output to include the actual destination register in the printed instruction along with a note the write is suppressed due to a trap.

See https://github.com/lowRISC/opentitan/issues/13134 for an example of this issue.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_id_stage`.

- Do not change the ports of `ibex_id_stage` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_id_stage.v` | `rtl/ibex_id_stage.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/ibex_controller.v` | `rtl/ibex_controller.sv` |
| `src/ibex_decoder.v` | `rtl/ibex_decoder.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_id_stage` are the same as upstream.

## Grading

Your `ibex_id_stage` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_id_stage.v`. Only these files are graded.
Read-only (restored before grading): `src/ibex_controller.v`, `src/ibex_decoder.v`.

## Interface of `ibex_id_stage`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `fetch_enable_i` | in | 1 |  |
| `instr_valid_i` | in | 1 |  |
| `instr_rdata_i` | in | 32 |  |
| `instr_rdata_alu_i` | in | 32 |  |
| `instr_rdata_c_i` | in | 16 |  |
| `instr_is_compressed_i` | in | 1 |  |
| `branch_decision_i` | in | 1 |  |
| `illegal_c_insn_i` | in | 1 |  |
| `instr_fetch_err_i` | in | 1 |  |
| `instr_fetch_err_plus2_i` | in | 1 |  |
| `pc_id_i` | in | 32 |  |
| `ex_valid_i` | in | 1 |  |
| `lsu_valid_i` | in | 1 |  |
| `lsu_load_i` | in | 1 |  |
| `lsu_busy_i` | in | 1 |  |
| `imd_val_we_ex_i` | in | 1 |  |
| `imd_val_d_ex_i` | in | 34 |  |
| `priv_mode_i` | in | 2 |  |
| `csr_mstatus_tw_i` | in | 1 |  |
| `illegal_csr_insn_i` | in | 1 |  |
| `data_ind_timing_i` | in | 1 |  |
| `lsu_req_done_i` | in | 1 |  |
| `lsu_addr_incr_req_i` | in | 1 |  |
| `lsu_addr_last_i` | in | 32 |  |
| `csr_mstatus_mie_i` | in | 1 |  |
| `irq_pending_i` | in | 1 |  |
| `irqs_i` | in | 18 |  |
| `irq_nm_i` | in | 1 |  |
| `lsu_load_err_i` | in | 1 |  |
| `lsu_store_err_i` | in | 1 |  |
| `debug_req_i` | in | 1 |  |
| `debug_single_step_i` | in | 1 |  |
| `debug_ebreakm_i` | in | 1 |  |
| `debug_ebreaku_i` | in | 1 |  |
| `trigger_match_i` | in | 1 |  |
| `result_ex_i` | in | 32 |  |
| `csr_rdata_i` | in | 32 |  |
| `rf_rdata_a_i` | in | 32 |  |
| `rf_rdata_b_i` | in | 32 |  |
| `rf_waddr_wb_i` | in | 5 |  |
| `rf_wdata_fwd_wb_i` | in | 32 |  |
| `rf_write_wb_i` | in | 1 |  |
| `ready_wb_i` | in | 1 |  |
| `outstanding_load_wb_i` | in | 1 |  |
| `outstanding_store_wb_i` | in | 1 |  |
| `ctrl_busy_o` | out | 1 | |
| `illegal_insn_o` | out | 1 | |
| `instr_req_o` | out | 1 | |
| `instr_first_cycle_id_o` | out | 1 | |
| `instr_valid_clear_o` | out | 1 | |
| `id_in_ready_o` | out | 1 | |
| `icache_inval_o` | out | 1 | |
| `pc_set_o` | out | 1 | |
| `pc_mux_o` | out | 3 | |
| `exc_pc_mux_o` | out | 2 | |
| `exc_cause_o` | out | 6 | |
| `alu_operator_ex_o` | out | 6 | |
| `alu_operand_a_ex_o` | out | 32 | |
| `alu_operand_b_ex_o` | out | 32 | |
| `imd_val_q_ex_o` | out | 34 | |
| `bt_a_operand_o` | out | 32 | |
| `bt_b_operand_o` | out | 32 | |
| `mult_en_ex_o` | out | 1 | |
| `div_en_ex_o` | out | 1 | |
| `multdiv_sel_ex_o` | out | 1 | |
| `multdiv_operator_ex_o` | out | 2 | |
| `multdiv_signed_mode_ex_o` | out | 2 | |
| `multdiv_operand_a_ex_o` | out | 32 | |
| `multdiv_operand_b_ex_o` | out | 32 | |
| `multdiv_ready_id_o` | out | 1 | |
| `csr_access_o` | out | 1 | |
| `csr_op_o` | out | 2 | |
| `csr_op_en_o` | out | 1 | |
| `csr_save_if_o` | out | 1 | |
| `csr_save_id_o` | out | 1 | |
| `csr_save_wb_o` | out | 1 | |
| `csr_restore_mret_id_o` | out | 1 | |
| `csr_restore_dret_id_o` | out | 1 | |
| `csr_save_cause_o` | out | 1 | |
| `csr_mtval_o` | out | 32 | |
| `lsu_req_o` | out | 1 | |
| `lsu_we_o` | out | 1 | |
| `lsu_type_o` | out | 2 | |
| `lsu_sign_ext_o` | out | 1 | |
| `lsu_wdata_o` | out | 32 | |
| `nmi_mode_o` | out | 1 | |
| `debug_mode_o` | out | 1 | |
| `debug_cause_o` | out | 3 | |
| `debug_csr_save_o` | out | 1 | |
| `rf_raddr_a_o` | out | 5 | |
| `rf_raddr_b_o` | out | 5 | |
| `rf_waddr_id_o` | out | 5 | |
| `rf_wdata_id_o` | out | 32 | |
| `rf_we_id_o` | out | 1 | |
| `en_wb_o` | out | 1 | |
| `instr_type_wb_o` | out | 2 | |
| `perf_jump_o` | out | 1 | |
| `perf_branch_o` | out | 1 | |
| `perf_tbranch_o` | out | 1 | |
| `perf_dside_wait_o` | out | 1 | |
| `perf_mul_wait_o` | out | 1 | |
| `perf_div_wait_o` | out | 1 | |
| `instr_id_done_o` | out | 1 | |
| `instr_id_done_compressed_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_id_stage.v src/ibex_controller.v src/ibex_decoder.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
