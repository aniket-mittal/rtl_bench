# Fill in the masked region of `origen_006784`

The file `origen_006784.v` holds a Verilog design whose top module is `origen_006784` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_006784`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_006784.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_006784` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_006784.v`. Only these files are graded.

## Interface of `origen_006784`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `send_char` | in | 8 |  |
| `send_en` | in | 1 |  |
| `rx_rdata` | in | 8 |  |
| `rx_fifo_full` | in | 1 |  |
| `rx_fifo_dvalid` | in | 1 |  |
| `rx_fifo_overrun` | in | 1 |  |
| `rx_fifo_underrun` | in | 1 |  |
| `tx_fifo_full` | in | 1 |  |
| `tx_fifo_overrun` | in | 1 |  |
| `tx_fifo_underrun` | in | 1 |  |
| `rout` | out | 8 | |
| `rout_en` | out | 1 | |
| `rx_rden` | out | 1 | |
| `tx_wdata` | out | 8 | |
| `tx_wten` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_006784.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
