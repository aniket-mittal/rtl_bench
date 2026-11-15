# Fill in the masked region of `rtlpp_00445`

The file `rtlpp_00445.v` holds a Verilog design whose top module is `rtlpp_00445` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_00445`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_00445.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_00445` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_00445.v`. Only these files are graded.

## Interface of `rtlpp_00445`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `flush_i` | in | 1 |  |
| `adv_i` | in | 1 |  |
| `start_i` | in | 1 |  |
| `is_sub_i` | in | 1 |  |
| `signa_i` | in | 1 |  |
| `exp10a_i` | in | 10 |  |
| `fract24a_i` | in | 24 |  |
| `infa_i` | in | 1 |  |
| `signb_i` | in | 1 |  |
| `exp10b_i` | in | 10 |  |
| `fract24b_i` | in | 24 |  |
| `infb_i` | in | 1 |  |
| `snan_i` | in | 1 |  |
| `qnan_i` | in | 1 |  |
| `anan_sign_i` | in | 1 |  |
| `addsub_agtb_i` | in | 1 |  |
| `addsub_aeqb_i` | in | 1 |  |
| `add_rdy_o` | out | 1 | |
| `add_sign_o` | out | 1 | |
| `add_sub_0_o` | out | 1 | |
| `add_shr_o` | out | 1 | |
| `add_shl_o` | out | 5 | |
| `add_exp10sh0_o` | out | 10 | |
| `add_fract28_o` | out | 28 | |
| `add_inv_o` | out | 1 | |
| `add_inf_o` | out | 1 | |
| `add_snan_o` | out | 1 | |
| `add_qnan_o` | out | 1 | |
| `add_anan_sign_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_00445.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
