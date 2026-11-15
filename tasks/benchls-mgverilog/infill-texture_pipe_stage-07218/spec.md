# Fill in the masked region of `mg_07218`

The file `mg_07218.v` holds a Verilog design whose top module is `mg_07218` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_07218`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_07218.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_07218` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_07218.v`. Only these files are graded.

## Interface of `mg_07218`

| port | dir | width | note |
|---|---|---|---|
| `sys_clk` | in | 1 | clock, rising edge |
| `sys_rst` | in | 1 | reset, active high |
| `pipe_stb_i` | in | 1 |  |
| `dx` | in | 12 |  |
| `dy` | in | 12 |  |
| `tx` | in | 18 |  |
| `ty` | in | 18 |  |
| `tex_hmask` | in | 18 |  |
| `tex_vmask` | in | 18 |  |
| `pipe_ack_i` | in | 1 |  |
| `busy` | out | 1 | |
| `pipe_ack_o` | out | 1 | |
| `pipe_stb_o` | out | 1 | |
| `dx_f` | out | 12 | |
| `dy_f` | out | 12 | |
| `tx_m` | out | 18 | |
| `ty_m` | out | 18 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_07218.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
