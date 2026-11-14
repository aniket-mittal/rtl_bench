# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Implication Gate**

Design a purely combinational Verilog module named `dut` that implements a two-input logic gate.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in1` | input | 1 bit |
| `in2` | input | 1 bit |
| `out` | output | 1 bit |

**Behavior**

The output `out` must reflect the logical implication "`in1` implies `in2`". That is, `out` is low only when the antecedent `in1` is asserted while the consequent `in2` is deasserted. In every other input combination, `out` is high.

The circuit has no clock, no reset, and no internal state. The output must respond immediately to any change on either input.

**Truth table**

| `in1` | `in2` | `out` |
|-------|-------|-------|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

**Requirements**

- The module name must be exactly `dut`.
- Port names, directions, and widths must match the table above exactly.
- The design must be purely combinational, with no latches or registers.
- Your solution will be checked for formal equivalence against a reference design, so the behavior must match the truth table for every input combination.

**Example**

- `in1 = 1`, `in2 = 0` → `out = 0`
- `in1 = 1`, `in2 = 1` → `out = 1`
- `in1 = 0`, `in2 = 0` → `out = 1`

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
