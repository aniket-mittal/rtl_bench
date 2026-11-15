# Fill in the masked region of `autovcoder_123489`

The file `autovcoder_123489.v` holds a Verilog design whose top module is `autovcoder_123489` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_123489`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_123489.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_123489` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_123489.v`. Only these files are graded.

## Interface of `autovcoder_123489`

| port | dir | width | note |
|---|---|---|---|
| `ap_clk` | in | 1 | clock, rising edge |
| `ap_rst` | in | 1 | reset, active high |
| `data_in` | in | 32 |  |
| `vld_in` | in | 1 |  |
| `ack_out` | in | 1 |  |
| `ack_in` | out | 1 | |
| `data_out` | out | 32 | |
| `vld_out` | out | 1 | |
| `apdone_blk` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_123489.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
