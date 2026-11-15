# Fill in the masked region of `autovcoder_018001`

The file `autovcoder_018001.v` holds a Verilog design whose top module is `autovcoder_018001` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_018001`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_018001.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_018001` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_018001.v`. Only these files are graded.

## Interface of `autovcoder_018001`

| port | dir | width | note |
|---|---|---|---|
| `sel` | in | 4 |  |
| `in_0` | in | 2 |  |
| `in_1` | in | 2 |  |
| `in_2` | in | 2 |  |
| `in_3` | in | 2 |  |
| `in_4` | in | 2 |  |
| `in_5` | in | 2 |  |
| `in_6` | in | 2 |  |
| `in_7` | in | 2 |  |
| `in_8` | in | 2 |  |
| `in_9` | in | 2 |  |
| `in_10` | in | 2 |  |
| `in_11` | in | 2 |  |
| `in_12` | in | 2 |  |
| `in_13` | in | 2 |  |
| `in_14` | in | 2 |  |
| `in_15` | in | 2 |  |
| `out` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_018001.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
