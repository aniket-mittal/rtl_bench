# Fix GitHub issue #46 in `openrisc/mor1kx`

This task comes from a real bug report against the open-source repository `openrisc/mor1kx`. You get the repository's RTL as it was when the bug was reported (commit `75b928a2287c`), trimmed to the files needed to elaborate the module `mor1kx_pcu`.

## Bug report

**Title:** PCU: misses events

**Description:**

The PCU will at most increment the counters by one in a cycle. If there is more than one event enabled for a register, they are not counted. The workaround is to enable at most one event class per counter.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `mor1kx_pcu`.

- Do not change the ports of `mor1kx_pcu` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/mor1kx_pcu.v` | `rtl/verilog/mor1kx_pcu.v` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `mor1kx-defines.v` | `rtl/verilog/mor1kx-defines.v` |
| `mor1kx-sprs.v` | `rtl/verilog/mor1kx-sprs.v` |

Module files are under `rtl/src/`.
Files that other files `include` sit at their include path under `rtl/`.

## Grading

Your `mor1kx_pcu` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/mor1kx_pcu.v`. Only these files are graded.
Read-only (restored before grading): `mor1kx-defines.v`, `mor1kx-sprs.v`.

## Interface of `mor1kx_pcu`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `spr_access_i` | in | 1 |  |
| `spr_we_i` | in | 1 |  |
| `spr_re_i` | in | 1 |  |
| `spr_addr_i` | in | 16 |  |
| `spr_dat_i` | in | 32 |  |
| `spr_sys_mode_i` | in | 1 |  |
| `pcu_event_load_i` | in | 1 |  |
| `pcu_event_store_i` | in | 1 |  |
| `pcu_event_ifetch_i` | in | 1 |  |
| `pcu_event_dcache_miss_i` | in | 1 |  |
| `pcu_event_icache_miss_i` | in | 1 |  |
| `pcu_event_ifetch_stall_i` | in | 1 |  |
| `pcu_event_lsu_stall_i` | in | 1 |  |
| `pcu_event_brn_stall_i` | in | 1 |  |
| `pcu_event_dtlb_miss_i` | in | 1 |  |
| `pcu_event_itlb_miss_i` | in | 1 |  |
| `pcu_event_datadep_stall_i` | in | 1 |  |
| `spr_bus_ack` | out | 1 | |
| `spr_dat_o` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/mor1kx_pcu.v mor1kx-defines.v mor1kx-sprs.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
