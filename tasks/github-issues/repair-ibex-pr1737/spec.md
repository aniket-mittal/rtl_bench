# Fix GitHub issue #1736 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `6dc068377363`), trimmed to the files needed to elaborate the module `ibex_pmp`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [rtl,bug] Ibex allows execution in no-match case while MML=1

**Description:**

Header explains the issue. According to Smepmp v1.0 in a no-match case we should block execution in machine mode. However, we are not currently doing that. It's a tricky thing to recreate it in our master branch for now but if you add #1695 and #1735 to master and run: `make ITERATIONS=1 TEST=riscv_pmp_full_random_test SEED=14910` you should be able to re-create the error.

> estimate 4

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
| `csr_pmp_cfg_i` | in | 24 |  |
| `csr_pmp_addr_i` | in | 136 |  |
| `csr_pmp_mseccfg_i` | in | 3 |  |
| `priv_mode_i` | in | 4 |  |
| `pmp_req_addr_i` | in | 68 |  |
| `pmp_req_type_i` | in | 4 |  |
| `pmp_req_err_o` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_pmp.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
