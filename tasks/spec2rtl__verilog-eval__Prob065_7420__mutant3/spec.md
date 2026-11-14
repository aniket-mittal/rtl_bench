# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Dual 4-Input NAND Gates with Cross-Wired Outputs**

Design a purely combinational Verilog module named `dut` that contains two 4-input NAND gate functions, similar to a dual 4-input NAND IC (such as the 7420), but with an unusual pin assignment: each gate's output is driven by the *other* gate's inputs.

**Ports**

| Name  | Direction | Width |
|-------|-----------|-------|
| `p1a` | input     | 1 |
| `p1b` | input     | 1 |
| `p1c` | input     | 1 |
| `p1d` | input     | 1 |
| `p1y` | output    | 1 |
| `p2a` | input     | 1 |
| `p2b` | input     | 1 |
| `p2c` | input     | 1 |
| `p2d` | input     | 1 |
| `p2y` | output    | 1 |

**Required behavior**

- `p1y` must be the 4-input NAND of the four inputs belonging to group 2 (`p2a`, `p2b`, `p2c`, `p2d`). It is 0 only when all four of those inputs are 1; otherwise it is 1. The group 1 inputs have no influence on `p1y`.
- `p2y` must be the 4-input NAND of the four inputs belonging to group 1 (`p1a`, `p1b`, `p1c`, `p1d`). It is 0 only when all four of those inputs are 1; otherwise it is 1. The group 2 inputs have no influence on `p2y`.

**Constraints**

- The design is purely combinational: no clock, no reset, no state, and no latches.
- Outputs must respond to input changes with no registered delay.
- Use the exact module name, port names, directions, and widths given above. Note that the cross-wiring is intentional and must be preserved; do not "fix" it so that each output depends on its own group's inputs.

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
