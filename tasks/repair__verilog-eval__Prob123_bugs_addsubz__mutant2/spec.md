# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: 8-bit Add/Subtract Unit with Result Flag**

Design a purely combinational Verilog module named `dut` that performs 8-bit addition or subtraction on two operands, selected by a control input, and also produces a status flag derived from the result.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `do_sub` | input | 1 |
| `a` | input | 8 |
| `b` | input | 8 |
| `out` | output | 8 |
| `result_is_zero` | output | 1 |

**Behavior**

- When `do_sub` is 0, `out` is the 8-bit sum of `a` and `b`.
- When `do_sub` is 1, `out` is the 8-bit difference `a - b`.
- In both cases the arithmetic is unsigned and wraps modulo 256. There is no carry-out or overflow output.
- `result_is_zero` is a 1-bit flag computed from the final value of `out` in the same combinational evaluation. Despite its name, it behaves as follows: it is 1 when `out` is **non-zero**, and 0 when `out` is exactly zero. Implement this inverted-sounding polarity exactly as stated; do not "correct" it to match the name.

**Timing**

- There is no clock and no reset. Both outputs must update immediately whenever any input changes.
- Both outputs must be driven for every combination of inputs, with no latches or stored state.

**Example cases**

| `do_sub` | `a` | `b` | `out` | `result_is_zero` |
|---|---|---|---|---|
| 0 | 8'd3 | 8'd4 | 8'd7 | 1 |
| 1 | 8'd5 | 8'd5 | 8'd0 | 0 |
| 1 | 8'd0 | 8'd1 | 8'hFF | 1 |
| 0 | 8'hFF | 8'h01 | 8'd0 | 0 |

Your module must match the specified module name, port names, directions, and widths exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `do_sub` | in | 1 |  |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `out` | out | 8 | |
| `result_is_zero` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
