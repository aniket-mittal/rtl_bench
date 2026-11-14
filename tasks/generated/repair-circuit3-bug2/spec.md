# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Gated Condition Checker**

Design a purely combinational Verilog module named `dut` that evaluates a condition built from four single-bit inputs and produces a single-bit result.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Behavior**

The output `q` is asserted (logic 1) only when both of the following requirements are met at the same time:

1. **Implication requirement:** whenever `a` is 1, `b` must also be 1. In other words, the combination `a = 1, b = 0` violates this requirement, and every other combination of `a` and `b` satisfies it.
2. **Enable requirement:** at least one of `c` or `d` must be 1. If both `c` and `d` are 0, this requirement is violated.

If either requirement is violated, `q` must be 0.

**Details**

- The circuit has no clock, no reset, and no internal state. `q` must respond immediately to any change on the inputs.
- All four inputs are independent and every one of the 16 input combinations is valid. There are no don't-care cases.
- For example:
  - `a=0, b=0, c=1, d=0` gives `q=1`.
  - `a=1, b=0, c=1, d=1` gives `q=0` (implication violated).
  - `a=1, b=1, c=0, d=0` gives `q=0` (enable violated).
  - `a=1, b=1, c=0, d=1` gives `q=1`.

Implement the module with the exact name and port names given above.

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
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
