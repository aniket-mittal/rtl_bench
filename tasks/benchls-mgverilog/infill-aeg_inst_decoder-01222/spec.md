# Fill in the masked region of `mg_01222`

The file `mg_01222.v` holds a Verilog design whose top module is `mg_01222` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_01222`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_01222.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_01222` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_01222.v`. Only these files are graded.

## Interface of `mg_01222`

| port | dir | width | note |
|---|---|---|---|
| `cae_inst` | in | 32 |  |
| `cae_data` | in | 64 |  |
| `cae_inst_vld` | in | 1 |  |
| `inst_val` | out | 1 | |
| `inst_caep` | out | 5 | |
| `inst_aeg_wr` | out | 1 | |
| `inst_aeg_rd` | out | 1 | |
| `inst_aeg_idx` | out | 18 | |
| `err_unimpl` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_01222.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
