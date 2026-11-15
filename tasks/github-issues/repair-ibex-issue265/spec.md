# Fix GitHub issue #265 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `36db1041605c`), trimmed to the files needed to elaborate the module `ibex_prefetch_buffer`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Combinational paths between RVALID_I/ERR_I and REQ_O

**Description:**

Description: Combinational paths exist from data_rvalid_i and data_err_i to data_req_o and from instr_rvalid_i to instr_req_o. Such paths can potentially limit the achievable performance in systems that do not pipeline these signals as they would introduce a path from a slave to the master (i.e. Ibex) and then back to the slave. For details see the attached pdf.

Git tag: 242147239551be9fb8523fbc6f26f22b898d8d93 (august 26   2019)

[IBEX0.pdf](https://github.com/lowRISC/ibex/files/3546206/IBEX0.pdf)

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_prefetch_buffer`.

- Do not change the ports of `ibex_prefetch_buffer` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_fetch_fifo.v` | `rtl/ibex_fetch_fifo.sv` |
| `src/ibex_prefetch_buffer.v` | `rtl/ibex_prefetch_buffer.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_prefetch_buffer` are the same as upstream.

## Grading

Your `ibex_prefetch_buffer` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_fetch_fifo.v`, `src/ibex_prefetch_buffer.v`. Only these files are graded.

## Interface of `ibex_prefetch_buffer`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `req_i` | in | 1 |  |
| `branch_i` | in | 1 |  |
| `addr_i` | in | 32 |  |
| `ready_i` | in | 1 |  |
| `instr_gnt_i` | in | 1 |  |
| `instr_rdata_i` | in | 32 |  |
| `instr_err_i` | in | 1 |  |
| `instr_pmp_err_i` | in | 1 |  |
| `instr_rvalid_i` | in | 1 |  |
| `valid_o` | out | 1 | |
| `rdata_o` | out | 32 | |
| `addr_o` | out | 32 | |
| `err_o` | out | 1 | |
| `instr_req_o` | out | 1 | |
| `instr_addr_o` | out | 32 | |
| `busy_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_fetch_fifo.v src/ibex_prefetch_buffer.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
