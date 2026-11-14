# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Two-Input NAND Gate**

Design a purely combinational digital circuit as a Verilog module named `dut`.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`   | input     | 1 bit |
| `b`   | input     | 1 bit |
| `out` | output    | 1 bit |

**Behavior**

The output `out` must be the logical complement of the AND of the two inputs. In other words, `out` is `0` only when both `a` and `b` are `1`; for every other input combination, `out` is `1`.

The truth table is:

| a | b | out |
|---|---|-----|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

**Requirements**

- The circuit is purely combinational: there is no clock, no reset, and no stored state. The output must respond to changes on the inputs without any sequential element.
- The module must use exactly the module name and port names given above, with the stated directions and widths.
- No additional ports are allowed.

Your submission will be checked for formal equivalence against a reference implementation, so the port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
