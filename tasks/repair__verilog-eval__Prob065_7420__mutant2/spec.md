# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual NAND Gate Package**

Design a purely combinational Verilog module named `dut` that models a chip containing two independent NAND gates, each with its own set of inputs and one output.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `p1a` | input | 1 |
| `p1b` | input | 1 |
| `p1c` | input | 1 |
| `p1d` | input | 1 |
| `p1y` | output | 1 |
| `p2a` | input | 1 |
| `p2b` | input | 1 |
| `p2c` | input | 1 |
| `p2d` | input | 1 |
| `p2y` | output | 1 |

**Required behavior**

The module has two independent sections, which must not affect each other.

- **Section 2:** `p2y` is the output of a 4-input NAND of `p2a`, `p2b`, `p2c`, and `p2d`. It is 0 only when all four inputs are 1, and 1 otherwise.

- **Section 1:** `p1y` is also a NAND-style output of the section 1 inputs, with one unusual feature: the input `p1c` is not connected to anything internally. Its value must have no effect on `p1y` at any time. The output depends only on `p1a`, `p1b`, and `p1d`. It is 0 only when all three of those inputs are 1, and 1 otherwise.

**Notes**

- There is no clock and no reset; both outputs must respond immediately to input changes.
- Do not add any state, delays, or additional ports.
- Inputs are treated as ordinary 2-state logic values (0 or 1).
- Your design will be checked for formal equivalence against a reference, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `p1a` | in | 1 |  |
| `p1b` | in | 1 |  |
| `p1c` | in | 1 |  |
| `p1d` | in | 1 |  |
| `p2a` | in | 1 |  |
| `p2b` | in | 1 |  |
| `p2c` | in | 1 |  |
| `p2d` | in | 1 |  |
| `p1y` | out | 1 | |
| `p2y` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
