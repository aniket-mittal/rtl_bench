# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Three-Input Conditional Flag**

Design a purely combinational Verilog module named `dut` that produces a single-bit flag from three single-bit inputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `out`| output    | 1 bit |

**Behavior**

The output `out` must be asserted (logic 1) in every input combination except one. Specifically, `out` is logic 0 only when `a` is 0, `b` is 1, and `c` is 0 at the same time. For all other seven combinations of `(a, b, c)`, `out` is logic 1.

**Requirements**

- The design is purely combinational: there is no clock, no reset, and no internal state. `out` must respond immediately to any change on `a`, `b`, or `c`.
- Note the asymmetry between the inputs: `b` is the only input whose value must be 1 (rather than 0) to contribute to the single de-asserted case.
- Do not add any extra ports.

**Truth table summary**

- `(a, b, c) = (0, 1, 0)` → `out = 0`
- All other combinations → `out = 1`

**Example**

- `a=0, b=1, c=0` → `out=0`
- `a=0, b=0, c=0` → `out=1`
- `a=1, b=1, c=0` → `out=1`
- `a=0, b=1, c=1` → `out=1`

Implement the module so that it matches this behavior exactly for all eight input combinations.

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
