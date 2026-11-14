# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Three-Input NOR Gate**

Design a purely combinational Verilog module named `dut` that implements a three-input NOR function.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `out`| output    | 1 bit |

**Behavior**

- The output `out` must be logic 1 only when all three inputs `a`, `b`, and `c` are logic 0.
- If any one or more of the inputs is logic 1, `out` must be logic 0.
- The circuit has no clock, no reset, and no memory. The output must respond immediately to any change on the inputs, depending solely on their current values.

**Truth table**

| a | b | c | out |
|---|---|---|-----|
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |

**Requirements**

- The module name must be exactly `dut`.
- Port names, directions, and widths must match the table above exactly.
- The design must be fully combinational, with no latches or sequential elements.

Your submission will be checked for formal equivalence against a reference design, so the functional behavior must match the truth table for every input combination.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
