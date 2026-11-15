# Fill in the masked region of `origen_030472`

The file `origen_030472.v` holds a Verilog design whose top module is `origen_030472` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_030472`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_030472.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_030472` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_030472.v`. Only these files are graded.

## Interface of `origen_030472`

| port | dir | width | note |
|---|---|---|---|
| `state` | in | 3 |  |
| `button_increase` | in | 1 |  |
| `insertdata_digit1` | in | 4 |  |
| `insertdata_digit2` | in | 4 |  |
| `insertdata_digit3` | in | 4 |  |
| `insertdata_digit4` | in | 4 |  |
| `insertdata_digit5` | in | 4 |  |
| `insertdata_digit6` | in | 4 |  |
| `insertdata_digit7` | in | 4 |  |
| `insertdata_digit8` | in | 4 |  |
| `insertdata_position_pointer` | in | 3 |  |
| `insertnewpass_digit1` | in | 4 |  |
| `insertnewpass_digit2` | in | 4 |  |
| `insertnewpass_digit3` | in | 4 |  |
| `insertnewpass_digit4` | in | 4 |  |
| `insertnewpass_digit5` | in | 4 |  |
| `insertnewpass_digit6` | in | 4 |  |
| `insertnewpass_digit7` | in | 4 |  |
| `insertnewpass_digit8` | in | 4 |  |
| `insertnewpass_position_pointer` | in | 3 |  |
| `insertpass_digit1` | in | 4 |  |
| `insertpass_digit2` | in | 4 |  |
| `insertpass_digit3` | in | 4 |  |
| `insertpass_digit4` | in | 4 |  |
| `insertpass_digit5` | in | 4 |  |
| `insertpass_digit6` | in | 4 |  |
| `insertpass_digit7` | in | 4 |  |
| `insertpass_digit8` | in | 4 |  |
| `insertpass_position_pointer` | in | 3 |  |
| `data_digit1` | in | 4 |  |
| `data_digit2` | in | 4 |  |
| `data_digit3` | in | 4 |  |
| `data_digit4` | in | 4 |  |
| `data_digit5` | in | 4 |  |
| `data_digit6` | in | 4 |  |
| `data_digit7` | in | 4 |  |
| `data_digit8` | in | 4 |  |
| `position_pointer` | out | 3 | |
| `digit1` | out | 4 | |
| `digit2` | out | 4 | |
| `digit3` | out | 4 | |
| `digit4` | out | 4 | |
| `digit5` | out | 4 | |
| `digit6` | out | 4 | |
| `digit7` | out | 4 | |
| `digit8` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_030472.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
