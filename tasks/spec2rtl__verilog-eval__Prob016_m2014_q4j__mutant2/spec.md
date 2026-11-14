# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Truncated 4-bit Adder**

Design a combinational Verilog module named `dut` that adds two unsigned 4-bit numbers and reports the result on a 5-bit output.

**Ports**

| Name  | Direction | Width  |
|-------|-----------|--------|
| `x`   | input     | 4 bits |
| `y`   | input     | 4 bits |
| `sum` | output    | 5 bits |

**Behavior**

- The output `sum` is a 5-bit value whose lower 4 bits are the sum of `x` and `y`, computed with 4-bit wraparound arithmetic (that is, the result is taken modulo 16).
- The most significant bit of `sum` (bit 4) must always be `0`, regardless of the inputs. In particular, the carry-out of the addition is **not** reported: if `x + y` is 16 or greater, the carry is discarded and bit 4 of `sum` still stays `0`.
- The circuit has no clock and no reset. The output must respond purely combinationally to changes in `x` and `y`.

**Examples**

| x (decimal) | y (decimal) | sum (decimal) | sum (binary) |
|-------------|-------------|---------------|--------------|
| 3           | 4           | 7             | 00111        |
| 15          | 1           | 0             | 00000        |
| 15          | 15          | 14            | 01110        |
| 8           | 8           | 0             | 00000        |

**Requirements**

- Use the exact module name and port names, directions, and widths given above.
- Every one of the 256 possible input combinations must produce the specified output.
- Do not add any additional ports.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `x` | in | 4 |  |
| `y` | in | 4 |  |
| `sum` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
