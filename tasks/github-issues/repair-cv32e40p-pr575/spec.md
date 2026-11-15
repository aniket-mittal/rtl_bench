# Fix GitHub issue #574 in `openhwgroup/cv32e40p`

This task comes from a real bug report against the open-source repository `openhwgroup/cv32e40p`. You get the repository's RTL as it was when the bug was reported (commit `36ccf783c7f5`), trimmed to the files needed to elaborate the module `cv32e40p_core`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Unused FPREC CSR

**Description:**

The FPREC CSR mapped at 0x807 is never used

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `cv32e40p_core`.

- Do not change the ports of `cv32e40p_core` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/cv32e40p_core.v` | `rtl/cv32e40p_core.sv` |
| `src/cv32e40p_cs_registers.v` | `rtl/cv32e40p_cs_registers.sv` |
| `src/cv32e40p_decoder.v` | `rtl/cv32e40p_decoder.sv` |
| `src/cv32e40p_ex_stage.v` | `rtl/cv32e40p_ex_stage.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/cv32e40p_aligner.v` | `rtl/cv32e40p_aligner.sv` |
| `src/cv32e40p_alu.v` | `rtl/cv32e40p_alu.sv` |
| `src/cv32e40p_alu_div.v` | `rtl/cv32e40p_alu_div.sv` |
| `src/cv32e40p_apu_disp.v` | `rtl/cv32e40p_apu_disp.sv` |
| `src/cv32e40p_clock_gate.v` | `bhv/cv32e40p_sim_clock_gate.sv` |
| `src/cv32e40p_compressed_decoder.v` | `rtl/cv32e40p_compressed_decoder.sv` |
| `src/cv32e40p_controller.v` | `rtl/cv32e40p_controller.sv` |
| `src/cv32e40p_ff_one.v` | `rtl/cv32e40p_ff_one.sv` |
| `src/cv32e40p_fifo.v` | `rtl/cv32e40p_fifo.sv` |
| `src/cv32e40p_hwloop_regs.v` | `rtl/cv32e40p_hwloop_regs.sv` |
| `src/cv32e40p_id_stage.v` | `rtl/cv32e40p_id_stage.sv` |
| `src/cv32e40p_if_stage.v` | `rtl/cv32e40p_if_stage.sv` |
| `src/cv32e40p_int_controller.v` | `rtl/cv32e40p_int_controller.sv` |
| `src/cv32e40p_load_store_unit.v` | `rtl/cv32e40p_load_store_unit.sv` |
| `src/cv32e40p_mult.v` | `rtl/cv32e40p_mult.sv` |
| `src/cv32e40p_obi_interface.v` | `rtl/cv32e40p_obi_interface.sv` |
| `src/cv32e40p_popcnt.v` | `rtl/cv32e40p_popcnt.sv` |
| `src/cv32e40p_prefetch_buffer.v` | `rtl/cv32e40p_prefetch_buffer.sv` |
| `src/cv32e40p_prefetch_controller.v` | `rtl/cv32e40p_prefetch_controller.sv` |
| `src/cv32e40p_register_file.v` | `rtl/cv32e40p_register_file_ff.sv` |
| `src/cv32e40p_sleep_unit.v` | `rtl/cv32e40p_sleep_unit.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `cv32e40p_core` are the same as upstream.

## Grading

Your `cv32e40p_core` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/cv32e40p_core.v`, `src/cv32e40p_cs_registers.v`, `src/cv32e40p_decoder.v`, `src/cv32e40p_ex_stage.v`. Only these files are graded.
Read-only (restored before grading): `src/cv32e40p_aligner.v`, `src/cv32e40p_alu.v`, `src/cv32e40p_alu_div.v`, `src/cv32e40p_apu_disp.v`, `src/cv32e40p_clock_gate.v`, `src/cv32e40p_compressed_decoder.v`, `src/cv32e40p_controller.v`, `src/cv32e40p_ff_one.v`, `src/cv32e40p_fifo.v`, `src/cv32e40p_hwloop_regs.v`, `src/cv32e40p_id_stage.v`, `src/cv32e40p_if_stage.v`, `src/cv32e40p_int_controller.v`, `src/cv32e40p_load_store_unit.v`, `src/cv32e40p_mult.v`, `src/cv32e40p_obi_interface.v`, `src/cv32e40p_popcnt.v`, `src/cv32e40p_prefetch_buffer.v`, `src/cv32e40p_prefetch_controller.v`, `src/cv32e40p_register_file.v`, `src/cv32e40p_sleep_unit.v`.

## Interface of `cv32e40p_core`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `pulp_clock_en_i` | in | 1 |  |
| `scan_cg_en_i` | in | 1 |  |
| `boot_addr_i` | in | 32 |  |
| `mtvec_addr_i` | in | 32 |  |
| `dm_halt_addr_i` | in | 32 |  |
| `hart_id_i` | in | 32 |  |
| `dm_exception_addr_i` | in | 32 |  |
| `instr_gnt_i` | in | 1 |  |
| `instr_rvalid_i` | in | 1 |  |
| `instr_rdata_i` | in | 32 |  |
| `data_gnt_i` | in | 1 |  |
| `data_rvalid_i` | in | 1 |  |
| `data_rdata_i` | in | 32 |  |
| `apu_gnt_i` | in | 1 |  |
| `apu_rvalid_i` | in | 1 |  |
| `apu_result_i` | in | 32 |  |
| `apu_flags_i` | in | 5 |  |
| `irq_i` | in | 32 |  |
| `debug_req_i` | in | 1 |  |
| `fetch_enable_i` | in | 1 |  |
| `instr_req_o` | out | 1 | |
| `instr_addr_o` | out | 32 | |
| `data_req_o` | out | 1 | |
| `data_we_o` | out | 1 | |
| `data_be_o` | out | 4 | |
| `data_addr_o` | out | 32 | |
| `data_wdata_o` | out | 32 | |
| `apu_req_o` | out | 1 | |
| `apu_operands_o` | out | 96 | |
| `apu_op_o` | out | 6 | |
| `apu_flags_o` | out | 15 | |
| `irq_ack_o` | out | 1 | |
| `irq_id_o` | out | 5 | |
| `debug_havereset_o` | out | 1 | |
| `debug_running_o` | out | 1 | |
| `debug_halted_o` | out | 1 | |
| `core_sleep_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/cv32e40p_core.v src/cv32e40p_cs_registers.v src/cv32e40p_decoder.v src/cv32e40p_ex_stage.v src/cv32e40p_aligner.v src/cv32e40p_alu.v src/cv32e40p_alu_div.v src/cv32e40p_apu_disp.v src/cv32e40p_clock_gate.v src/cv32e40p_compressed_decoder.v src/cv32e40p_controller.v src/cv32e40p_ff_one.v src/cv32e40p_fifo.v src/cv32e40p_hwloop_regs.v src/cv32e40p_id_stage.v src/cv32e40p_if_stage.v src/cv32e40p_int_controller.v src/cv32e40p_load_store_unit.v src/cv32e40p_mult.v src/cv32e40p_obi_interface.v src/cv32e40p_popcnt.v src/cv32e40p_prefetch_buffer.v src/cv32e40p_prefetch_controller.v src/cv32e40p_register_file.v src/cv32e40p_sleep_unit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
