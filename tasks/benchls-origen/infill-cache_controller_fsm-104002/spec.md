# Fill in the masked region of `origen_104002`

The file `origen_104002.v` holds a Verilog design whose top module is `origen_104002` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_104002`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_104002.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_104002` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_104002.v`. Only these files are graded.

## Interface of `origen_104002`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `mem_read` | in | 1 |  |
| `mem_write` | in | 1 |  |
| `hit` | in | 1 |  |
| `pmem_resp` | in | 1 |  |
| `hit_out` | out | 1 | |
| `dirty1_out` | out | 1 | |
| `dirty2_out` | out | 1 | |
| `valid1_out` | out | 1 | |
| `valid2_out` | out | 1 | |
| `pmem_read` | out | 1 | |
| `pmem_write` | out | 1 | |
| `set_sel` | out | 2 | |
| `tag_sel` | out | 2 | |
| `dirty1_in` | out | 1 | |
| `dirty2_in` | out | 1 | |
| `valid1_in` | out | 1 | |
| `valid2_in` | out | 1 | |
| `lru_in` | out | 1 | |
| `lru_out` | out | 1 | |
| `hits` | out | 32 | |
| `miss` | out | 32 | |
| `pmem_address_sel` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_104002.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
