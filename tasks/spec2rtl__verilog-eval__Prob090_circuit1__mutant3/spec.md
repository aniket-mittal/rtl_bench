# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Two-Input NAND Gate**

Design a combinational Verilog module named `dut` that implements a two-input NAND gate.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Behavior**

The output `q` must be the logical complement of the AND of the two inputs. In other words, `q` is 0 only when both `a` and `b` are 1, and `q` is 1 in every other case.

Truth table:

| a | b | q |
|---|---|---|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

**Requirements**

- The circuit is purely combinational: there is no clock, no reset, and no stored state. The output must respond directly to any change in the inputs.
- The module must use exactly the module name and port names given above, with the specified directions and widths.
- No additional ports are allowed.

**Example**

- Inputs `a = 1`, `b = 1` produce `q = 0`.
- Inputs `a = 1`, `b = 0` produce `q = 1`.

Your submission will be checked for formal equivalence against a reference implementation, so port names and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
