# Fix GitHub issue #12382 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `b8f9e0e93a9a`), trimmed to the files needed to elaborate the module `spid_readbuffer`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [spi_device] Read Buffer raises watermark event while not in Active

**Description:**

Read buffer raises the watermark event even if the address points to the mailbox buffer.

It is due to that the logic does not refer `active` signal while raising the event but only uses the signal when latching the event. So that `watermark_crossed` is not set but `event_watermark_o` becomes high.

Found in pre_dv tests.

CC: @weicaiyang

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `spid_readbuffer`.

- Do not change the ports of `spid_readbuffer` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/spid_readbuffer.v` | `hw/ip/spi_device/rtl/spid_readbuffer.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `spid_readbuffer` are the same as upstream.

## Grading

Your `spid_readbuffer` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/spid_readbuffer.v`. Only these files are graded.

## Interface of `spid_readbuffer`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `sys_rst_ni` | in | 1 |  |
| `current_address_i` | in | 32 |  |
| `threshold_i` | in | 10 |  |
| `sfdp_hit_i` | in | 1 |  |
| `mailbox_hit_i` | in | 1 |  |
| `mailbox_en_i` | in | 1 |  |
| `start_i` | in | 1 |  |
| `event_watermark_o` | out | 1 | |
| `event_flip_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/spid_readbuffer.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
