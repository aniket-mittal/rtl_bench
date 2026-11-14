# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Two-Input Difference Detector**

Design a purely combinational Verilog module named `dut` that indicates whether its two single-bit inputs differ.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`   | input     | 1 bit |
| `b`   | input     | 1 bit |
| `out` | output    | 1 bit |

**Functional requirements**

- The output `out` must be `1` when `a` and `b` have different values, and `0` when they have the same value.
- The circuit has no clock, no reset, and no internal state. The output must respond immediately to any change on either input.
- The behavior must be symmetric: swapping the values of `a` and `b` must not change `out`.

**Truth table**

| a | b | out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

**Notes**

- Use exactly the module name and port names given above.
- Your design will be checked for formal equivalence against a reference implementation, so port names, directions, and widths must match exactly.
- Do not use any sequential elements (latches, flip-flops) in your design.

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
