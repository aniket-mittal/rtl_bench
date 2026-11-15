# Fill in the masked region of `sync_r2w`

The file `sync_r2w.v` holds a Verilog design whose top module is `sync_r2w` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `sync_r2w`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-19.async_fifo.

## Rules

- Edit only `sync_r2w.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `sync_r2w` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `sync_r2w.v`. Only these files are graded.

## Interface of `sync_r2w`

| port | dir | width | note |
|---|---|---|---|
| `wclk` | in | 1 | clock, rising edge |
| `wrst_n` | in | 1 | reset, active low |
| `rptr` | in | 5 |  |
| `wq2_rptr` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v sync_r2w.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
