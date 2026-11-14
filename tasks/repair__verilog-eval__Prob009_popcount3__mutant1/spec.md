# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Three-Input Population Counter with Swapped Output Bits**

Design a purely combinational Verilog module named `dut` with the following ports:

- `input [2:0] in`: a 3-bit input vector
- `output [1:0] out`: a 2-bit output vector

**Behavior**

Count how many of the three bits of `in` are set to 1. This count ranges from 0 to 3 and can be represented as a 2-bit unsigned binary number (the "count code"), with a most significant bit and a least significant bit.

The output `out` is **not** the count code in its normal order. Instead, the two bits of the count code are delivered in swapped positions:

- `out[1]` carries the least significant bit of the count code.
- `out[0]` carries the most significant bit of the count code.

**Examples**

| `in`  | Count of 1s | Count code | `out` |
|-------|-------------|------------|-------|
| 3'b000 | 0 | 2'b00 | 2'b00 |
| 3'b001 | 1 | 2'b01 | 2'b10 |
| 3'b110 | 2 | 2'b10 | 2'b01 |
| 3'b111 | 3 | 2'b11 | 2'b11 |

**Requirements**

- The circuit must be purely combinational: no clock, no reset, no stored state.
- The output must reflect the current value of `in` at all times.
- Every one of the 8 possible input combinations must produce the output defined above.
- Port names, directions, and widths must match exactly as specified.

Implement the module `dut`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 3 |  |
| `out` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
