# Fill in the masked region of `mg_08756`

The file `mg_08756.v` holds a Verilog design whose top module is `mg_08756` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_08756`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_08756.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_08756` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_08756.v`. Only these files are graded.

## Interface of `mg_08756`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `ID_stall` | in | 1 |  |
| `ID_flush` | in | 1 |  |
| `EX_stall` | in | 1 |  |
| `ID_reg_dst` | in | 5 |  |
| `ID_data_a` | in | 32 |  |
| `ID_data_b` | in | 32 |  |
| `ID_data_c` | in | 32 |  |
| `ID_aluc` | in | 21 |  |
| `ID_sign` | in | 1 |  |
| `ID_memread` | in | 1 |  |
| `ID_memwrite` | in | 1 |  |
| `ID_memaddr` | in | 32 |  |
| `ID_load_op` | in | 9 |  |
| `ID_store_op` | in | 6 |  |
| `ID_memtoreg` | in | 1 |  |
| `ID_regwrite` | in | 1 |  |
| `EX_data_a` | out | 32 | |
| `EX_data_b` | out | 32 | |
| `EX_data_c` | out | 32 | |
| `EX_aluc` | out | 21 | |
| `EX_sign` | out | 1 | |
| `EX_memread` | out | 1 | |
| `EX_memwrite` | out | 1 | |
| `EX_memaddr` | out | 32 | |
| `EX_load_op` | out | 9 | |
| `EX_store_op` | out | 6 | |
| `EX_memtoreg` | out | 1 | |
| `EX_regwrite` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_08756.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
