# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Single-Input Inverter with an Unused Port**

Design a purely combinational Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|------|-----------|-------|
| `a`   | input     | 1 bit |
| `b`   | input     | 1 bit |
| `out` | output    | 1 bit |

**Behavior**

The output `out` is the logical complement of input `a`:

- When `a` is 0, `out` is 1.
- When `a` is 1, `out` is 0.

The input `b` is part of the module interface but must have no influence on the output. The value of `b` (0 or 1) must never change `out`.

**Requirements**

- The circuit is purely combinational: no clock, no reset, no state, and no latches. `out` must respond immediately to any change in `a`.
- Keep `b` declared as a 1-bit input exactly as specified, even though it is unused.
- Port names, directions, and widths must match the table exactly, since the design will be checked by formal equivalence against a reference.

**Examples**

| a | b | out |
|---|---|-----|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

Write the module `dut` that satisfies these requirements.

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
