# Fill in the masked region of `mg_05238`

The file `mg_05238.v` holds a Verilog design whose top module is `mg_05238` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_05238`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_05238.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_05238` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_05238.v`. Only these files are graded.

## Interface of `mg_05238`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `port_id` | in | 8 |  |
| `data_in` | in | 8 |  |
| `read_strobe` | in | 1 |  |
| `write_strobe` | in | 1 |  |
| `uart_data_read` | in | 8 |  |
| `rx_data_present` | in | 1 |  |
| `rx_half_full` | in | 1 |  |
| `rx_full` | in | 1 |  |
| `tx_data_present` | in | 1 |  |
| `tx_half_full` | in | 1 |  |
| `tx_full` | in | 1 |  |
| `data_out` | out | 8 | |
| `interrupt` | out | 1 | |
| `buffer_write` | out | 1 | |
| `uart_data_write` | out | 8 | |
| `buffer_read` | out | 1 | |
| `enable` | out | 1 | |
| `uart_clock_divide` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_05238.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
