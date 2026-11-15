# Fill in the masked region of `aud_mix_top`

The file `aud_mix_top.v` holds a Verilog design whose top module is `aud_mix_top` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `aud_mix_top`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-28.darkriscv.

## Rules

- Edit only `aud_mix_top.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `aud_mix_top` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `aud_mix_top.v`. Only these files are graded.

## Interface of `aud_mix_top`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `ce` | in | 1 |  |
| `att` | in | 5 |  |
| `mix` | in | 2 |  |
| `core_audio` | in | 16 |  |
| `linux_audio` | in | 16 |  |
| `pre_in` | in | 16 |  |
| `pre_out` | out | 16 | |
| `out` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v aud_mix_top.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
