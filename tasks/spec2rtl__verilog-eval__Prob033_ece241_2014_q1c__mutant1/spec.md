# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: 8-bit Subtractor with Custom Overflow Flag**

Design a purely combinational Verilog module named `dut` that subtracts two 8-bit values and reports a custom overflow flag.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a` | input | 8 bits |
| `b` | input | 8 bits |
| `s` | output | 8 bits |
| `overflow` | output | 1 bit |

**Behavior**

- `s` is the difference `a - b`, truncated to 8 bits (two's-complement wraparound). Any borrow out of the top bit is discarded.
- `overflow` is a single-bit flag, asserted (1) only when both of the following hold:
  1. The most significant bits (sign bits) of `a` and `b` are **equal**.
  2. The most significant bit of the computed result `s` differs from the most significant bit of `a`.
- In every other case, `overflow` is 0.

**Notes**

- The flag is defined exactly as above. It is **not** the standard signed-overflow condition for subtraction. Do not substitute the textbook definition, because the circuit must match this specification exactly.
- There is no clock and no reset. The outputs must respond to input changes combinationally.
- There are no other inputs or outputs.

**Examples**

- `a = 8'd1`, `b = 8'd2`: `s = 8'hFF`. The sign bits of `a` and `b` are both 0, and `s[7] = 1` differs from `a[7]`, so `overflow = 1`.
- `a = 8'd5`, `b = 8'd3`: `s = 8'd2`. The sign bits are equal, but `s[7] = a[7]`, so `overflow = 0`.
- `a = 8'h7F`, `b = 8'hFF`: `s = 8'h80`. The sign bits differ, so `overflow = 0`.

Write the complete module with the exact name and port list given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `s` | out | 8 | |
| `overflow` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
