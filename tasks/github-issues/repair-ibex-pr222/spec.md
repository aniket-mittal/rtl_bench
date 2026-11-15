# Fix GitHub issue #216 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `e5bdf1ea9fd5`), trimmed to the files needed to elaborate the module `ibex_id_stage`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** instr_multicycle_done is not asserted, continuous register writes

**Description:**

While executing the code shown below:

We see this incorrect behavior in the core:

As shown, the `addi` instruction at PC `0x80000088` appears to correctly load register `x13` with the value `0xa5a5a5a5`, but at the very next instruction (PC: `0x8000008c`), we can see from the trace log that `x13` now has the value `0xa5a5de17`.

From the waveform, `rf_reg[13]` is written correctly by the `addi` after adding the immediate value `0x5a5` (`alu_operand_b_i`), and becomes `0xa5a5a5a5`. After this, the testbench does not assert the `instr_gnt_i` for a number of cycles, leading the core to stay in the DECODE phase while waiting for the next instruction fetch. However, we see that `rf_reg[13]` keeps getting written with the incremented values of `alu_result` in every consecutive cycle that the core waits, as `instr_multicycle_done_q` in the ID stage does not go high after the `addi` finishes. This keeps `regfile_we` at 1, causing the continuous writes.

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
| `src/ibex_register_file.v` | `rtl/ibex_register_file_ff.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_id_stage` are the same as upstream.

## Grading

Your `ibex_id_stage` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_id_stage.v`. Only these files are graded.
Read-only (restored before grading): `src/ibex_controller.v`, `src/ibex_decoder.v`, `src/ibex_register_file.v`.

## Interface of `ibex_id_stage`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `test_en_i` | in | 1 |  |
| `fetch_enable_i` | in | 1 |  |
| `instr_valid_i` | in | 1 |  |
| `instr_new_i` | in | 1 |  |
| `instr_rdata_i` | in | 32 |  |
| `instr_rdata_c_i` | in | 16 |  |
| `instr_is_compressed_i` | in | 1 |  |
| `branch_decision_i` | in | 1 |  |
| `illegal_c_insn_i` | in | 1 |  |
| `pc_id_i` | in | 32 |  |
| `ex_valid_i` | in | 1 |  |
| `lsu_valid_i` | in | 1 |  |
| `illegal_csr_insn_i` | in | 1 |  |
| `lsu_addr_incr_req_i` | in | 1 |  |
| `lsu_addr_last_i` | in | 32 |  |
| `csr_mstatus_mie_i` | in | 1 |  |
| `csr_msip_i` | in | 1 |  |
| `csr_mtip_i` | in | 1 |  |
| `csr_meip_i` | in | 1 |  |
| `csr_mfip_i` | in | 15 |  |
| `irq_pending_i` | in | 1 |  |
| `irq_nm_i` | in | 1 |  |
| `lsu_load_err_i` | in | 1 |  |
| `lsu_store_err_i` | in | 1 |  |
| `debug_req_i` | in | 1 |  |
| `debug_single_step_i` | in | 1 |  |
| `debug_ebreakm_i` | in | 1 |  |
| `regfile_wdata_lsu_i` | in | 32 |  |
| `regfile_wdata_ex_i` | in | 32 |  |
| `csr_rdata_i` | in | 32 |  |
| `ctrl_busy_o` | out | 1 | |
| `core_ctrl_firstfetch_o` | out | 1 | |
| `illegal_insn_o` | out | 1 | |
| `instr_req_o` | out | 1 | |
| `instr_valid_clear_o` | out | 1 | |
| `id_in_ready_o` | out | 1 | |
| `pc_set_o` | out | 1 | |
| `pc_mux_o` | out | 3 | |
| `exc_pc_mux_o` | out | 2 | |
| `exc_cause_o` | out | 6 | |
| `alu_operator_ex_o` | out | 5 | |
| `alu_operand_a_ex_o` | out | 32 | |
| `alu_operand_b_ex_o` | out | 32 | |
| `mult_en_ex_o` | out | 1 | |
| `div_en_ex_o` | out | 1 | |
| `multdiv_operator_ex_o` | out | 2 | |
| `multdiv_signed_mode_ex_o` | out | 2 | |
| `multdiv_operand_a_ex_o` | out | 32 | |
| `multdiv_operand_b_ex_o` | out | 32 | |
| `csr_access_o` | out | 1 | |
| `csr_op_o` | out | 2 | |
| `csr_save_if_o` | out | 1 | |
| `csr_save_id_o` | out | 1 | |
| `csr_restore_mret_id_o` | out | 1 | |
| `csr_save_cause_o` | out | 1 | |
| `csr_mtval_o` | out | 32 | |
| `data_req_ex_o` | out | 1 | |
| `data_we_ex_o` | out | 1 | |
| `data_type_ex_o` | out | 2 | |
| `data_sign_ext_ex_o` | out | 1 | |
| `data_reg_offset_ex_o` | out | 2 | |
| `data_wdata_ex_o` | out | 32 | |
| `debug_cause_o` | out | 3 | |
| `debug_csr_save_o` | out | 1 | |
| `perf_jump_o` | out | 1 | |
| `perf_branch_o` | out | 1 | |
| `perf_tbranch_o` | out | 1 | |
| `instr_ret_o` | out | 1 | |
| `instr_ret_compressed_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_id_stage.v src/ibex_controller.v src/ibex_decoder.v src/ibex_register_file.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
