# Fill in the masked region of `origen_039473`

The file `origen_039473.v` holds a Verilog design whose top module is `origen_039473` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_039473`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_039473.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_039473` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_039473.v`. Only these files are graded.

## Interface of `origen_039473`

| port | dir | width | note |
|---|---|---|---|
| `in2` | in | 10 |  |
| `in3` | in | 10 |  |
| `in4` | in | 10 |  |
| `in5` | in | 10 |  |
| `in6` | in | 10 |  |
| `in7` | in | 10 |  |
| `in8` | in | 10 |  |
| `in9` | in | 10 |  |
| `in10` | in | 10 |  |
| `in11` | in | 10 |  |
| `in12` | in | 10 |  |
| `in13` | in | 10 |  |
| `in14` | in | 10 |  |
| `in15` | in | 10 |  |
| `in16` | in | 10 |  |
| `in17` | in | 10 |  |
| `in18` | in | 10 |  |
| `in19` | in | 10 |  |
| `in20` | in | 10 |  |
| `in21` | in | 10 |  |
| `in22` | in | 10 |  |
| `in23` | in | 10 |  |
| `in24` | in | 10 |  |
| `in25` | in | 10 |  |
| `in26` | in | 10 |  |
| `in27` | in | 10 |  |
| `in28` | in | 10 |  |
| `in29` | in | 10 |  |
| `in30` | in | 10 |  |
| `in31` | in | 10 |  |
| `in32` | in | 10 |  |
| `in33` | in | 10 |  |
| `ctrl1` | in | 5 |  |
| `out1` | out | 10 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_039473.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
