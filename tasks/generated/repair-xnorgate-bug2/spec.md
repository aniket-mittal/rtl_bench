# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Two-Input NAND Gate**

Design a purely combinational digital circuit in Verilog that implements a two-input NAND gate.

**Module name:** `dut`

**Ports:**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `out`| output    | 1 bit |

**Functional requirements:**

- The output `out` must be the logical complement of the AND of the two inputs `a` and `b`.
- `out` is low (0) only when both `a` and `b` are high (1); for every other input combination, `out` is high (1).
- The circuit is combinational: there is no clock, no reset, and no stored state. The output must respond solely to the current values of `a` and `b`.

**Truth table:**

| a | b | out |
|---|---|-----|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

**Notes:**

- Use exactly the module name and port names given above, with the specified directions and widths.
- Your design will be checked for formal equivalence against a reference implementation, so the behavior must match the truth table for all input combinations.

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
