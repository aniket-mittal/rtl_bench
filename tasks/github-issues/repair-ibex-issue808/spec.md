# Fix GitHub issue #808 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `dcf18d86c3db`), trimmed to the files needed to elaborate the module `ibex_load_store_unit`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** SpecialReqAllGivesSpecialReqBranchIfBranchInst assertion failure

**Description:**

Hi all,
When running the `riscv_mmu_stress_test` with PMP regions enabled, I noticed that the `SpecialReqAllGivesSpecialReqBranchIfBranchInst` assertion was failing, shown below:

A snippet of the OVPsim log of the relevant instruction execution is shown below:

A waveform snippet of when the assertion fails is below, the failure occurs one cycle after the yellow marker, where the small red arrow is located:

The situation is as follows: the `sb` instruction at `PC=0x80005496` (at the green `M1` marker accesses memory at `0xffa839bc` from User-mode and this access correctly causes a PMP store address exception (all 16 regions are enabled and set to `TOR` mode, the address being accessed here is not contained within any of the enabled regions).  The core then jumps to the PC stored in `mtvec`, which is a jump instruction at `PC=0x80001400`.
However, one cycle after starting to execute this jump, the previously mentioned assertion fails, as even though `special_req_all` and `jump_set_i` are both high due to the PMP store exception and the resultant branch, the `special_req_branch` signal does not go high at all.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_load_store_unit`.

- Do not change the ports of `ibex_load_store_unit` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_load_store_unit.v` | `rtl/ibex_load_store_unit.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_load_store_unit` are the same as upstream.

## Grading

Your `ibex_load_store_unit` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_load_store_unit.v`. Only these files are graded.

## Interface of `ibex_load_store_unit`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `data_gnt_i` | in | 1 |  |
| `data_rvalid_i` | in | 1 |  |
| `data_err_i` | in | 1 |  |
| `data_pmp_err_i` | in | 1 |  |
| `data_rdata_i` | in | 32 |  |
| `lsu_we_i` | in | 1 |  |
| `lsu_type_i` | in | 2 |  |
| `lsu_wdata_i` | in | 32 |  |
| `lsu_sign_ext_i` | in | 1 |  |
| `lsu_req_i` | in | 1 |  |
| `adder_result_ex_i` | in | 32 |  |
| `illegal_insn_id_i` | in | 1 |  |
| `instr_valid_id_i` | in | 1 |  |
| `data_req_o` | out | 1 | |
| `data_addr_o` | out | 32 | |
| `data_we_o` | out | 1 | |
| `data_be_o` | out | 4 | |
| `data_wdata_o` | out | 32 | |
| `lsu_rdata_o` | out | 32 | |
| `lsu_rdata_valid_o` | out | 1 | |
| `addr_incr_req_o` | out | 1 | |
| `addr_last_o` | out | 32 | |
| `lsu_req_done_o` | out | 1 | |
| `lsu_resp_valid_o` | out | 1 | |
| `load_err_o` | out | 1 | |
| `store_err_o` | out | 1 | |
| `load_o` | out | 1 | |
| `busy_o` | out | 1 | |
| `perf_load_o` | out | 1 | |
| `perf_store_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_load_store_unit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
