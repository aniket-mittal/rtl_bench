# Fill in the masked region of `async_cdc_fifo`

The file `async_cdc_fifo.v` holds a Verilog design whose top module is `async_cdc_fifo` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `async_cdc_fifo`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-10.analog-hdl.

## Rules

- Edit only `async_cdc_fifo.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `async_cdc_fifo` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `async_cdc_fifo.v`. Only these files are graded.

## Interface of `async_cdc_fifo`

| port | dir | width | note |
|---|---|---|---|
| `wr_clk` | in | 1 | clock, rising edge |
| `rd_clk` | in | 1 |  |
| `rstn` | in | 1 | reset, active low |
| `wr_data` | in | 32 |  |
| `wr_en` | in | 1 |  |
| `rd_en` | in | 1 |  |
| `rd_data` | out | 32 | |
| `fifo_full` | out | 1 | |
| `fifo_empty` | out | 1 | |
| `rd_data_valid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v async_cdc_fifo.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
