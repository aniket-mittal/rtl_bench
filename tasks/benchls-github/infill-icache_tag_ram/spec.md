# Fill in the masked region of `icache_tag_ram`

The file `icache_tag_ram.v` holds a Verilog design whose top module is `icache_tag_ram` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `icache_tag_ram`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-30.ultraembedded-riscv.

## Rules

- Edit only `icache_tag_ram.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `icache_tag_ram` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `icache_tag_ram.v`. Only these files are graded.

## Interface of `icache_tag_ram`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_i` | in | 1 | reset, active high |
| `addr_i` | in | 8 |  |
| `data_i` | in | 20 |  |
| `wr_i` | in | 1 |  |
| `data_o` | out | 20 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v icache_tag_ram.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
