# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Constant-Output Combinational Module**

Design a purely combinational Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|------|-----------|-------|
| `in`  | input  | 1 bit |
| `out` | output | 1 bit |

**Requirements**

- The module has no clock and no reset. It must contain no sequential elements, and `out` must respond immediately to any change on `in`.
- For every legal value of `in` (0 or 1), the output `out` must be logic 1.
- The output does not depend on the value of `in`. Any circuit whose `out` is logic 1 for both input values is considered correct, regardless of how it is built internally.

**Examples**

| `in` | `out` |
|------|-------|
| 0    | 1     |
| 1    | 1     |

**Notes**

- The module name, port names, directions and widths must match the table exactly. Your submission is checked by formal equivalence against a reference design.
- Do not add extra ports, parameters or state.
- Treat `in` as a normal two-valued signal (0 or 1). No behavior is specified for X or Z inputs.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
