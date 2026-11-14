# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational Logic Block with Complementary Output**

Design a purely combinational Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|--------|-----------|-------|
| `a` | input | 1 |
| `b` | input | 1 |
| `c` | input | 1 |
| `d` | input | 1 |
| `out` | output | 1 |
| `out_n` | output | 1 |

**Behavior**

The module has four single-bit inputs and two single-bit outputs. There is no clock and no reset; the outputs must respond immediately to any change in the inputs and must not depend on any past input values.

The output `out` is asserted (logic 1) when at least one of the following two conditions holds:

1. Input `a` is high while input `b` is low.
2. Inputs `c` and `d` are both high.

In every other input combination, `out` is logic 0. The two conditions are independent of each other, so either one alone is sufficient to assert `out`, and both may be true at the same time.

The output `out_n` is always the logical complement of `out`: it is 0 whenever `out` is 1, and 1 whenever `out` is 0.

**Edge cases**

- When `a = 0`, condition 1 can never be satisfied, regardless of `b`, so `out` depends solely on `c` and `d`.
- When `b = 1`, condition 1 can never be satisfied, regardless of `a`, so `out` depends solely on `c` and `d`.
- With all inputs at 0, `out` is 0 and `out_n` is 1.
- With all inputs at 1, `out` is 1 (via condition 2) and `out_n` is 0.

Implement the module so that it matches the described behavior for all 16 possible input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `out` | out | 1 | |
| `out_n` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
