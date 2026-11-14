# Fix GitHub issue #228 in `YosysHQ/picorv32`

This task comes from a real bug report against the open-source repository `YosysHQ/picorv32`. You get the repository's RTL as it was when the bug was reported (commit `f00a88c36eaa`), trimmed to the files needed to elaborate the module `picorv32`.

## Bug report

**Title:** Bug report: fence instruction raises instruction trap

**Description:**

Hi there!

The `fence` instruction is part of the base rv32i ISA and is incorrectly decoded in picorv32 since it systematically raises an instruction trap.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `picorv32`.

- Do not change the ports of `picorv32` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/picorv32.v` | `picorv32.v` |

Module files are under `rtl/src/`.

## Grading

Your `picorv32` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/picorv32.v`. Only these files are graded.

## Interface of `picorv32`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `resetn` | in | 1 | reset, active low |
| `mem_ready` | in | 1 |  |
| `mem_rdata` | in | 32 |  |
| `pcpi_wr` | in | 1 |  |
| `pcpi_rd` | in | 32 |  |
| `pcpi_wait` | in | 1 |  |
| `pcpi_ready` | in | 1 |  |
| `irq` | in | 32 |  |
| `trap` | out | 1 | |
| `mem_valid` | out | 1 | |
| `mem_instr` | out | 1 | |
| `mem_addr` | out | 32 | |
| `mem_wdata` | out | 32 | |
| `mem_wstrb` | out | 4 | |
| `mem_la_read` | out | 1 | |
| `mem_la_write` | out | 1 | |
| `mem_la_addr` | out | 32 | |
| `mem_la_wdata` | out | 32 | |
| `mem_la_wstrb` | out | 4 | |
| `pcpi_valid` | out | 1 | |
| `pcpi_insn` | out | 32 | |
| `pcpi_rs1` | out | 32 | |
| `pcpi_rs2` | out | 32 | |
| `eoi` | out | 32 | |
| `trace_valid` | out | 1 | |
| `trace_data` | out | 36 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/picorv32.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
