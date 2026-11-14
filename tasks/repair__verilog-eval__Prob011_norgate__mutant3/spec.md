# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Single-Bit Equality Detector**

Design a purely combinational Verilog module named `dut` that determines whether two single-bit inputs carry the same logic value.

**Ports**

| Name  | Direction | Width  |
|-------|-----------|--------|
| `a`   | input     | 1 bit  |
| `b`   | input     | 1 bit  |
| `out` | output    | 1 bit  |

**Behavior**

- `out` must be logic 1 when `a` and `b` have the same value (both 0 or both 1).
- `out` must be logic 0 when `a` and `b` differ.

Summarized as a truth table:

| a | b | out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 1   |

**Requirements**

- The circuit has no clock, no reset, and no internal state. The output must respond immediately to any change on the inputs.
- Use the exact module name and port names shown above. All ports are scalar (1 bit wide).
- Your design is checked for formal equivalence against a reference, so the logic function must match the truth table exactly for all input combinations.

**Example**

- `a = 1`, `b = 1` → `out = 1`
- `a = 1`, `b = 0` → `out = 0`

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
