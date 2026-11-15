# Fill in the masked region of `origen_091746`

The file `origen_091746.v` holds a Verilog design whose top module is `origen_091746` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_091746`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_091746.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_091746` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_091746.v`. Only these files are graded.

## Interface of `origen_091746`

| port | dir | width | note |
|---|---|---|---|
| `pclk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `vga_data` | in | 12 |  |
| `h_addr` | out | 10 | |
| `v_addr` | out | 10 | |
| `hsync` | out | 1 | |
| `vsync` | out | 1 | |
| `valid` | out | 1 | |
| `vga_r` | out | 8 | |
| `vga_g` | out | 8 | |
| `vga_b` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_091746.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
