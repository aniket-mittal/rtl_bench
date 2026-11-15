# Fill in the masked region of `autovcoder_122921`

The file `autovcoder_122921.v` holds a Verilog design whose top module is `autovcoder_122921` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_122921`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_122921.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_122921` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_122921.v`. Only these files are graded.

## Interface of `autovcoder_122921`

| port | dir | width | note |
|---|---|---|---|
| `gclk_40m` | in | 1 | clock, rising edge |
| `l0` | in | 1 |  |
| `l1` | in | 1 |  |
| `l2a` | in | 1 |  |
| `l2r` | in | 1 |  |
| `l1out_c` | in | 1 |  |
| `rdocmd_c` | in | 1 |  |
| `abortcmd_c` | in | 1 |  |
| `evcntres` | in | 1 |  |
| `bcntres` | in | 1 |  |
| `trigcnt_clr` | in | 1 |  |
| `reset` | in | 1 | reset, active high |
| `l1out` | out | 1 | |
| `rdocmd` | out | 1 | |
| `abortcmd` | out | 1 | |
| `l0_cnt` | out | 32 | |
| `l1_cnt` | out | 32 | |
| `l2a_cnt` | out | 32 | |
| `l2r_cnt` | out | 32 | |
| `l1out_cnt` | out | 32 | |
| `rdocmd_cnt` | out | 32 | |
| `abortcmd_cnt` | out | 32 | |
| `bunch_cnt` | out | 12 | |
| `event_cnt` | out | 24 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_122921.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
