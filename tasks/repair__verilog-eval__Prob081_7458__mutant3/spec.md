# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual AND-OR-Invert Logic Block**

Design a purely combinational Verilog module named `dut` that contains two independent logic functions, in the style of a classic dual-gate logic chip.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `p1a` | input | 1 |
| `p1b` | input | 1 |
| `p1c` | input | 1 |
| `p1d` | input | 1 |
| `p1e` | input | 1 |
| `p1f` | input | 1 |
| `p1y` | output | 1 |
| `p2a` | input | 1 |
| `p2b` | input | 1 |
| `p2c` | input | 1 |
| `p2d` | input | 1 |
| `p2y` | output | 1 |

**Required behavior**

*Function 1:* Output `p1y` is asserted (logic 1) when all three of `p1a`, `p1b`, and `p1c` are 1, or when all three of `p1d`, `p1e`, and `p1f` are 1 (or both). Otherwise `p1y` is 0.

*Function 2:* Output `p2y` is the logical complement of the following condition: both `p2a` and `p2b` are 1, or both `p2c` and `p2d` are 1 (or both pairs). Thus `p2y` is 0 when either pair is fully high, and 1 otherwise.

**Notes**

- There is no clock or reset; outputs must respond purely combinationally to the inputs.
- The two functions are completely independent. No input of one function affects the output of the other.
- The module must use exactly the port names and widths given above, and all ports are single-bit signals.

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
| `p1e` | in | 1 |  |
| `p1f` | in | 1 |  |
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
