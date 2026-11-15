# Fix GitHub issue #1178 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `1f3b462b9477`), trimmed to the files needed to elaborate the module `ibex_pmp`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** PMP NAPOT masks are incorrect when the region address spans the entire granule

**Description:**

The address masking logic in [`ibex_pmp.sv`](https://github.com/lowRISC/ibex/blob/master/rtl/ibex_pmp.sv) always considers the lowest bit of the granule of the PMP address configuration register (i.e. `csr_pmp_addr_i[r][PMPGranularity+2]`) not to be part of the range address in NAPOT mode. This is correct when `PMPGranularity == 0`, since then NA4 mode must be selected if the range address uses all bits, but it is incorrect when `PMPGranularity > 0`, since then it is legal in NAPOT mode to have a range address span the entire granule, with the next-lowest bit (i.e. `csr_pmp_addr_i[r][PMPGranularity+1]`) cleared to indicate that all higher bits are part of the range address.

For instance with `PMPGranularity == 28`, the granule covers bits `csr_pmp_addr_i[r][33:30]`, yet bit `csr_pmp_addr_i[r][29]` must also be considered to check whether a range address spans all 4 bits of the granule. A range address of `csr_pmp_addr_i[r] == 34'b00_0101_1111_1111_1111_1111_1111_1111_1111` could be used to specify a range from 1 GiB to 2 GiB for example and in that case the region address mask should be `region_addr_mask [r] == 4'b1111` (i.e. the entire granule). However, since only bits `csr_pmp_addr_i[r][33:30]` are currently considered when generating the mask, it is incorrectly set to `region_addr_mask [r] == 4'b1100`.

The specification states that bits `G-2:0` (i.e. bits `csr_pmp_addr_i[r][PMPGranularity:0]`) are implicitly set to all ones and hence do not need to be considered, but that implies that bit `G-1` (i.e. `csr_pmp_addr_i[r][PMPGranularity+1]`) is still used to specify the range:

> When G≥1, the NA4 mode is not selectable.  When G≥2 and pmpcfgi.A[1] is set, i.e. the mode is NAPOT, then bits pmpaddri[G-2:0] read as all ones.
> -- <cite>[Volume II: RISC-V Privileged Architectures V20190608-Priv-MSU-Ratified, Sect. 3.6.1](https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMFDQC-and-Priv-v1.11/riscv-privileged-20190608.pdf)</cite>

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
