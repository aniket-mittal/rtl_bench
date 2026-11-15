# Fill in the masked region of `mg_05965`

The file `mg_05965.v` holds a Verilog design whose top module is `mg_05965` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_05965`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_05965.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_05965` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_05965.v`. Only these files are graded.

## Interface of `mg_05965`

| port | dir | width | note |
|---|---|---|---|
| `cmd_in` | in | 16 |  |
| `cmd_write` | out | 1 | |
| `cmd_write_stop` | out | 1 | |
| `cmd_read` | out | 1 | |
| `cmd_atomic_add` | out | 1 | |
| `cmd_atomic_and` | out | 1 | |
| `cmd_atomic_or` | out | 1 | |
| `cmd_atomic_xor` | out | 1 | |
| `cmd_cas` | out | 1 | |
| `cmd_opcode` | out | 4 | |
| `cmd_length` | out | 4 | |
| `cmd_size` | out | 3 | |
| `cmd_user` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_05965.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
