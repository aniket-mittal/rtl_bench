# Fill in the masked region of `rtlpp_06824`

The file `rtlpp_06824.v` holds a Verilog design whose top module is `rtlpp_06824` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_06824`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_06824.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_06824` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_06824.v`. Only these files are graded.

## Interface of `rtlpp_06824`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rstn` | in | 1 | reset, active low |
| `tic_enable` | in | 1 |  |
| `f_control` | in | 29 |  |
| `carrier_val` | out | 32 | |
| `i_sign` | out | 1 | |
| `i_mag` | out | 1 | |
| `q_sign` | out | 1 | |
| `q_mag` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_06824.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
