# Fill in the masked region of `rtlpp_02566`

The file `rtlpp_02566.v` holds a Verilog design whose top module is `rtlpp_02566` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02566`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02566.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02566` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02566.v`. Only these files are graded.

## Interface of `rtlpp_02566`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `i_m0_we` | in | 1 |  |
| `i_m0_cyc` | in | 1 |  |
| `i_m0_stb` | in | 1 |  |
| `i_m0_sel` | in | 4 |  |
| `i_m0_dat` | in | 32 |  |
| `i_m0_adr` | in | 32 |  |
| `i_m1_we` | in | 1 |  |
| `i_m1_cyc` | in | 1 |  |
| `i_m1_stb` | in | 1 |  |
| `i_m1_sel` | in | 4 |  |
| `i_m1_dat` | in | 32 |  |
| `i_m1_adr` | in | 32 |  |
| `i_s_dat` | in | 32 |  |
| `i_s_ack` | in | 1 |  |
| `i_s_int` | in | 1 |  |
| `o_m0_ack` | out | 1 | |
| `o_m0_dat` | out | 32 | |
| `o_m0_int` | out | 1 | |
| `o_m1_ack` | out | 1 | |
| `o_m1_dat` | out | 32 | |
| `o_m1_int` | out | 1 | |
| `o_s_we` | out | 1 | |
| `o_s_stb` | out | 1 | |
| `o_s_cyc` | out | 1 | |
| `o_s_sel` | out | 4 | |
| `o_s_adr` | out | 32 | |
| `o_s_dat` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02566.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
