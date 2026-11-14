# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Two-Input Equality Detector**

Design a purely combinational Verilog module named `dut` that reports whether two single-bit inputs carry the same logic value.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in1` | input | 1 bit |
| `in2` | input | 1 bit |
| `out` | output | 1 bit |

**Behavior**

- `out` must be `1` when `in1` and `in2` are equal (both `0` or both `1`).
- `out` must be `0` when `in1` and `in2` differ.
- The circuit has no clock, no reset, and no stored state. `out` must respond immediately to any change on either input.

**Truth table**

| `in1` | `in2` | `out` |
|-------|-------|-------|
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

**Requirements**

- The module name and port names must match exactly as given above.
- All ports are single-bit scalars.
- Your design will be checked for formal equivalence against a reference implementation, so the function must match the truth table for every input combination.

Write the module `dut` that implements this behavior.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in1` | in | 1 |  |
| `in2` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
