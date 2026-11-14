# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Equality-or-Override Detector**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `in1` | input | 1 bit |
| `in2` | input | 1 bit |
| `in3` | input | 1 bit |
| `out` | output | 1 bit |

**Behavior**

The module has no clock and no reset; `out` must respond immediately to any change on the inputs.

The output `out` is asserted (logic 1) when either of the following conditions holds:

1. `in1` and `in2` carry the same logic value (both 0 or both 1), or
2. `in3` is logic 1, regardless of the values of `in1` and `in2`.

Otherwise, `out` is 0. In other words, `out` is 0 only when `in1` and `in2` differ **and** `in3` is 0.

**Examples**

| in1 | in2 | in3 | out |
|-----|-----|-----|-----|
| 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 1 | 0 | 1 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 |

**Requirements**

- Module name, port names, directions, and widths must match the table exactly.
- All ports are single-bit scalars.
- The design must be fully combinational, with no latches or registers.
- Your answer will be checked by formal equivalence against a reference design, so the function must match for all input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in1` | in | 1 |  |
| `in2` | in | 1 |  |
| `in3` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
