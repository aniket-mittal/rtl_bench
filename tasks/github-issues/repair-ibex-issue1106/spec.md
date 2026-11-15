# Fix GitHub issue #1106 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `c31d066130bd`), trimmed to the files needed to elaborate the module `ibex_controller`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** The step operation is error when the SW bp is set in a J instruction.

**Description:**

Hi Guys：
      I use the Ibex core running a simple test C code.
       I set a SW bp before a “jump” instruction,  when the cpu fetched the SW bp instruction, the cpu is halted.
       But after that, i use the “step" cmd in telnet,  the PC in CPU is wrong, it's not the correct PC which the JUMP instruction expected , the dpc has been changed.
      When I use the HW bp， the dpc has‘t been changed.
       So, i think this is a bug
       please see the following figure.

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
| `instr_bp_taken_i` | in | 1 |  |
| `instr_fetch_err_i` | in | 1 |  |
| `instr_fetch_err_plus2_i` | in | 1 |  |
| `pc_id_i` | in | 32 |  |
| `lsu_addr_last_i` | in | 32 |  |
| `load_err_i` | in | 1 |  |
| `store_err_i` | in | 1 |  |
| `branch_set_i` | in | 1 |  |
| `branch_set_spec_i` | in | 1 |  |
| `branch_not_set_i` | in | 1 |  |
| `jump_set_i` | in | 1 |  |
| `csr_mstatus_mie_i` | in | 1 |  |
| `irq_pending_i` | in | 1 |  |
| `irqs_i` | in | 18 |  |
| `irq_nm_i` | in | 1 |  |
| `debug_req_i` | in | 1 |  |
| `debug_single_step_i` | in | 1 |  |
| `debug_ebreakm_i` | in | 1 |  |
| `debug_ebreaku_i` | in | 1 |  |
| `trigger_match_i` | in | 1 |  |
| `priv_mode_i` | in | 2 |  |
| `csr_mstatus_tw_i` | in | 1 |  |
| `stall_id_i` | in | 1 |  |
| `stall_wb_i` | in | 1 |  |
| `ready_wb_i` | in | 1 |  |
| `ctrl_busy_o` | out | 1 | |
| `instr_valid_clear_o` | out | 1 | |
| `id_in_ready_o` | out | 1 | |
| `controller_run_o` | out | 1 | |
| `instr_req_o` | out | 1 | |
| `pc_set_o` | out | 1 | |
| `pc_set_spec_o` | out | 1 | |
| `pc_mux_o` | out | 3 | |
| `nt_branch_mispredict_o` | out | 1 | |
| `exc_pc_mux_o` | out | 2 | |
| `exc_cause_o` | out | 6 | |
| `wb_exception_o` | out | 1 | |
| `nmi_mode_o` | out | 1 | |
| `debug_cause_o` | out | 3 | |
| `debug_csr_save_o` | out | 1 | |
| `debug_mode_o` | out | 1 | |
| `csr_save_if_o` | out | 1 | |
| `csr_save_id_o` | out | 1 | |
| `csr_save_wb_o` | out | 1 | |
| `csr_restore_mret_id_o` | out | 1 | |
| `csr_restore_dret_id_o` | out | 1 | |
| `csr_save_cause_o` | out | 1 | |
| `csr_mtval_o` | out | 32 | |
| `flush_id_o` | out | 1 | |
| `perf_jump_o` | out | 1 | |
| `perf_tbranch_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_controller.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
