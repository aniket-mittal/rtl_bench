# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Single-Bit Subtractor with Borrow Output**

Design a purely combinational Verilog module named `dut` that subtracts one 1-bit input from another and reports the result as a 2-bit value.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`    | input  | 1 bit |
| `b`    | input  | 1 bit |
| `sum`  | output | 1 bit |
| `cout` | output | 1 bit |

**Behavior**

Treat `a` and `b` as unsigned 1-bit values. Compute the difference `a - b` as a 2-bit two's-complement result, so a negative difference wraps around modulo 4. The two output bits together form this 2-bit result:

- `cout` is the upper (most significant) bit.
- `sum` is the lower (least significant) bit.

For example, when `a = 0` and `b = 1`, the true difference is -1. Its 2-bit two's-complement representation is `11`, so both `cout` and `sum` are 1. When `a = 1` and `b = 0`, the result is `01`.

The circuit has no clock, no reset, and no stored state. Both outputs must update immediately whenever either input changes. Every one of the four input combinations must produce the 2-bit result described above.

**Requirements**

- The module name and port names, directions, and widths must match the table exactly.
- Do not add any ports.
- The design must be synthesizable and combinational, with no latches or registers.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `sum` | out | 1 | |
| `cout` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
