# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Three-Bit Operator Block**

Design a purely combinational Verilog module named `dut` with the following ports:

| Name | Direction | Width |
|---|---|---|
| `a` | input | 3 bits |
| `b` | input | 3 bits |
| `out_or_bitwise` | output | 3 bits |
| `out_or_logical` | output | 1 bit |
| `out_not` | output | 6 bits |

There is no clock and no reset; every output must respond immediately to changes on the inputs.

**Required behavior**

1. `out_or_bitwise`: Each bit position is computed independently from the corresponding bits of `a` and `b`. Despite the name of this port, a bit of the result is 1 exactly when the two corresponding input bits are *different*, and 0 when they are the same. (That is, the port does **not** implement a plain OR. Follow this specification, not the name.)

2. `out_or_logical`: A single bit that is 1 if at least one of the two inputs, viewed as a whole 3-bit value, is nonzero. It is 0 only when both `a` and `b` are all zeros.

3. `out_not`: A 6-bit value formed by concatenating the bitwise inversion of `b` and the bitwise inversion of `a`, with the inverted `b` occupying the upper three bits (`out_not[5:3]`) and the inverted `a` occupying the lower three bits (`out_not[2:0]`).

**Example**

- `a = 3'b101`, `b = 3'b110`
  - `out_or_bitwise = 3'b011`
  - `out_or_logical = 1'b1`
  - `out_not = 6'b001_010`

- `a = 3'b000`, `b = 3'b000`
  - `out_or_bitwise = 3'b000`
  - `out_or_logical = 1'b0`
  - `out_not = 6'b111_111`

Your module will be checked for formal equivalence against a reference design, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 3 |  |
| `b` | in | 3 |  |
| `out_or_bitwise` | out | 3 | |
| `out_or_logical` | out | 1 | |
| `out_not` | out | 6 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
