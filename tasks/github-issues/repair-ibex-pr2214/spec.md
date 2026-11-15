# Fix GitHub issue #2193 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `78739562ce7b`), trimmed to the files needed to elaborate the module `ibex_core`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Pipeline not being flushed on PMP register clears

**Description:**

In [this commit](https://github.com/lowRISC/ibex/commit/46404cf86f60f72fb84a2bc693d2ab08011bdb37) the pipeline was made to flush on changes to PMP registers, changes made via `CSR_OP_CLEAR` however are missed.

This is likely because prior to this commit only mstatus and mie were listed, and clearing is safe for those.

This meant that instructions being fetched were passing PMP checks which they should not have been.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_core`.

- Do not change the ports of `ibex_core` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_core.v` | `rtl/ibex_core.sv` |
| `src/ibex_decoder.v` | `rtl/ibex_decoder.sv` |
| `src/ibex_id_stage.v` | `rtl/ibex_id_stage.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/ibex_alu.v` | `rtl/ibex_alu.sv` |
| `src/ibex_branch_predict.v` | `rtl/ibex_branch_predict.sv` |
| `src/ibex_compressed_decoder.v` | `rtl/ibex_compressed_decoder.sv` |
| `src/ibex_controller.v` | `rtl/ibex_controller.sv` |
| `src/ibex_counter.v` | `rtl/ibex_counter.sv` |
| `src/ibex_cs_registers.v` | `rtl/ibex_cs_registers.sv` |
| `src/ibex_csr.v` | `rtl/ibex_csr.sv` |
| `src/ibex_dummy_instr.v` | `rtl/ibex_dummy_instr.sv` |
| `src/ibex_ex_block.v` | `rtl/ibex_ex_block.sv` |
| `src/ibex_fetch_fifo.v` | `rtl/ibex_fetch_fifo.sv` |
| `src/ibex_icache.v` | `rtl/ibex_icache.sv` |
| `src/ibex_if_stage.v` | `rtl/ibex_if_stage.sv` |
| `src/ibex_load_store_unit.v` | `rtl/ibex_load_store_unit.sv` |
| `src/ibex_multdiv_fast.v` | `rtl/ibex_multdiv_fast.sv` |
| `src/ibex_multdiv_slow.v` | `rtl/ibex_multdiv_slow.sv` |
| `src/ibex_pmp.v` | `rtl/ibex_pmp.sv` |
| `src/ibex_prefetch_buffer.v` | `rtl/ibex_prefetch_buffer.sv` |
| `src/ibex_wb_stage.v` | `rtl/ibex_wb_stage.sv` |
| `src/prim_buf.v` | (stand-in for `prim_buf`, see below) |
| `src/prim_lfsr.v` | `vendor/lowrisc_ip/ip/prim/rtl/prim_lfsr.sv` |
| `src/prim_secded_inv_28_22_dec.v` | `vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_28_22_dec.sv` |
| `src/prim_secded_inv_28_22_enc.v` | `vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_28_22_enc.sv` |
| `src/prim_secded_inv_39_32_dec.v` | `vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_dec.sv` |
| `src/prim_secded_inv_39_32_enc.v` | `vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_enc.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_core` are the same as upstream.
Modules derived from a `prim_*` stand-in come from OpenTitan's generic implementation (`prim_generic_*`) with the module renamed.

## Grading

Your `ibex_core` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_core.v`, `src/ibex_decoder.v`, `src/ibex_id_stage.v`. Only these files are graded.
Read-only (restored before grading): `src/ibex_alu.v`, `src/ibex_branch_predict.v`, `src/ibex_compressed_decoder.v`, `src/ibex_controller.v`, `src/ibex_counter.v`, `src/ibex_cs_registers.v`, `src/ibex_csr.v`, `src/ibex_dummy_instr.v`, `src/ibex_ex_block.v`, `src/ibex_fetch_fifo.v`, `src/ibex_icache.v`, `src/ibex_if_stage.v`, `src/ibex_load_store_unit.v`, `src/ibex_multdiv_fast.v`, `src/ibex_multdiv_slow.v`, `src/ibex_pmp.v`, `src/ibex_prefetch_buffer.v`, `src/ibex_wb_stage.v`, `src/prim_buf.v`, `src/prim_lfsr.v`, `src/prim_secded_inv_28_22_dec.v`, `src/prim_secded_inv_28_22_enc.v`, `src/prim_secded_inv_39_32_dec.v`, `src/prim_secded_inv_39_32_enc.v`.

## Interface of `ibex_core`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `hart_id_i` | in | 32 |  |
| `boot_addr_i` | in | 32 |  |
| `instr_gnt_i` | in | 1 |  |
| `instr_rvalid_i` | in | 1 |  |
| `instr_rdata_i` | in | 32 |  |
| `instr_err_i` | in | 1 |  |
| `data_gnt_i` | in | 1 |  |
| `data_rvalid_i` | in | 1 |  |
| `data_rdata_i` | in | 32 |  |
| `data_err_i` | in | 1 |  |
| `rf_rdata_a_ecc_i` | in | 32 |  |
| `rf_rdata_b_ecc_i` | in | 32 |  |
| `ic_tag_rdata_i` | in | 44 |  |
| `ic_data_rdata_i` | in | 128 |  |
| `ic_scr_key_valid_i` | in | 1 |  |
| `irq_software_i` | in | 1 |  |
| `irq_timer_i` | in | 1 |  |
| `irq_external_i` | in | 1 |  |
| `irq_fast_i` | in | 15 |  |
| `irq_nm_i` | in | 1 |  |
| `debug_req_i` | in | 1 |  |
| `fetch_enable_i` | in | 4 |  |
| `instr_req_o` | out | 1 | |
| `instr_addr_o` | out | 32 | |
| `data_req_o` | out | 1 | |
| `data_we_o` | out | 1 | |
| `data_be_o` | out | 4 | |
| `data_addr_o` | out | 32 | |
| `data_wdata_o` | out | 32 | |
| `dummy_instr_id_o` | out | 1 | |
| `dummy_instr_wb_o` | out | 1 | |
| `rf_raddr_a_o` | out | 5 | |
| `rf_raddr_b_o` | out | 5 | |
| `rf_waddr_wb_o` | out | 5 | |
| `rf_we_wb_o` | out | 1 | |
| `rf_wdata_wb_ecc_o` | out | 32 | |
| `ic_tag_req_o` | out | 2 | |
| `ic_tag_write_o` | out | 1 | |
| `ic_tag_addr_o` | out | 8 | |
| `ic_tag_wdata_o` | out | 22 | |
| `ic_data_req_o` | out | 2 | |
| `ic_data_write_o` | out | 1 | |
| `ic_data_addr_o` | out | 8 | |
| `ic_data_wdata_o` | out | 64 | |
| `ic_scr_key_req_o` | out | 1 | |
| `irq_pending_o` | out | 1 | |
| `crash_dump_o` | out | 160 | |
| `double_fault_seen_o` | out | 1 | |
| `alert_minor_o` | out | 1 | |
| `alert_major_internal_o` | out | 1 | |
| `alert_major_bus_o` | out | 1 | |
| `core_busy_o` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_core.v src/ibex_decoder.v src/ibex_id_stage.v src/ibex_alu.v src/ibex_branch_predict.v src/ibex_compressed_decoder.v src/ibex_controller.v src/ibex_counter.v src/ibex_cs_registers.v src/ibex_csr.v src/ibex_dummy_instr.v src/ibex_ex_block.v src/ibex_fetch_fifo.v src/ibex_icache.v src/ibex_if_stage.v src/ibex_load_store_unit.v src/ibex_multdiv_fast.v src/ibex_multdiv_slow.v src/ibex_pmp.v src/ibex_prefetch_buffer.v src/ibex_wb_stage.v src/prim_buf.v src/prim_lfsr.v src/prim_secded_inv_28_22_dec.v src/prim_secded_inv_28_22_enc.v src/prim_secded_inv_39_32_dec.v src/prim_secded_inv_39_32_enc.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
