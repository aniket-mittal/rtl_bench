# Fill in the masked region of `autovcoder_005580`

The file `autovcoder_005580.v` holds a Verilog design whose top module is `autovcoder_005580` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_005580`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_005580.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_005580` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_005580.v`. Only these files are graded.

## Interface of `autovcoder_005580`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `enable` | in | 1 |  |
| `i_Mem` | in | 9 |  |
| `i_WB` | in | 2 |  |
| `i_pc` | in | 32 |  |
| `i_Rdst` | in | 3 |  |
| `i_alu` | in | 16 |  |
| `i_read_data1` | in | 16 |  |
| `i_flag` | in | 4 |  |
| `o_WB` | out | 2 | |
| `o_Mem` | out | 9 | |
| `o_pc` | out | 32 | |
| `o_Rdst` | out | 3 | |
| `o_alu` | out | 16 | |
| `o_read_data1` | out | 16 | |
| `o_flag` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_005580.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
