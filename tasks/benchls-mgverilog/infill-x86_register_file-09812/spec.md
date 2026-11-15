# Fill in the masked region of `mg_09812`

The file `mg_09812.v` holds a Verilog design whose top module is `mg_09812` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_09812`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_09812.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_09812` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_09812.v`. Only these files are graded.

## Interface of `mg_09812`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 32 |  |
| `wr` | in | 1 |  |
| `wrfl` | in | 1 |  |
| `wrhi` | in | 1 |  |
| `rst` | in | 1 | reset, active high |
| `addr_a` | in | 4 |  |
| `addr_b` | in | 4 |  |
| `addr_c` | in | 4 |  |
| `addr_d` | in | 4 |  |
| `addr_s` | in | 2 |  |
| `iflags` | in | 9 |  |
| `word_op` | in | 1 |  |
| `a_byte` | in | 1 |  |
| `b_byte` | in | 1 |  |
| `c_byte` | in | 1 |  |
| `wr_ip0` | in | 1 |  |
| `a` | out | 16 | |
| `b` | out | 16 | |
| `c` | out | 16 | |
| `cs` | out | 16 | |
| `ip` | out | 16 | |
| `s` | out | 16 | |
| `flags` | out | 9 | |
| `cx_zero` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_09812.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
