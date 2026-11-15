# Fix GitHub issue #781 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `439513ba68b5`), trimmed to the files needed to elaborate the module `ibex_core`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** ID/EX: Use `multdiv_sel` instead of `multdiv_en` and variants where possible

**Description:**

While reviewing #746 I noted two things in ID/EX:
- In `ibex_ex_stage.sv` we are generating `multdiv_en` based on `mult_en_*` and `div_en_*` signals to control the result mux.
- Inside `ibex_multdiv_fast/slow.sv` we are using the same `mult_en_*` and `div_en_*` to control both FSMs and muxes. The `multdiv_sel` signal is not available (only inside the ALU).

The main difference between these signals is that `multdiv_sel` directly comes out of the decoder where as `mult_en_*` and `div_en_*` are qualified with `instr_executing` inside the ID stage (which itself depends on various other signals from ID stage and the controller).

As far as I understand, this is needed to control the FSMs inside `ibex_multdiv_fast/slow.sv` but not for most of the muxes. These muxes or at least some of them could be controlled depending on the decoder output only. Since all those muxes are critical, I would suggest to investigate which of the muxes can be controlled by the less critical `multdiv_sel` inside the ID/EX stage.

Do you @GregAC , @tomroberts-lowrisc , @rswarbrick , @imphil think this makes sense? Do you have any thoughts on this?

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
| `src/ibex_ex_block.v` | `rtl/ibex_ex_block.sv` |
| `src/ibex_id_stage.v` | `rtl/ibex_id_stage.sv` |
| `src/ibex_multdiv_fast.v` | `rtl/ibex_multdiv_fast.sv` |
| `src/ibex_multdiv_slow.v` | `rtl/ibex_multdiv_slow.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/ibex_alu.v` | `rtl/ibex_alu.sv` |
| `src/ibex_compressed_decoder.v` | `rtl/ibex_compressed_decoder.sv` |
| `src/ibex_controller.v` | `rtl/ibex_controller.sv` |
| `src/ibex_counters.v` | `rtl/ibex_counters.sv` |
| `src/ibex_cs_registers.v` | `rtl/ibex_cs_registers.sv` |
| `src/ibex_fetch_fifo.v` | `rtl/ibex_fetch_fifo.sv` |
| `src/ibex_icache.v` | `rtl/ibex_icache.sv` |
| `src/ibex_if_stage.v` | `rtl/ibex_if_stage.sv` |
| `src/ibex_load_store_unit.v` | `rtl/ibex_load_store_unit.sv` |
| `src/ibex_pmp.v` | `rtl/ibex_pmp.sv` |
| `src/ibex_prefetch_buffer.v` | `rtl/ibex_prefetch_buffer.sv` |
| `src/ibex_register_file.v` | `rtl/ibex_register_file_ff.sv` |
| `src/ibex_wb_stage.v` | `rtl/ibex_wb_stage.sv` |
| `src/prim_clock_gating.v` | `syn/rtl/prim_clock_gating.v` |
| `src/prim_generic_ram_1p.v` | `shared/rtl/prim_generic_ram_1p.sv` |
| `src/prim_secded_28_22_dec.v` | `shared/rtl/prim_secded_28_22_dec.sv` |
| `src/prim_secded_28_22_enc.v` | `shared/rtl/prim_secded_28_22_enc.sv` |
| `src/prim_secded_72_64_dec.v` | `shared/rtl/prim_secded_72_64_dec.sv` |
| `src/prim_secded_72_64_enc.v` | `shared/rtl/prim_secded_72_64_enc.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_core` are the same as upstream.

## Grading

Your `ibex_core` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_core.v`, `src/ibex_decoder.v`, `src/ibex_ex_block.v`, `src/ibex_id_stage.v`, `src/ibex_multdiv_fast.v`, `src/ibex_multdiv_slow.v`. Only these files are graded.
Read-only (restored before grading): `src/ibex_alu.v`, `src/ibex_compressed_decoder.v`, `src/ibex_controller.v`, `src/ibex_counters.v`, `src/ibex_cs_registers.v`, `src/ibex_fetch_fifo.v`, `src/ibex_icache.v`, `src/ibex_if_stage.v`, `src/ibex_load_store_unit.v`, `src/ibex_pmp.v`, `src/ibex_prefetch_buffer.v`, `src/ibex_register_file.v`, `src/ibex_wb_stage.v`, `src/prim_clock_gating.v`, `src/prim_generic_ram_1p.v`, `src/prim_secded_28_22_dec.v`, `src/prim_secded_28_22_enc.v`, `src/prim_secded_72_64_dec.v`, `src/prim_secded_72_64_enc.v`.

## Interface of `ibex_core`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `test_en_i` | in | 1 |  |
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
| `irq_software_i` | in | 1 |  |
| `irq_timer_i` | in | 1 |  |
| `irq_external_i` | in | 1 |  |
| `irq_fast_i` | in | 15 |  |
| `irq_nm_i` | in | 1 |  |
| `debug_req_i` | in | 1 |  |
| `fetch_enable_i` | in | 1 |  |
| `instr_req_o` | out | 1 | |
| `instr_addr_o` | out | 32 | |
| `data_req_o` | out | 1 | |
| `data_we_o` | out | 1 | |
| `data_be_o` | out | 4 | |
| `data_addr_o` | out | 32 | |
| `data_wdata_o` | out | 32 | |
| `core_sleep_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_core.v src/ibex_decoder.v src/ibex_ex_block.v src/ibex_id_stage.v src/ibex_multdiv_fast.v src/ibex_multdiv_slow.v src/ibex_alu.v src/ibex_compressed_decoder.v src/ibex_controller.v src/ibex_counters.v src/ibex_cs_registers.v src/ibex_fetch_fifo.v src/ibex_icache.v src/ibex_if_stage.v src/ibex_load_store_unit.v src/ibex_pmp.v src/ibex_prefetch_buffer.v src/ibex_register_file.v src/ibex_wb_stage.v src/prim_clock_gating.v src/prim_generic_ram_1p.v src/prim_secded_28_22_dec.v src/prim_secded_28_22_enc.v src/prim_secded_72_64_dec.v src/prim_secded_72_64_enc.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
