# Fill in the masked region of `mg_02387`

The file `mg_02387.v` holds a Verilog design whose top module is `mg_02387` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_02387`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_02387.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_02387` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_02387.v`. Only these files are graded.

## Interface of `mg_02387`

| port | dir | width | note |
|---|---|---|---|
| `enable` | in | 1 |  |
| `inverse` | in | 1 |  |
| `i_0` | in | 16 |  |
| `i_1` | in | 16 |  |
| `i_2` | in | 16 |  |
| `i_3` | in | 16 |  |
| `i_4` | in | 16 |  |
| `i_5` | in | 16 |  |
| `i_6` | in | 16 |  |
| `i_7` | in | 16 |  |
| `o_0` | out | 16 | |
| `o_1` | out | 16 | |
| `o_2` | out | 16 | |
| `o_3` | out | 16 | |
| `o_4` | out | 16 | |
| `o_5` | out | 16 | |
| `o_6` | out | 16 | |
| `o_7` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_02387.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
