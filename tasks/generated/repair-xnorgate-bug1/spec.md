# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: Single-Input Inverter with an Unused Port**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `out`| output    | 1 bit |

**Behavior**

The output `out` is the logical complement of input `a`:

- When `a` is 0, `out` is 1.
- When `a` is 1, `out` is 0.

Input `b` is part of the module interface but has no influence on the output. `out` must be the same regardless of the value of `b`.

**Requirements**

- The circuit is combinational: there is no clock, no reset, and no state. `out` must respond immediately to changes in `a`.
- The module must declare all three ports exactly as named and sized above, including `b`, even though `b` is unused.
- No edge cases beyond the two input values of `a` need to be handled (inputs are assumed to be valid 0 or 1).

**Examples**

| a | b | out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 1   |
| 1 | 0 | 0   |
| 1 | 1 | 0   |

Write the Verilog module `dut` that satisfies this specification.

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
