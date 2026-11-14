# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Half-Adder Variant**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`    | input  | 1 bit |
| `b`    | input  | 1 bit |
| `sum`  | output | 1 bit |
| `cout` | output | 1 bit |

The module takes two single-bit operands, `a` and `b`, and produces two single-bit outputs that together resemble a half adder, but with one unconventional twist.

**Behavior**

- `cout` must be high only when both inputs are high, as in a standard half adder's carry-out.
- `sum` must be high whenever at least one of the inputs is high. This differs from a conventional half adder: when both inputs are high, `sum` stays high instead of dropping to zero.

For reference, the required outputs for each input combination are:

| `a` | `b` | `sum` | `cout` |
|-----|-----|-------|--------|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 |

**Requirements**

- The design must be fully combinational: no clock, no reset, no state elements, and no latches.
- Outputs must respond to input changes with no sequential behavior.
- Port names, directions, and widths must match the table exactly.

Your submission will be checked for formal equivalence against a reference implementation, so the truth table above must be matched for all input combinations.

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
