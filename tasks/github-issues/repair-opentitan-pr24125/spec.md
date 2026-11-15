# Fix GitHub issue #24119 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `42fc4a5d9841`), trimmed to the files needed to elaborate the module `prim_count`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [ECO] prim_count.sv CDC

**Description:**

### Description

Reported by: @meisnere

`sw_alert_handler_ping_ok` test fails post synthesis.

The root cause seems to point to glitches on `err_o`. This is a CDC error as it takes time for the sum to converge here:

https://github.com/lowRISC/opentitan/blob/e439226b6c5314be12ccf5cc055f2d4b8149d0ab/hw/ip/prim/rtl/prim_count.sv#L140-L143

CC @andreaskurth @vogelpi

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `prim_count`.

- Do not change the ports of `prim_count` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/prim_count.v` | `hw/ip/prim/rtl/prim_count.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/prim_flop.v` | (stand-in for `prim_flop`, see below) |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `prim_count` are the same as upstream.
Modules derived from a `prim_*` stand-in come from OpenTitan's generic implementation (`prim_generic_*`) with the module renamed.

## Grading

Your `prim_count` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/prim_count.v`. Only these files are graded.
Read-only (restored before grading): `src/prim_flop.v`.

## Interface of `prim_count`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `clr_i` | in | 1 |  |
| `set_i` | in | 1 |  |
| `set_cnt_i` | in | 2 |  |
| `incr_en_i` | in | 1 |  |
| `decr_en_i` | in | 1 |  |
| `step_i` | in | 2 |  |
| `commit_i` | in | 1 |  |
| `cnt_o` | out | 2 | |
| `cnt_after_commit_o` | out | 2 | |
| `err_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/prim_count.v src/prim_flop.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
