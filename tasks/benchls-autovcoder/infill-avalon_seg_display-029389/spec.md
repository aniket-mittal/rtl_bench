# Fill in the masked region of `autovcoder_029389`

The file `autovcoder_029389.v` holds a Verilog design whose top module is `autovcoder_029389` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_029389`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_029389.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_029389` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_029389.v`. Only these files are graded.

## Interface of `autovcoder_029389`

| port | dir | width | note |
|---|---|---|---|
| `csi_clk` | in | 1 | clock, rising edge |
| `rsi_reset_n` | in | 1 | reset, active low |
| `avs_s0_write` | in | 1 |  |
| `avs_s0_read` | in | 1 |  |
| `avs_s0_address` | in | 4 |  |
| `avs_s0_writedata` | in | 32 |  |
| `avs_s0_readdata` | out | 32 | |
| `number1` | out | 6 | |
| `number2` | out | 6 | |
| `number3` | out | 6 | |
| `number4` | out | 6 | |
| `dot1` | out | 1 | |
| `dot2` | out | 1 | |
| `dot3` | out | 1 | |
| `dot4` | out | 1 | |
| `light1` | out | 3 | |
| `light2` | out | 3 | |
| `light3` | out | 3 | |
| `light4` | out | 3 | |
| `ena` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_029389.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
