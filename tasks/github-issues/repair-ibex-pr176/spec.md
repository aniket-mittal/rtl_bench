# Fix GitHub issue #25 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `04f4cd44f6b6`), trimmed to the files needed to elaborate the module `ibex_decoder`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Remove reg-reg loads

**Description:**

reg-reg load (i.e., offset taken from a register and not from an immediate) should not be part of the Ibex ISA.

The code at line 261 here:
https://github.com/lowRISC/ibex/blob/master/rtl/ibex_decoder.sv

is a piece of code coming from RISCY and it should be removed.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_decoder`.

- Do not change the ports of `ibex_decoder` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_decoder.v` | `rtl/ibex_decoder.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_decoder` are the same as upstream.

## Grading

Your `ibex_decoder` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_decoder.v`. Only these files are graded.

## Interface of `ibex_decoder`

| port | dir | width | note |
|---|---|---|---|
| `instr_new_i` | in | 1 |  |
| `instr_rdata_i` | in | 32 |  |
| `illegal_c_insn_i` | in | 1 |  |
| `illegal_insn_o` | out | 1 | |
| `ebrk_insn_o` | out | 1 | |
| `mret_insn_o` | out | 1 | |
| `dret_insn_o` | out | 1 | |
| `ecall_insn_o` | out | 1 | |
| `wfi_insn_o` | out | 1 | |
| `jump_set_o` | out | 1 | |
| `imm_a_mux_sel_o` | out | 1 | |
| `imm_b_mux_sel_o` | out | 3 | |
| `imm_i_type_o` | out | 32 | |
| `imm_s_type_o` | out | 32 | |
| `imm_b_type_o` | out | 32 | |
| `imm_u_type_o` | out | 32 | |
| `imm_j_type_o` | out | 32 | |
| `zimm_rs1_type_o` | out | 32 | |
| `regfile_wdata_sel_o` | out | 2 | |
| `regfile_we_o` | out | 1 | |
| `regfile_raddr_a_o` | out | 5 | |
| `regfile_raddr_b_o` | out | 5 | |
| `regfile_waddr_o` | out | 5 | |
| `alu_operator_o` | out | 5 | |
| `alu_op_a_mux_sel_o` | out | 2 | |
| `alu_op_b_mux_sel_o` | out | 1 | |
| `mult_en_o` | out | 1 | |
| `div_en_o` | out | 1 | |
| `multdiv_operator_o` | out | 2 | |
| `multdiv_signed_mode_o` | out | 2 | |
| `csr_access_o` | out | 1 | |
| `csr_op_o` | out | 2 | |
| `csr_status_o` | out | 1 | |
| `data_req_o` | out | 1 | |
| `data_we_o` | out | 1 | |
| `data_type_o` | out | 2 | |
| `data_sign_extension_o` | out | 1 | |
| `data_reg_offset_o` | out | 2 | |
| `jump_in_dec_o` | out | 1 | |
| `branch_in_dec_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_decoder.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
