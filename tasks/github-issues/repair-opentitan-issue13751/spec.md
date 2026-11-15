# Fix GitHub issue #13751 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `737e1a4407f5`), trimmed to the files needed to elaborate the module `flash_mp`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [flash_ctrl] info partitoin overflow is not handled gracefully

**Description:**

Run #13750
Test sends program FlashPartInfo with page address 10 (which is out of range) @2787751.5ns
@27877619,
tb.dut.u_flash_mp.page_cfg becomes 'x' due to index of info_page_cfgs_i is out of range and
tb.dut.flash_phy_req.req and tb.dut.flash_phy_req.prog become x.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `flash_mp`.

- Do not change the ports of `flash_mp` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/flash_mp.v` | `hw/ip/flash_ctrl/rtl/flash_mp.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/flash_mp_data_region_sel.v` | `hw/ip/flash_ctrl/rtl/flash_mp_data_region_sel.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `flash_mp` are the same as upstream.

## Grading

Your `flash_mp` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/flash_mp.v`. Only these files are graded.
Read-only (restored before grading): `src/flash_mp_data_region_sel.v`.

## Interface of `flash_mp`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `flash_disable_i` | in | 4 |  |
| `if_sel_i` | in | 2 |  |
| `region_cfgs_i` | in | 423 |  |
| `bank_cfgs_i` | in | 2 |  |
| `info_page_cfgs_i` | in | 1680 |  |
| `erase_suspend_i` | in | 1 |  |
| `req_i` | in | 1 |  |
| `phase_i` | in | 2 |  |
| `req_addr_i` | in | 9 |  |
| `req_part_i` | in | 1 |  |
| `info_sel_i` | in | 2 |  |
| `addr_ovfl_i` | in | 1 |  |
| `rd_i` | in | 1 |  |
| `prog_i` | in | 1 |  |
| `pg_erase_i` | in | 1 |  |
| `bk_erase_i` | in | 1 |  |
| `rd_done_i` | in | 1 |  |
| `prog_done_i` | in | 1 |  |
| `erase_done_i` | in | 1 |  |
| `erase_suspend_done_o` | out | 1 | |
| `rd_done_o` | out | 1 | |
| `prog_done_o` | out | 1 | |
| `erase_done_o` | out | 1 | |
| `error_o` | out | 1 | |
| `req_o` | out | 1 | |
| `rd_o` | out | 1 | |
| `prog_o` | out | 1 | |
| `scramble_en_o` | out | 1 | |
| `ecc_en_o` | out | 1 | |
| `he_en_o` | out | 1 | |
| `pg_erase_o` | out | 1 | |
| `bk_erase_o` | out | 1 | |
| `erase_suspend_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/flash_mp.v src/flash_mp_data_region_sel.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
