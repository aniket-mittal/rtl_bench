# Fill in the masked region of `autovcoder_002746`

The file `autovcoder_002746.v` holds a Verilog design whose top module is `autovcoder_002746` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_002746`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_002746.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_002746` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_002746.v`. Only these files are graded.

## Interface of `autovcoder_002746`

| port | dir | width | note |
|---|---|---|---|
| `CCLK` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `ready` | in | 1 |  |
| `frame_done` | in | 1 |  |
| `leftadc` | in | 20 |  |
| `rightadc` | in | 20 |  |
| `reg_status` | in | 20 |  |
| `status_data` | in | 20 |  |
| `cmd_vd` | out | 1 | |
| `left_vd` | out | 1 | |
| `right_vd` | out | 1 | |
| `leftdac` | out | 20 | |
| `rightdac` | out | 20 | |
| `cmd_addr` | out | 8 | |
| `cmd_data` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_002746.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
