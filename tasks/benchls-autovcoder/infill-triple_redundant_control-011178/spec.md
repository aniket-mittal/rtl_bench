# Fill in the masked region of `autovcoder_011178`

The file `autovcoder_011178.v` holds a Verilog design whose top module is `autovcoder_011178` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_011178`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_011178.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_011178` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_011178.v`. Only these files are graded.

## Interface of `autovcoder_011178`

| port | dir | width | note |
|---|---|---|---|
| `clk_sys` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `change` | in | 1 |  |
| `pluse_start1` | in | 1 |  |
| `pluse_start2` | in | 1 |  |
| `off_test1` | in | 1 |  |
| `off_test2` | in | 1 |  |
| `dump_start1` | in | 1 |  |
| `dump_start2` | in | 1 |  |
| `phase_ctr1` | in | 1 |  |
| `phase_ctr2` | in | 1 |  |
| `reset_out1` | in | 1 |  |
| `reset_out2` | in | 1 |  |
| `dumpoff_ctr1` | in | 1 |  |
| `dumpoff_ctr2` | in | 1 |  |
| `tetw_pluse1` | in | 1 |  |
| `tetw_pluse2` | in | 1 |  |
| `turn_delay1` | in | 1 |  |
| `turn_delay2` | in | 1 |  |
| `pluse_start` | out | 1 | |
| `off_test` | out | 1 | |
| `dump_start` | out | 1 | |
| `phase_ctr` | out | 1 | |
| `reset_out` | out | 1 | |
| `dumpoff_ctr` | out | 1 | |
| `tetw_pluse` | out | 1 | |
| `turn_delay` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_011178.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
