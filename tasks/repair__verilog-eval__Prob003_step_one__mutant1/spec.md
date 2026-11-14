# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Constant Output Module**

Design a combinational Verilog module named `dut` with a single port:

- `output one` (1 bit)

**Requirements**

The module has no inputs, no clock, and no reset. Its output `one` must be driven continuously by a fixed value that never changes.

Despite the name of the output, `one` must **not** carry the logic value 1. The name is intentionally misleading: the output must be held at a constant logic 0 at all times.

**Details**

- The output is 1 bit wide.
- The value must be constant from time zero onward, with no dependence on any signal, state, or timing.
- The output must never be high impedance (`z`) or unknown (`x`).
- The design must be purely combinational: no registers, latches, or sequential elements.

**Example**

| Time | `one` |
|------|-------|
| any  | 0     |

Your module should use exactly the module name and port declaration given above so it can be checked for equivalence against the reference design.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `one` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
