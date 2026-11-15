# Fill in the masked region of `origen_167311`

The file `origen_167311.v` holds a Verilog design whose top module is `origen_167311` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_167311`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_167311.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_167311` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_167311.v`. Only these files are graded.

## Interface of `origen_167311`

| port | dir | width | note |
|---|---|---|---|
| `t0` | in | 32 |  |
| `t1` | in | 32 |  |
| `t2` | in | 32 |  |
| `t3` | in | 32 |  |
| `t4` | in | 32 |  |
| `t5` | in | 32 |  |
| `t6` | in | 32 |  |
| `t7` | in | 32 |  |
| `t8` | in | 32 |  |
| `t9` | in | 32 |  |
| `t10` | in | 32 |  |
| `t11` | in | 32 |  |
| `t12` | in | 32 |  |
| `t13` | in | 32 |  |
| `aluc` | in | 4 |  |
| `c` | in | 6 |  |
| `o` | in | 2 |  |
| `r` | out | 32 | |
| `carry` | out | 1 | |
| `overflow` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_167311.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
