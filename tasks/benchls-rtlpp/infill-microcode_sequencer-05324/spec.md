# Fill in the masked region of `rtlpp_05324`

The file `rtlpp_05324.v` holds a Verilog design whose top module is `rtlpp_05324` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_05324`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_05324.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_05324` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_05324.v`. Only these files are graded.

## Interface of `rtlpp_05324`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `state_alu` | in | 1 |  |
| `state_fetch` | in | 1 |  |
| `state_write` | in | 1 |  |
| `funct` | in | 4 |  |
| `ir` | in | 49 |  |
| `destspc` | in | 1 |  |
| `dn` | in | 1 |  |
| `dp` | in | 1 |  |
| `dr` | in | 1 |  |
| `irdisp` | in | 1 |  |
| `irjump` | in | 1 |  |
| `jcond` | in | 1 |  |
| `nop11` | in | 1 |  |
| `srcspc` | in | 1 |  |
| `srcspcpop` | in | 1 |  |
| `trap` | in | 1 |  |
| `reset` | in | 1 | reset, active high |
| `iwrited` | out | 1 | |
| `n` | out | 1 | |
| `nop` | out | 1 | |
| `nopa` | out | 1 | |
| `pcs0` | out | 1 | |
| `pcs1` | out | 1 | |
| `spcdrive` | out | 1 | |
| `spcenb` | out | 1 | |
| `spcnt` | out | 1 | |
| `spop` | out | 1 | |
| `spush` | out | 1 | |
| `srcspcpopreal` | out | 1 | |
| `srp` | out | 1 | |
| `swp` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_05324.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
