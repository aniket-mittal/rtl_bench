# Fill in the masked region of `fpll_dprio_init`

The file `fpll_dprio_init.v` holds a Verilog design whose top module is `fpll_dprio_init` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `fpll_dprio_init`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-28.darkriscv.

## Rules

- Edit only `fpll_dprio_init.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `fpll_dprio_init` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `fpll_dprio_init.v`. Only these files are graded.

## Interface of `fpll_dprio_init`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset_n` | in | 1 | reset, active low |
| `locked` | in | 1 |  |
| `dprio_address` | out | 6 | |
| `dprio_read` | out | 1 | |
| `dprio_byteen` | out | 2 | |
| `dprio_write` | out | 1 | |
| `dprio_writedata` | out | 16 | |
| `atpgmode` | out | 1 | |
| `mdio_dis` | out | 1 | |
| `scanen` | out | 1 | |
| `ser_shift_load` | out | 1 | |
| `dprio_init_done` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v fpll_dprio_init.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
