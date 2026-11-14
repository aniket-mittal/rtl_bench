# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Two-Input Gate**

Design a combinational Verilog module named `dut` that takes two single-bit inputs and produces a single-bit output.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in1` | input | 1 bit |
| `in2` | input | 1 bit |
| `out` | output | 1 bit |

**Behavior**

The output `out` must be logic 1 only when both `in1` and `in2` are logic 1 at the same time. In every other input combination, `out` must be logic 0.

**Requirements**

- The circuit is purely combinational: there is no clock, no reset, and no stored state. The output must respond immediately to any change on either input.
- The module must use exactly the module name and port names given above, with the stated directions and widths.
- Do not add any additional ports.

**Truth table**

| `in1` | `in2` | `out` |
|-------|-------|-------|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

**Goal**

Write the Verilog module `dut` that satisfies the specification above. Your solution will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

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
