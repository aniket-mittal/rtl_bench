# Fill in the masked region of `autovcoder_113074`

The file `autovcoder_113074.v` holds a Verilog design whose top module is `autovcoder_113074` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `autovcoder_113074` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_113074.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_113074` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_113074.v`. Only these files are graded.

## Interface of `autovcoder_113074`

| port | dir | width | note |
|---|---|---|---|
| `i_data` | in | 18 |  |
| `o_data_9` | out | 25 | |
| `o_data_25` | out | 25 | |
| `o_data_43` | out | 25 | |
| `o_data_57` | out | 25 | |
| `o_data_70` | out | 25 | |
| `o_data_80` | out | 25 | |
| `o_data_87` | out | 25 | |
| `o_data_90` | out | 25 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_113074.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
