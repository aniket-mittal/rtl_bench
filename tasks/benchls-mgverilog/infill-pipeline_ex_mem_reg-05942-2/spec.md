# Fill in the masked region of `mg_05942`

The file `mg_05942.v` holds a Verilog design whose top module is `mg_05942` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_05942`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_05942.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_05942` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_05942.v`. Only these files are graded.

## Interface of `mg_05942`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `stall` | in | 1 |  |
| `ex_aluresult` | in | 32 |  |
| `ex_td` | in | 5 |  |
| `ex_d2` | in | 32 |  |
| `ex_WREG` | in | 1 |  |
| `ex_WMEM` | in | 1 |  |
| `ex_LW` | in | 1 |  |
| `ex_instr` | in | 32 |  |
| `ex_pc` | in | 32 |  |
| `me_aluresult` | out | 32 | |
| `me_td` | out | 5 | |
| `me_d2` | out | 32 | |
| `me_WREG` | out | 1 | |
| `me_WMEM` | out | 1 | |
| `me_LW` | out | 1 | |
| `me_instr` | out | 32 | |
| `me_pc` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_05942.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
