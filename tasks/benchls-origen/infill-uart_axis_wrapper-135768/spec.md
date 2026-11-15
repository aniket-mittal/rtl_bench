# Fill in the masked region of `origen_135768`

The file `origen_135768.v` holds a Verilog design whose top module is `origen_135768` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_135768`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_135768.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_135768` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_135768.v`. Only these files are graded.

## Interface of `origen_135768`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `input_axis_tdata` | in | 8 |  |
| `input_axis_tvalid` | in | 1 |  |
| `output_axis_tready` | in | 1 |  |
| `rxd` | in | 1 |  |
| `uart_bits` | in | 2 |  |
| `uart_parity` | in | 2 |  |
| `uart_stopbit` | in | 2 |  |
| `prescale` | in | 16 |  |
| `input_axis_tready` | out | 1 | |
| `output_axis_tdata` | out | 8 | |
| `output_axis_tvalid` | out | 1 | |
| `txd` | out | 1 | |
| `tx_busy` | out | 1 | |
| `rx_busy` | out | 1 | |
| `rx_overrun_error` | out | 1 | |
| `rx_frame_error` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_135768.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
