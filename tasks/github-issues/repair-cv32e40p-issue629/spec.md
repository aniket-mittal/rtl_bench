# Fix GitHub issue #629 in `openhwgroup/cv32e40p`

This task comes from a real bug report against the open-source repository `openhwgroup/cv32e40p`. You get the repository's RTL as it was when the bug was reported (commit `fcd59685681b`), trimmed to the files needed to elaborate the module `cv32e40p_decoder`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Make illegal imm!=0 of  Reg + Reg PULP instructions

**Description:**

PULP instructions that do not use the immediate field as they are reg+reg instruction, do not often check whether the immediate is hardwired to 0 (as the documentation specifies) or not

An example: cv.addNr

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `cv32e40p_decoder`.

- Do not change the ports of `cv32e40p_decoder` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/cv32e40p_decoder.v` | `rtl/cv32e40p_decoder.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `cv32e40p_decoder` are the same as upstream.

## Grading

Your `cv32e40p_decoder` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/cv32e40p_decoder.v`. Only these files are graded.

## Interface of `cv32e40p_decoder`

| port | dir | width | note |
|---|---|---|---|
| `deassert_we_i` | in | 1 |  |
| `instr_rdata_i` | in | 32 |  |
| `illegal_c_insn_i` | in | 1 |  |
| `frm_i` | in | 3 |  |
| `current_priv_lvl_i` | in | 2 |  |
| `debug_mode_i` | in | 1 |  |
| `debug_wfi_no_sleep_i` | in | 1 |  |
| `mcounteren_i` | in | 32 |  |
| `illegal_insn_o` | out | 1 | |
| `ebrk_insn_o` | out | 1 | |
| `mret_insn_o` | out | 1 | |
| `uret_insn_o` | out | 1 | |
| `dret_insn_o` | out | 1 | |
| `mret_dec_o` | out | 1 | |
| `uret_dec_o` | out | 1 | |
| `dret_dec_o` | out | 1 | |
| `ecall_insn_o` | out | 1 | |
| `wfi_o` | out | 1 | |
| `fencei_insn_o` | out | 1 | |
| `rega_used_o` | out | 1 | |
| `regb_used_o` | out | 1 | |
| `regc_used_o` | out | 1 | |
| `reg_fp_a_o` | out | 1 | |
| `reg_fp_b_o` | out | 1 | |
| `reg_fp_c_o` | out | 1 | |
| `reg_fp_d_o` | out | 1 | |
| `bmask_a_mux_o` | out | 1 | |
| `bmask_b_mux_o` | out | 2 | |
| `alu_bmask_a_mux_sel_o` | out | 1 | |
| `alu_bmask_b_mux_sel_o` | out | 1 | |
| `alu_en_o` | out | 1 | |
| `alu_operator_o` | out | 7 | |
| `alu_op_a_mux_sel_o` | out | 3 | |
| `alu_op_b_mux_sel_o` | out | 3 | |
| `alu_op_c_mux_sel_o` | out | 2 | |
| `alu_vec_mode_o` | out | 2 | |
| `scalar_replication_o` | out | 1 | |
| `scalar_replication_c_o` | out | 1 | |
| `imm_a_mux_sel_o` | out | 1 | |
| `imm_b_mux_sel_o` | out | 4 | |
| `regc_mux_o` | out | 2 | |
| `is_clpx_o` | out | 1 | |
| `is_subrot_o` | out | 1 | |
| `mult_operator_o` | out | 3 | |
| `mult_int_en_o` | out | 1 | |
| `mult_dot_en_o` | out | 1 | |
| `mult_imm_mux_o` | out | 1 | |
| `mult_sel_subword_o` | out | 1 | |
| `mult_signed_mode_o` | out | 2 | |
| `mult_dot_signed_o` | out | 2 | |
| `fpu_dst_fmt_o` | out | 3 | |
| `fpu_src_fmt_o` | out | 3 | |
| `fpu_int_fmt_o` | out | 2 | |
| `apu_en_o` | out | 1 | |
| `apu_op_o` | out | 6 | |
| `apu_lat_o` | out | 2 | |
| `fp_rnd_mode_o` | out | 3 | |
| `regfile_mem_we_o` | out | 1 | |
| `regfile_alu_we_o` | out | 1 | |
| `regfile_alu_we_dec_o` | out | 1 | |
| `regfile_alu_waddr_sel_o` | out | 1 | |
| `csr_access_o` | out | 1 | |
| `csr_status_o` | out | 1 | |
| `csr_op_o` | out | 2 | |
| `data_req_o` | out | 1 | |
| `data_we_o` | out | 1 | |
| `prepost_useincr_o` | out | 1 | |
| `data_type_o` | out | 2 | |
| `data_sign_extension_o` | out | 2 | |
| `data_reg_offset_o` | out | 2 | |
| `data_load_event_o` | out | 1 | |
| `atop_o` | out | 6 | |
| `hwlp_we_o` | out | 3 | |
| `hwlp_target_mux_sel_o` | out | 1 | |
| `hwlp_start_mux_sel_o` | out | 1 | |
| `hwlp_cnt_mux_sel_o` | out | 1 | |
| `ctrl_transfer_insn_in_dec_o` | out | 2 | |
| `ctrl_transfer_insn_in_id_o` | out | 2 | |
| `ctrl_transfer_target_mux_sel_o` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/cv32e40p_decoder.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
