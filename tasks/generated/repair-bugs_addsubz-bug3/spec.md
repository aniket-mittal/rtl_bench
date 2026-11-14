# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**8-Bit Add/Subtract Unit with Low-Nibble Zero Flag**

Design a purely combinational Verilog module named `dut` that performs 8-bit addition or subtraction, selected by a control input, and also reports a zero-detect flag on part of the result.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `do_sub` | input | 1 |
| `a` | input | 8 |
| `b` | input | 8 |
| `out` | output | 8 |
| `result_is_zero` | output | 1 |

**Required behavior**

- When `do_sub` is 0, `out` is the 8-bit sum of `a` and `b`.
- When `do_sub` is 1, `out` is the 8-bit difference `a - b`.
- Both operations are unsigned and wrap around modulo 256. There is no carry or borrow output.
- `result_is_zero` is 1 if and only if the lower 4 bits of `out` (bits 3 down to 0) are all zero. The upper 4 bits of `out` have no influence on this flag. Note that this means the flag can be 1 even when `out` as a whole is nonzero.

**Timing**

- The design has no clock and no reset. Both outputs must update combinationally in response to any change on the inputs.

**Examples**

| do_sub | a | b | out | result_is_zero |
|---|---|---|---|---|
| 0 | 8'h05 | 8'h03 | 8'h08 | 0 |
| 0 | 8'h0F | 8'h01 | 8'h10 | 1 |
| 1 | 8'h20 | 8'h10 | 8'h10 | 1 |
| 1 | 8'h00 | 8'h01 | 8'hFF | 0 |

Implement the module so that it matches this specification exactly, including the port names and widths given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `do_sub` | in | 1 |  |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `out` | out | 8 | |
| `result_is_zero` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
