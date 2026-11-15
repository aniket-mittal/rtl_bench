# Fix GitHub issue #838 in `openhwgroup/cv32e40p`

This task comes from a real bug report against the open-source repository `openhwgroup/cv32e40p`. You get the repository's RTL as it was when the bug was reported (commit `25907a07dc1e`), trimmed to the files needed to elaborate the module `cv32e40p_controller`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** pulp hwloop count not decrementing to 0 after the end of hwloop body execution

**Description:**

### Issue Description
In pulp hwloop tests, after the end of hwloop body, i.e., after the last hwloop body instruction has been executed, the loop count csr does not decrement to 0 and final value of count remains at 1

### Component
**Component:RTL**

### Steps to Reproduce

1. cv32e40p git hash : 99772238edb4093e99386599b9f3d79f4d125f30

2.  Using "core-v-verif" repo ,  branch : cv32e40p/dev
     core-v-verif hash :  c7610d8ab6fecdb81b21a6e4e791c8f9e01fc7bd

-      git clone -b cv32e40p/dev https://github.com/openhwgroup/core-v-verif.git
-      cd core-v-verif
-      git checkout c7610d8ab6fecdb81b21a6e4e791c8f9e01fc7bd

3. Run Test:
Run with reference model (USE_ISS=yes) to get the error mismatch in log. Otherwise if running without USE_ISS, we can see this issue from the wave dump.
-     setenv SIMULATOR vsim (or any other simulator)
-     cd cv32e40p/sim/uvmt/
-      make test TEST=pulp_hardware_loop USE_ISS=yes CFG=pulp_fpu WAVES=1 SEED=1 RUN_INDEX=1 USER_RUN_FLAGS="+IDV_TRACE2LOG=1"

4. Log Error:

> Info (IDV) Instruction executed prior to mismatch '0x1c0(startZ_1+8): 00188893 addi    x17,x17,1'
> Error (IDV) CSR register value mismatch (HartId:0, PC:0x000001c0 startZ_1+8):
> Info (IDV)  0> CSR cc2 (lpcount0)
> Info (IDV)   . dut:0x00000001
> Info (IDV)   . ref:0x0000000

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `cv32e40p_controller`.

- Do not change the ports of `cv32e40p_controller` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/cv32e40p_controller.v` | `rtl/cv32e40p_controller.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `cv32e40p_controller` are the same as upstream.

## Grading

Your `cv32e40p_controller` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/cv32e40p_controller.v`. Only these files are graded.

## Interface of `cv32e40p_controller`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `clk_ungated_i` | in | 1 |  |
| `rst_n` | in | 1 | reset, active low |
| `fetch_enable_i` | in | 1 |  |
| `is_fetch_failed_i` | in | 1 |  |
| `illegal_insn_i` | in | 1 |  |
| `ecall_insn_i` | in | 1 |  |
| `mret_insn_i` | in | 1 |  |
| `uret_insn_i` | in | 1 |  |
| `dret_insn_i` | in | 1 |  |
| `mret_dec_i` | in | 1 |  |
| `uret_dec_i` | in | 1 |  |
| `dret_dec_i` | in | 1 |  |
| `wfi_i` | in | 1 |  |
| `ebrk_insn_i` | in | 1 |  |
| `fencei_insn_i` | in | 1 |  |
| `csr_status_i` | in | 1 |  |
| `instr_valid_i` | in | 1 |  |
| `pc_id_i` | in | 32 |  |
| `is_compressed_i` | in | 1 |  |
| `hwlp_start_addr_i` | in | 64 |  |
| `hwlp_end_addr_i` | in | 64 |  |
| `hwlp_counter_i` | in | 64 |  |
| `data_req_ex_i` | in | 1 |  |
| `data_we_ex_i` | in | 1 |  |
| `data_misaligned_i` | in | 1 |  |
| `data_load_event_i` | in | 1 |  |
| `data_err_i` | in | 1 |  |
| `mult_multicycle_i` | in | 1 |  |
| `apu_en_i` | in | 1 |  |
| `apu_read_dep_i` | in | 1 |  |
| `apu_write_dep_i` | in | 1 |  |
| `branch_taken_ex_i` | in | 1 |  |
| `ctrl_transfer_insn_in_id_i` | in | 2 |  |
| `ctrl_transfer_insn_in_dec_i` | in | 2 |  |
| `irq_req_ctrl_i` | in | 1 |  |
| `irq_sec_ctrl_i` | in | 1 |  |
| `irq_id_ctrl_i` | in | 5 |  |
| `irq_wu_ctrl_i` | in | 1 |  |
| `current_priv_lvl_i` | in | 2 |  |
| `debug_req_i` | in | 1 |  |
| `debug_single_step_i` | in | 1 |  |
| `debug_ebreakm_i` | in | 1 |  |
| `debug_ebreaku_i` | in | 1 |  |
| `trigger_match_i` | in | 1 |  |
| `regfile_we_id_i` | in | 1 |  |
| `regfile_alu_waddr_id_i` | in | 6 |  |
| `regfile_we_ex_i` | in | 1 |  |
| `regfile_waddr_ex_i` | in | 6 |  |
| `regfile_we_wb_i` | in | 1 |  |
| `regfile_alu_we_fw_i` | in | 1 |  |
| `reg_d_ex_is_reg_a_i` | in | 1 |  |
| `reg_d_ex_is_reg_b_i` | in | 1 |  |
| `reg_d_ex_is_reg_c_i` | in | 1 |  |
| `reg_d_wb_is_reg_a_i` | in | 1 |  |
| `reg_d_wb_is_reg_b_i` | in | 1 |  |
| `reg_d_wb_is_reg_c_i` | in | 1 |  |
| `reg_d_alu_is_reg_a_i` | in | 1 |  |
| `reg_d_alu_is_reg_b_i` | in | 1 |  |
| `reg_d_alu_is_reg_c_i` | in | 1 |  |
| `id_ready_i` | in | 1 |  |
| `id_valid_i` | in | 1 |  |
| `ex_valid_i` | in | 1 |  |
| `wb_ready_i` | in | 1 |  |
| `ctrl_busy_o` | out | 1 | |
| `is_decoding_o` | out | 1 | |
| `deassert_we_o` | out | 1 | |
| `hwlp_mask_o` | out | 1 | |
| `instr_req_o` | out | 1 | |
| `pc_set_o` | out | 1 | |
| `pc_mux_o` | out | 4 | |
| `exc_pc_mux_o` | out | 3 | |
| `trap_addr_mux_o` | out | 2 | |
| `hwlp_dec_cnt_o` | out | 2 | |
| `hwlp_jump_o` | out | 1 | |
| `hwlp_targ_addr_o` | out | 32 | |
| `data_err_ack_o` | out | 1 | |
| `apu_stall_o` | out | 1 | |
| `irq_ack_o` | out | 1 | |
| `irq_id_o` | out | 5 | |
| `exc_cause_o` | out | 5 | |
| `debug_mode_o` | out | 1 | |
| `debug_cause_o` | out | 3 | |
| `debug_csr_save_o` | out | 1 | |
| `debug_p_elw_no_sleep_o` | out | 1 | |
| `debug_wfi_no_sleep_o` | out | 1 | |
| `debug_havereset_o` | out | 1 | |
| `debug_running_o` | out | 1 | |
| `debug_halted_o` | out | 1 | |
| `wake_from_sleep_o` | out | 1 | |
| `csr_save_if_o` | out | 1 | |
| `csr_save_id_o` | out | 1 | |
| `csr_save_ex_o` | out | 1 | |
| `csr_cause_o` | out | 6 | |
| `csr_irq_sec_o` | out | 1 | |
| `csr_restore_mret_id_o` | out | 1 | |
| `csr_restore_uret_id_o` | out | 1 | |
| `csr_restore_dret_id_o` | out | 1 | |
| `csr_save_cause_o` | out | 1 | |
| `operand_a_fw_mux_sel_o` | out | 2 | |
| `operand_b_fw_mux_sel_o` | out | 2 | |
| `operand_c_fw_mux_sel_o` | out | 2 | |
| `halt_if_o` | out | 1 | |
| `halt_id_o` | out | 1 | |
| `misaligned_stall_o` | out | 1 | |
| `jr_stall_o` | out | 1 | |
| `load_stall_o` | out | 1 | |
| `perf_pipeline_stall_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/cv32e40p_controller.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
