# Fill in the masked region of `jesd204_lmfc`

The file `jesd204_lmfc.v` holds a Verilog design whose top module is `jesd204_lmfc` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `jesd204_lmfc`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-10.analog-hdl.

## Rules

- Edit only `jesd204_lmfc.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `jesd204_lmfc` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `jesd204_lmfc.v`. Only these files are graded.

## Interface of `jesd204_lmfc`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `sysref` | in | 1 |  |
| `cfg_octets_per_multiframe` | in | 10 |  |
| `cfg_beats_per_multiframe` | in | 8 |  |
| `cfg_lmfc_offset` | in | 8 |  |
| `cfg_sysref_oneshot` | in | 1 |  |
| `cfg_sysref_disable` | in | 1 |  |
| `lmfc_edge` | out | 1 | |
| `lmfc_clk` | out | 1 | |
| `lmfc_counter` | out | 8 | |
| `lmc_edge` | out | 1 | |
| `lmc_quarter_edge` | out | 1 | |
| `eoemb` | out | 1 | |
| `sysref_edge` | out | 1 | |
| `sysref_alignment_error` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v jesd204_lmfc.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
