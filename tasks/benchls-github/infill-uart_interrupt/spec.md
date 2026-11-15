# Fill in the masked region of `uart_interrupt`

The file `uart_interrupt.v` holds a Verilog design whose top module is `uart_interrupt` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `uart_interrupt`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-29.e203_hbirdv2.

## Rules

- Edit only `uart_interrupt.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `uart_interrupt` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `uart_interrupt.v`. Only these files are graded.

## Interface of `uart_interrupt`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rstn_i` | in | 1 | reset, active high |
| `IER_i` | in | 3 |  |
| `error_i` | in | 1 |  |
| `rx_elements_i` | in | 6 |  |
| `tx_elements_i` | in | 6 |  |
| `trigger_level_i` | in | 2 |  |
| `clr_int_i` | in | 4 |  |
| `interrupt_o` | out | 1 | |
| `IIR_o` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v uart_interrupt.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
