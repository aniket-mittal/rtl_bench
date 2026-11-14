# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Two-Input Difference Detector**

Design a purely combinational Verilog module named `dut` that indicates whether two single-bit inputs differ.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Behavior**

- The output `q` must be `1` when the inputs `a` and `b` have different logic values, and `0` when they have the same logic value.
- The circuit has no clock, no reset, and no internal state. The output must respond directly to changes on the inputs, with no sequential elements or latches.
- All four input combinations must be handled:
  - `a=0, b=0` → `q=0`
  - `a=0, b=1` → `q=1`
  - `a=1, b=0` → `q=1`
  - `a=1, b=1` → `q=0`

**Requirements**

- The module name must be exactly `dut`.
- Port names, directions, and widths must match the table above exactly.
- The design must be fully combinational and functionally equivalent to the truth table above for all input values.

Write the Verilog module that satisfies this specification.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
