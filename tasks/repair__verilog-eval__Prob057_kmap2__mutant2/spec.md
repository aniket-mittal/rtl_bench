# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Combinational Four-Input Condition Detector**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `out`| output    | 1 bit |

There is no clock and no reset. `out` must respond only to the current values of the inputs.

The input `c` determines which of two conditions is used to compute `out`:

- **When `c` is 0:** `out` is 1 only if `a` is 0 and `b` and `d` are not both 1. In every other case where `c` is 0, `out` is 0.

- **When `c` is 1:** `out` is 1 only if `d` is 1 and at least one of `a` or `b` is 1. In every other case where `c` is 1, `out` is 0.

**Examples**

| a | b | c | d | out |
|---|---|---|---|-----|
| 0 | 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 1 | 1 |
| 0 | 1 | 1 | 0 | 0 |

Your module will be checked for formal equivalence against a reference design. The module name, port names, directions, and widths must match the table exactly, and the output must agree with the reference for all 16 input combinations.

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

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
