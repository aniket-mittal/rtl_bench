# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual Combinational Logic Block**

Design a purely combinational Verilog module named `dut` that implements two independent logic functions. There is no clock, no reset, and no stored state: each output must respond only to the current values of its inputs.

**Ports (all 1-bit):**

| Name | Direction |
|------|-----------|
| `p1a` | input |
| `p1b` | input |
| `p1c` | input |
| `p1d` | input |
| `p1e` | input |
| `p1f` | input |
| `p1y` | output |
| `p2a` | input |
| `p2b` | input |
| `p2c` | input |
| `p2d` | input |
| `p2y` | output |

**Behavior:**

- **`p1y`** is asserted (logic 1) when at least one of these two conditions holds:
  - at least one of `p1a`, `p1b`, `p1c` is 1;
  - all three of `p1d`, `p1e`, `p1f` are 1.

  Otherwise `p1y` is 0. In particular, `p1y` is 0 only when `p1a`, `p1b` and `p1c` are all 0 and at least one of `p1d`, `p1e`, `p1f` is 0.

- **`p2y`** is asserted (logic 1) when at least one of these two conditions holds:
  - both `p2a` and `p2b` are 1;
  - both `p2c` and `p2d` are 1.

  Otherwise `p2y` is 0.

The two functions share no inputs, so the groups `p1*` and `p2*` do not influence each other's outputs.

Your module must use the exact module name, port names, directions and widths given above. Your design will be checked for formal equivalence against a reference implementation.

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
