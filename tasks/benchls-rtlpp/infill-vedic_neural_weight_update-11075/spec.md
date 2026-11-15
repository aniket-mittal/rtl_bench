# Fill in the masked region of `rtlpp_11075`

The file `rtlpp_11075.v` holds a Verilog design whose top module is `rtlpp_11075` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_11075`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_11075.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_11075` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_11075.v`. Only these files are graded.

## Interface of `rtlpp_11075`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `Dn` | in | 8 |  |
| `Xn` | in | 8 |  |
| `Wn` | in | 8 |  |
| `memory_Dn_active` | in | 1 |  |
| `memory_Xn_active` | in | 1 |  |
| `memory_bobot_active` | in | 1 |  |
| `y_active` | in | 1 |  |
| `e_active` | in | 1 |  |
| `w_active` | in | 1 |  |
| `sys_reset_active` | in | 1 | reset, active high |
| `z` | out | 8 | |
| `done_read_Dn` | out | 1 | |
| `done_read_Xn` | out | 1 | |
| `done_yn` | out | 1 | |
| `done_en` | out | 1 | |
| `done_write_wn` | out | 1 | |
| `done_wn1` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_11075.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
