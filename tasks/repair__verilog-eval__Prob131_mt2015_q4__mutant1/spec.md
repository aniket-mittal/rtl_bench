# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Constant-One Output Module**

Design a combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 1 bit |
| `y`  | input     | 1 bit |
| `z`  | output    | 1 bit |

**Requirements**

- The module is purely combinational. It has no clock, no reset, and no stored state.
- The output `z` must be logic high (`1'b1`) at all times, regardless of the values of `x` and `y`. This includes every input combination: `(0,0)`, `(0,1)`, `(1,0)`, and `(1,1)`.
- The inputs `x` and `y` are part of the interface and must be declared exactly as specified, but they have no influence on the value of `z`.
- The output must not depend on any input transition, and there must be no glitching or dependence on timing. The behavior is a fixed logic value.

**Example**

| x | y | z |
|---|---|---|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

**Notes**

- Port names, directions, and widths must match exactly as listed in the table, since your submission will be checked for formal equivalence against a reference design.
- Do not add extra ports.
- Do not use any sequential elements.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `x` | in | 1 |  |
| `y` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
