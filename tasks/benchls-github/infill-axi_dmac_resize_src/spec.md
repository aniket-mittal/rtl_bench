# Fill in the masked region of `axi_dmac_resize_src`

The file `axi_dmac_resize_src.v` holds a Verilog design whose top module is `axi_dmac_resize_src` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `axi_dmac_resize_src`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-10.analog-hdl.

## Rules

- Edit only `axi_dmac_resize_src.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `axi_dmac_resize_src` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `axi_dmac_resize_src.v`. Only these files are graded.

## Interface of `axi_dmac_resize_src`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `src_data_valid` | in | 1 |  |
| `src_data` | in | 64 |  |
| `src_data_last` | in | 1 |  |
| `src_data_valid_bytes` | in | 3 |  |
| `src_data_partial_burst` | in | 1 |  |
| `mem_data_valid` | out | 1 | |
| `mem_data` | out | 64 | |
| `mem_data_last` | out | 1 | |
| `mem_data_valid_bytes` | out | 3 | |
| `mem_data_partial_burst` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v axi_dmac_resize_src.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
