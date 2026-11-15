# Fix GitHub issue #14700 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `8b517f2b759f`), trimmed to the files needed to elaborate the module `prim_clock_meas`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [dv/prim] Fix prim_clock_meas to improve coverage

**Description:**

There are a couple conditions that cause low coverage for this module and drags the full clkmgr coverage down.

- In the code for setting cnt_ref (line156) cnt_ref is always 0. It is possible to specialize the code for RefCnt == 1?
- In the code incrementing cnt (line 170) the term "cnt_en" in "end else if (cnt_en && cnt_ovfl) begin" is unnecessary.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `prim_clock_meas`.

- Do not change the ports of `prim_clock_meas` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/prim_clock_meas.v` | `hw/ip/prim/rtl/prim_clock_meas.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/prim_cdc_rand_delay.v` | `hw/ip/prim/rtl/prim_cdc_rand_delay.sv` |
| `src/prim_clock_timeout.v` | `hw/ip/prim/rtl/prim_clock_timeout.sv` |
| `src/prim_flop.v` | (stand-in for `prim_flop`, see below) |
| `src/prim_flop_2sync.v` | `hw/ip/prim/rtl/prim_flop_2sync.sv` |
| `src/prim_pulse_sync.v` | `hw/ip/prim/rtl/prim_pulse_sync.sv` |
| `src/prim_sync_reqack.v` | `hw/ip/prim/rtl/prim_sync_reqack.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `prim_clock_meas` are the same as upstream.
Modules derived from a `prim_*` stand-in come from OpenTitan's generic implementation (`prim_generic_*`) with the module renamed.

## Grading

Your `prim_clock_meas` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/prim_clock_meas.v`. Only these files are graded.
Read-only (restored before grading): `src/prim_cdc_rand_delay.v`, `src/prim_clock_timeout.v`, `src/prim_flop.v`, `src/prim_flop_2sync.v`, `src/prim_pulse_sync.v`, `src/prim_sync_reqack.v`.

## Interface of `prim_clock_meas`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `clk_ref_i` | in | 1 |  |
| `rst_ref_ni` | in | 1 |  |
| `en_i` | in | 1 |  |
| `max_cnt` | in | 4 |  |
| `min_cnt` | in | 4 |  |
| `valid_o` | out | 1 | |
| `fast_o` | out | 1 | |
| `slow_o` | out | 1 | |
| `timeout_clk_ref_o` | out | 1 | |
| `ref_timeout_clk_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/prim_clock_meas.v src/prim_cdc_rand_delay.v src/prim_clock_timeout.v src/prim_flop.v src/prim_flop_2sync.v src/prim_pulse_sync.v src/prim_sync_reqack.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
