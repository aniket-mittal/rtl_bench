# Fill in the masked region of `vga_linear`

The file `vga_linear.v` holds a Verilog design whose top module is `vga_linear` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `vga_linear`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-15.zet.

## Rules

- Edit only `vga_linear.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `vga_linear` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `vga_linear.v`. Only these files are graded.

## Interface of `vga_linear`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `csr_dat_i` | in | 16 |  |
| `h_count` | in | 10 |  |
| `v_count` | in | 10 |  |
| `horiz_sync_i` | in | 1 |  |
| `video_on_h_i` | in | 1 |  |
| `csr_adr_o` | out | 17 | |
| `csr_stb_o` | out | 1 | |
| `video_on_h_o` | out | 1 | |
| `color` | out | 8 | |
| `horiz_sync_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v vga_linear.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
