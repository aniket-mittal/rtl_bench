# Fill in the masked region of `autovcoder_002702`

The file `autovcoder_002702.v` holds a Verilog design whose top module is `autovcoder_002702` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_002702`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_002702.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_002702` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_002702.v`. Only these files are graded.

## Interface of `autovcoder_002702`

| port | dir | width | note |
|---|---|---|---|
| `sclk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `rd_cmd_start` | in | 1 |  |
| `rd_cmd_instr` | in | 3 |  |
| `rd_cmd_bl` | in | 7 |  |
| `rd_cmd_addr` | in | 28 |  |
| `app_rd_data` | in | 128 |  |
| `app_rd_data_valid` | in | 1 |  |
| `app_rdy` | in | 1 |  |
| `rd_data_128bit` | out | 128 | |
| `rd_data_valid` | out | 1 | |
| `rd_end` | out | 1 | |
| `app_en` | out | 1 | |
| `app_addr` | out | 28 | |
| `app_cmd` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_002702.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
