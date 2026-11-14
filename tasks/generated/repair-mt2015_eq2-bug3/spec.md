# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Two-Bit Reversed Match Comparator**

Design a purely combinational Verilog module named `dut` that compares two 2-bit values, where one of them is bit-swapped before the comparison.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `A`  | input     | 2 bits (`[1:0]`) |
| `B`  | input     | 2 bits (`[1:0]`) |
| `z`  | output    | 1 bit |

**Behavior**

The output `z` should be logic 1 if and only if the 2-bit value `A` is exactly equal to the 2-bit value formed by swapping the two bits of `B`. That is, the most significant bit of `A` must match the least significant bit of `B`, and the least significant bit of `A` must match the most significant bit of `B`. In every other case, `z` must be logic 0.

**Requirements**

- The circuit has no clock, no reset, and no internal state; `z` must respond immediately to any change on `A` or `B`.
- Both bits must match simultaneously for `z` to be 1. A match on only one bit yields 0.
- All 16 combinations of `A` and `B` are valid inputs, and each must produce a well-defined output.

**Examples**

| A    | B    | z |
|------|------|---|
| 2'b00 | 2'b00 | 1 |
| 2'b01 | 2'b10 | 1 |
| 2'b10 | 2'b01 | 1 |
| 2'b01 | 2'b01 | 0 |
| 2'b11 | 2'b11 | 1 |
| 2'b10 | 2'b10 | 0 |

Your module must use the exact module name and port names, directions, and widths given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 2 |  |
| `B` | in | 2 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
