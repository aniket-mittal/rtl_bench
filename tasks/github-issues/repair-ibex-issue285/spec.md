# Fix GitHub issue #285 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `16177fe8db90`), trimmed to the files needed to elaborate the module `ibex_cs_registers`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Dcsr.xdebugver reset value

**Description:**

Hi all,
I noticed that in the CSR register module, `dcsr.xdebugver` is set to `XDEBUGVER_NO` upon reset, but after reset is over and an explicit write to `dcsr` occurs, the `xdebugver` field will then be permanently set to the value of `XDEBUGVER_STD` for the duration of the simulation.  This seems to contradict with the behavior of the `dcsr.prv` field, which is set to `PRV_LVL_M` at reset, as well as whenever a write occurs outside of reset.  Why does this separate reset behavior for `xdebugver` occur, instead of setting it to `XDEBUGVER_STD` from reset onwards especially since this field is read-only and stays as a constant?
Thank you!
Udi

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_cs_registers`.

- Do not change the ports of `ibex_cs_registers` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_cs_registers.v` | `rtl/ibex_cs_registers.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_cs_registers` are the same as upstream.

## Grading

Your `ibex_cs_registers` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_cs_registers.v`. Only these files are graded.

## Interface of `ibex_cs_registers`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `hart_id_i` | in | 32 |  |
| `csr_mtvec_init_i` | in | 1 |  |
| `boot_addr_i` | in | 32 |  |
| `csr_access_i` | in | 1 |  |
| `csr_addr_i` | in | 12 |  |
| `csr_wdata_i` | in | 32 |  |
| `csr_op_i` | in | 2 |  |
| `irq_software_i` | in | 1 |  |
| `irq_timer_i` | in | 1 |  |
| `irq_external_i` | in | 1 |  |
| `irq_fast_i` | in | 15 |  |
| `debug_mode_i` | in | 1 |  |
| `debug_cause_i` | in | 3 |  |
| `debug_csr_save_i` | in | 1 |  |
| `pc_if_i` | in | 32 |  |
| `pc_id_i` | in | 32 |  |
| `csr_save_if_i` | in | 1 |  |
| `csr_save_id_i` | in | 1 |  |
| `csr_restore_mret_i` | in | 1 |  |
| `csr_save_cause_i` | in | 1 |  |
| `csr_mcause_i` | in | 6 |  |
| `csr_mtval_i` | in | 32 |  |
| `instr_new_id_i` | in | 1 |  |
| `instr_ret_i` | in | 1 |  |
| `instr_ret_compressed_i` | in | 1 |  |
| `imiss_i` | in | 1 |  |
| `pc_set_i` | in | 1 |  |
| `jump_i` | in | 1 |  |
| `branch_i` | in | 1 |  |
| `branch_taken_i` | in | 1 |  |
| `mem_load_i` | in | 1 |  |
| `mem_store_i` | in | 1 |  |
| `lsu_busy_i` | in | 1 |  |
| `priv_mode_o` | out | 2 | |
| `csr_mtvec_o` | out | 32 | |
| `csr_rdata_o` | out | 32 | |
| `irq_pending_o` | out | 1 | |
| `csr_msip_o` | out | 1 | |
| `csr_mtip_o` | out | 1 | |
| `csr_meip_o` | out | 1 | |
| `csr_mfip_o` | out | 15 | |
| `csr_mstatus_mie_o` | out | 1 | |
| `csr_mepc_o` | out | 32 | |
| `csr_pmp_cfg_o` | out | 24 | |
| `csr_pmp_addr_o` | out | 136 | |
| `csr_depc_o` | out | 32 | |
| `debug_single_step_o` | out | 1 | |
| `debug_ebreakm_o` | out | 1 | |
| `illegal_csr_insn_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_cs_registers.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
