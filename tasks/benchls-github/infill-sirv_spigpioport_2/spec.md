# Fill in the masked region of `sirv_spigpioport_2`

The file `sirv_spigpioport_2.v` holds a Verilog design whose top module is `sirv_spigpioport_2` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `sirv_spigpioport_2`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-4.e200_opensource.

## Rules

- Edit only `sirv_spigpioport_2.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `sirv_spigpioport_2` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `sirv_spigpioport_2.v`. Only these files are graded.

## Interface of `sirv_spigpioport_2`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `io_spi_sck` | in | 1 |  |
| `io_spi_dq_0_o` | in | 1 |  |
| `io_spi_dq_0_oe` | in | 1 |  |
| `io_spi_dq_1_o` | in | 1 |  |
| `io_spi_dq_1_oe` | in | 1 |  |
| `io_spi_dq_2_o` | in | 1 |  |
| `io_spi_dq_2_oe` | in | 1 |  |
| `io_spi_dq_3_o` | in | 1 |  |
| `io_spi_dq_3_oe` | in | 1 |  |
| `io_spi_cs_0` | in | 1 |  |
| `io_pins_sck_i_ival` | in | 1 |  |
| `io_pins_dq_0_i_ival` | in | 1 |  |
| `io_pins_dq_1_i_ival` | in | 1 |  |
| `io_pins_dq_2_i_ival` | in | 1 |  |
| `io_pins_dq_3_i_ival` | in | 1 |  |
| `io_pins_cs_0_i_ival` | in | 1 |  |
| `io_spi_dq_0_i` | out | 1 | |
| `io_spi_dq_1_i` | out | 1 | |
| `io_spi_dq_2_i` | out | 1 | |
| `io_spi_dq_3_i` | out | 1 | |
| `io_pins_sck_o_oval` | out | 1 | |
| `io_pins_sck_o_oe` | out | 1 | |
| `io_pins_sck_o_ie` | out | 1 | |
| `io_pins_sck_o_pue` | out | 1 | |
| `io_pins_sck_o_ds` | out | 1 | |
| `io_pins_dq_0_o_oval` | out | 1 | |
| `io_pins_dq_0_o_oe` | out | 1 | |
| `io_pins_dq_0_o_ie` | out | 1 | |
| `io_pins_dq_0_o_pue` | out | 1 | |
| `io_pins_dq_0_o_ds` | out | 1 | |
| `io_pins_dq_1_o_oval` | out | 1 | |
| `io_pins_dq_1_o_oe` | out | 1 | |
| `io_pins_dq_1_o_ie` | out | 1 | |
| `io_pins_dq_1_o_pue` | out | 1 | |
| `io_pins_dq_1_o_ds` | out | 1 | |
| `io_pins_dq_2_o_oval` | out | 1 | |
| `io_pins_dq_2_o_oe` | out | 1 | |
| `io_pins_dq_2_o_ie` | out | 1 | |
| `io_pins_dq_2_o_pue` | out | 1 | |
| `io_pins_dq_2_o_ds` | out | 1 | |
| `io_pins_dq_3_o_oval` | out | 1 | |
| `io_pins_dq_3_o_oe` | out | 1 | |
| `io_pins_dq_3_o_ie` | out | 1 | |
| `io_pins_dq_3_o_pue` | out | 1 | |
| `io_pins_dq_3_o_ds` | out | 1 | |
| `io_pins_cs_0_o_oval` | out | 1 | |
| `io_pins_cs_0_o_oe` | out | 1 | |
| `io_pins_cs_0_o_ie` | out | 1 | |
| `io_pins_cs_0_o_pue` | out | 1 | |
| `io_pins_cs_0_o_ds` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v sirv_spigpioport_2.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
