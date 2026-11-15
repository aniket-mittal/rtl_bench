# Fill in the masked region of `spi_engine_interconnect`

The file `spi_engine_interconnect.v` holds a Verilog design whose top module is `spi_engine_interconnect` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `spi_engine_interconnect`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-10.analog-hdl.

## Rules

- Edit only `spi_engine_interconnect.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `spi_engine_interconnect` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `spi_engine_interconnect.v`. Only these files are graded.

## Interface of `spi_engine_interconnect`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `resetn` | in | 1 | reset, active low |
| `interconnect_dir` | in | 1 |  |
| `m_cmd_ready` | in | 1 |  |
| `m_sdo_ready` | in | 1 |  |
| `m_sdi_valid` | in | 1 |  |
| `m_sdi_data` | in | 8 |  |
| `m_sync_valid` | in | 1 |  |
| `m_sync` | in | 8 |  |
| `s0_cmd_valid` | in | 1 |  |
| `s0_cmd_data` | in | 16 |  |
| `s0_sdo_valid` | in | 1 |  |
| `s0_sdo_data` | in | 8 |  |
| `s0_sdi_ready` | in | 1 |  |
| `s0_sync_ready` | in | 1 |  |
| `s1_cmd_valid` | in | 1 |  |
| `s1_cmd_data` | in | 16 |  |
| `s1_sdo_valid` | in | 1 |  |
| `s1_sdo_data` | in | 8 |  |
| `s1_sdi_ready` | in | 1 |  |
| `s1_sync_ready` | in | 1 |  |
| `m_cmd_valid` | out | 1 | |
| `m_cmd_data` | out | 16 | |
| `m_sdo_valid` | out | 1 | |
| `m_sdo_data` | out | 8 | |
| `m_sdi_ready` | out | 1 | |
| `m_sync_ready` | out | 1 | |
| `s0_cmd_ready` | out | 1 | |
| `s0_sdo_ready` | out | 1 | |
| `s0_sdi_valid` | out | 1 | |
| `s0_sdi_data` | out | 8 | |
| `s0_sync_valid` | out | 1 | |
| `s0_sync` | out | 8 | |
| `s1_cmd_ready` | out | 1 | |
| `s1_sdo_ready` | out | 1 | |
| `s1_sdi_valid` | out | 1 | |
| `s1_sdi_data` | out | 8 | |
| `s1_sync_valid` | out | 1 | |
| `s1_sync` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v spi_engine_interconnect.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
