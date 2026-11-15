# Fill in the masked region of `mg_04807`

The file `mg_04807.v` holds a Verilog design whose top module is `mg_04807` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_04807`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_04807.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_04807` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_04807.v`. Only these files are graded.

## Interface of `mg_04807`

| port | dir | width | note |
|---|---|---|---|
| `addroundkey_data_i` | in | 4 |  |
| `addroundkey_data_reg` | in | 4 |  |
| `addroundkey_round` | in | 4 |  |
| `key_i` | in | 4 |  |
| `keysched_new_key_o` | in | 4 |  |
| `round` | in | 4 |  |
| `addroundkey_start_i` | in | 1 |  |
| `keysched_ready_o` | in | 1 |  |
| `keysched_last_key_i` | out | 4 | |
| `keysched_round_i` | out | 4 | |
| `next_addroundkey_data_reg` | out | 4 | |
| `next_addroundkey_round` | out | 4 | |
| `round_data_var` | out | 4 | |
| `keysched_start_i` | out | 1 | |
| `next_addroundkey_ready_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_04807.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
