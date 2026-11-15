# Fix GitHub issue #305 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `85e1d43a08e8`), trimmed to the files needed to elaborate the module `ibex_controller`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Potential timing issues around pc_set

**Description:**

The pc_set signal factors in both exceptions that have just occurred and branch conditions and directly feeds into the top-level instr_addr_o output (and associated signals).  This is a long path making the instruction memory interface outputs late.

The paper 'Slow and Steady Wins the Race? A Comparison of Ultra-Low-Power RISC-V Cores for Internet-of-Things Applications' (https://www.researchgate.net/profile/Francesco_Conti4/publication/321121782_Slow_and_steady_wins_the_race_A_comparison_of_ultra-low-power_RISC-V_cores_for_Internet-of-Things_applications/links/5a37aa3ea6fdccdd41fc99e1/Slow-and-steady-wins-the-race-A-comparison-of-ultra-low-power-RISC-V-cores-for-Internet-of-Things-applications.pdf) which looked at zero-riscy highlighted this path as the worst in their test system.

The simple fix (stall and set the pc cycle after branch decision/exception) adds a cycle latency to any branch.  A simple branch predictor may be able to reduce the impact of this.

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
