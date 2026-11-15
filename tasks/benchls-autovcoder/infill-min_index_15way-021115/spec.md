# Fill in the masked region of `autovcoder_021115`

The file `autovcoder_021115.v` holds a Verilog design whose top module is `autovcoder_021115` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_021115`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_021115.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_021115` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_021115.v`. Only these files are graded.

## Interface of `autovcoder_021115`

| port | dir | width | note |
|---|---|---|---|
| `iClock` | in | 1 | clock, rising edge |
| `iEnable` | in | 1 |  |
| `iIn0` | in | 31 |  |
| `iIn1` | in | 31 |  |
| `iIn2` | in | 31 |  |
| `iIn3` | in | 31 |  |
| `iIn4` | in | 31 |  |
| `iIn5` | in | 31 |  |
| `iIn6` | in | 31 |  |
| `iIn7` | in | 31 |  |
| `iIn8` | in | 31 |  |
| `iIn9` | in | 31 |  |
| `iIn10` | in | 31 |  |
| `iIn11` | in | 31 |  |
| `iIn12` | in | 31 |  |
| `iIn13` | in | 31 |  |
| `iIn14` | in | 31 |  |
| `oMinimum` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_021115.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
