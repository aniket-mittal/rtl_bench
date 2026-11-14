# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Half-Adder Variant**

Design a purely combinational Verilog module named `dut` that takes two single-bit inputs and produces two single-bit outputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `sum`  | output | 1 bit |
| `cout` | output | 1 bit |

**Behavior**

- `sum` is asserted when exactly one of the two inputs is 1. It is 0 when both inputs are equal.
- `cout` is asserted when at least one of the two inputs is 1. It is 0 only when both inputs are 0.

Note that this is not a standard half adder. When both inputs are 1, `cout` must be 1 (not 0) and `sum` must be 0. Do not "correct" this behavior.

**Requirements**

- The circuit has no clock, no reset, and no internal state. Outputs must respond immediately to any change in the inputs.
- Every input combination must be handled as described above.

**Truth table summary**

| a | b | sum | cout |
|---|---|-----|------|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 1 |

Your submission will be checked by formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `sum` | out | 1 | |
| `cout` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
