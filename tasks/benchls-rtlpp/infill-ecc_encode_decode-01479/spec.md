# Fill in the masked region of `rtlpp_01479`

The file `rtlpp_01479.v` holds a Verilog design whose top module is `rtlpp_01479` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_01479` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01479.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01479` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01479.v`. Only these files are graded.

## Interface of `rtlpp_01479`

| port | dir | width | note |
|---|---|---|---|
| `CLK_3M` | in | 1 |  |
| `DECODE_DATA` | in | 32 |  |
| `ENCODE_READ_EN` | in | 1 |  |
| `DECODE_CLK_3M` | in | 1 |  |
| `DECODE_WRITE_EN` | in | 1 |  |
| `FSL_Clk` | in | 1 |  |
| `FSL_Rst` | in | 1 | reset, active high |
| `FSL_S_Data` | in | 32 |  |
| `FSL_S_Exists` | in | 1 |  |
| `FSL_M_Full` | in | 1 |  |
| `ENCODE_DATA` | out | 32 | |
| `FSL_S_Clk` | out | 1 | |
| `FSL_S_Read` | out | 1 | |
| `FSL_S_Control` | out | 1 | |
| `FSL_M_Clk` | out | 1 | |
| `FSL_M_Write` | out | 1 | |
| `FSL_M_Data` | out | 32 | |
| `FSL_M_Control` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01479.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
