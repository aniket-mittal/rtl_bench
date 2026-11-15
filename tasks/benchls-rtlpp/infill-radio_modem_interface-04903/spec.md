# Fill in the masked region of `rtlpp_04903`

The file `rtlpp_04903.v` holds a Verilog design whose top module is `rtlpp_04903` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_04903`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_04903.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_04903` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_04903.v`. Only these files are graded.

## Interface of `rtlpp_04903`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `iocs` | in | 1 |  |
| `ioaddr` | in | 3 |  |
| `din` | in | 16 |  |
| `iowr` | in | 1 |  |
| `iord` | in | 1 |  |
| `rdix` | in | 18 |  |
| `rdiy` | in | 18 |  |
| `riv` | in | 1 |  |
| `rst` | in | 1 | reset, active high |
| `dout` | out | 16 | |
| `pttout` | out | 1 | |
| `x` | out | 16 | |
| `y` | out | 16 | |
| `xyv` | out | 1 | |
| `m` | out | 16 | |
| `p` | out | 12 | |
| `mpv` | out | 1 | |
| `start` | out | 1 | |
| `sync` | out | 1 | |
| `dcd` | out | 1 | |
| `fcd` | out | 1 | |
| `xmtout` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_04903.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
