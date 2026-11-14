# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Bitwise Difference Unit**

Design a combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `x`   | input  | 4 bits (`[3:0]`) |
| `y`   | input  | 4 bits (`[3:0]`) |
| `sum` | output | 5 bits (`[4:0]`) |

**Behavior**

The module takes two 4-bit unsigned inputs, `x` and `y`, and produces a 5-bit output `sum`.

Each of the lower four bits of `sum` should be 1 exactly when the corresponding bits of `x` and `y` differ, and 0 when they are the same. That is, bit *i* of `sum` (for *i* = 0 to 3) depends only on bit *i* of `x` and bit *i* of `y`. No carries or borrows propagate between bit positions.

The most significant bit of `sum` (bit 4) must always be 0, regardless of the input values.

**Requirements**

- The design is purely combinational: there is no clock, no reset, and no stored state. The output must change whenever either input changes.
- Despite the name `sum`, the output is **not** an arithmetic addition of `x` and `y`. For example, `x = 4'b0011` and `y = 4'b0001` must yield `sum = 5'b00010`, and `x = 4'b1111` and `y = 4'b1111` must yield `sum = 5'b00000`.
- Port names, directions, and widths must match the table exactly.

**Examples**

| `x` | `y` | `sum` |
|--------|--------|---------|
| 0000 | 0000 | 00000 |
| 1010 | 0101 | 01111 |
| 1100 | 1010 | 00110 |
| 1111 | 0000 | 01111 |

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
