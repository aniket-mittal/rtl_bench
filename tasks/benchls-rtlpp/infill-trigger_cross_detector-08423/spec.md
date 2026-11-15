# Fill in the masked region of `rtlpp_08423`

The file `rtlpp_08423.v` holds a Verilog design whose top module is `rtlpp_08423` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_08423`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_08423.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_08423` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_08423.v`. Only these files are graded.

## Interface of `rtlpp_08423`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `vc` | in | 1 |  |
| `sc` | in | 2 |  |
| `vctop` | in | 1 |  |
| `sctop` | in | 2 |  |
| `vcbot` | in | 1 |  |
| `scbot` | in | 2 |  |
| `va` | in | 1 |  |
| `sa` | in | 2 |  |
| `vatop` | in | 1 |  |
| `satop` | in | 2 |  |
| `vabot` | in | 1 |  |
| `sabot` | in | 2 |  |
| `trig_stop` | in | 1 |  |
| `vcr` | out | 1 | |
| `varr` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_08423.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
