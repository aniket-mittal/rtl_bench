# Fill in the masked region of `rtlpp_05530`

The file `rtlpp_05530.v` holds a Verilog design whose top module is `rtlpp_05530` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_05530`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_05530.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_05530` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_05530.v`. Only these files are graded.

## Interface of `rtlpp_05530`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `Branch` | in | 1 |  |
| `Jump` | in | 1 |  |
| `Data_in` | in | 32 |  |
| `MemtoReg` | in | 2 |  |
| `ALUSrc_B` | in | 1 |  |
| `ImmSel` | in | 2 |  |
| `inst_field` | in | 32 |  |
| `ALU_operation` | in | 3 |  |
| `rst` | in | 1 | reset, active high |
| `RegWrite` | in | 1 |  |
| `ALU_out` | out | 32 | |
| `Data_out` | out | 32 | |
| `PC_out` | out | 32 | |
| `x0` | out | 32 | |
| `x1` | out | 32 | |
| `x2` | out | 32 | |
| `x3` | out | 32 | |
| `x4` | out | 32 | |
| `x5` | out | 32 | |
| `x6` | out | 32 | |
| `x7` | out | 32 | |
| `x8` | out | 32 | |
| `x9` | out | 32 | |
| `x10` | out | 32 | |
| `x11` | out | 32 | |
| `x12` | out | 32 | |
| `x13` | out | 32 | |
| `x14` | out | 32 | |
| `x15` | out | 32 | |
| `x16` | out | 32 | |
| `x17` | out | 32 | |
| `x18` | out | 32 | |
| `x19` | out | 32 | |
| `x20` | out | 32 | |
| `x21` | out | 32 | |
| `x22` | out | 32 | |
| `x23` | out | 32 | |
| `x24` | out | 32 | |
| `x25` | out | 32 | |
| `x26` | out | 32 | |
| `x27` | out | 32 | |
| `x28` | out | 32 | |
| `x29` | out | 32 | |
| `x30` | out | 32 | |
| `x31` | out | 32 | |
| `Imm_out` | out | 32 | |
| `pc_branch` | out | 32 | |
| `a_val` | out | 32 | |
| `b_val` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_05530.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
