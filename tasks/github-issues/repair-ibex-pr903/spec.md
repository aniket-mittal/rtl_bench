# Fix GitHub issue #902 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `4b01580a7bd8`), trimmed to the files needed to elaborate the module `ibex_pmp`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** Incorrect pmp NA4/NAPOT address matching

**Description:**

#875 seems to have introduced an issue with `NA4/NAPOT` address matching modes - the scenario is as follows.

In my test, `csr_pmp_addr[3]` is `0x8000_3f54` with its corresponding configuration bits `csr_pmp_cfg[3]` set to `{0, PMP_MODE_NA4, 0, 1, 1}`, and the core requests an instruction fetch from `pmp_req_addr_i[0] = 0x8000_3f54`. Note that since we are using NA4 mode, `region_start_addr[3] = 0x8000_3f54` and `region_addr_mask[3] = 0xffff_ffff`. We are also using a granularity of 0.

With this setup, we should expect that the requested instruction fetch should match `pmpaddr3` but then then fail due to a fetch error since the corresponding access bit is disabled.

However, `region_match_low[0][3]` goes high as expected since
`pmp_req_addr_i[0][33:2] >= region_start_addr[3][33:2]`,
but `region_match_high[0][3]` stays low since the check
`pmp_req_addr_i[0][33:2] < csr_pmp_addr[3][33:2]` will fail due to lack of equality checking - this causes an altogether mismatch with this PMP region.

I think we still need to include equality checking to cover NA4 and NAPOT matching (as the error I describe above can also easily occur in NAPOT mode with any granularity), but these equality checks should only be enabled when we are in one of those two modes.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_pmp`.

- Do not change the ports of `ibex_pmp` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_pmp.v` | `rtl/ibex_pmp.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `ibex_pmp` are the same as upstream.

## Grading

Your `ibex_pmp` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_pmp.v`. Only these files are graded.

## Interface of `ibex_pmp`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `csr_pmp_cfg_i` | in | 24 |  |
| `csr_pmp_addr_i` | in | 136 |  |
| `priv_mode_i` | in | 4 |  |
| `pmp_req_addr_i` | in | 68 |  |
| `pmp_req_type_i` | in | 4 |  |
| `pmp_req_err_o` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_pmp.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
