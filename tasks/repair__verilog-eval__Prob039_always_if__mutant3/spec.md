# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual-Output 2-to-1 Selector**

Design a purely combinational Verilog module named `dut` that produces two outputs from two data inputs and two select-control inputs, using two different selection rules.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `a` | input | 1 |
| `b` | input | 1 |
| `sel_b1` | input | 1 |
| `sel_b2` | input | 1 |
| `out_assign` | output | 1 |
| `out_always` | output (driven from a procedural block) | 1 |

**Behavior**

Both outputs choose between the data inputs `a` and `b`. The two outputs differ only in the condition under which they pick `b` rather than `a`:

- `out_assign` must equal `b` when the two select inputs `sel_b1` and `sel_b2` have *different* values. Otherwise (both 0 or both 1), it must equal `a`.
- `out_always` must equal `b` only when *both* `sel_b1` and `sel_b2` are 1. In every other case (including when only one is 1, or both are 0), it must equal `a`.

**Requirements**

- There is no clock and no reset; both outputs must respond immediately to any change in the inputs.
- `out_always` must be declared as a `reg` type driven by a combinational procedural block, while `out_assign` must be driven by a continuous assignment.
- No latches or stored state are allowed. Every input combination must fully determine both outputs.

**Example**

| a | b | sel_b1 | sel_b2 | out_assign | out_always |
|---|---|---|---|---|---|
| 0 | 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 | 1 |
| 1 | 0 | 1 | 1 | 1 | 0 |

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `sel_b1` | in | 1 |  |
| `sel_b2` | in | 1 |  |
| `out_assign` | out | 1 | |
| `out_always` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
