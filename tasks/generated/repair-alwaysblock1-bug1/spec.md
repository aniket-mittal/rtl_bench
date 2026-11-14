# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual Logic Outputs**

Design a purely combinational Verilog module named `dut` that takes two single-bit inputs and produces two single-bit outputs, each computed by a different logic function of the inputs.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `a` | input | 1 |
| `b` | input | 1 |
| `out_assign` | output | 1 |
| `out_alwaysblock` | output (driven from a procedural block) | 1 |

**Required behavior**

- `out_assign` must be 1 only when both `a` and `b` are 1. In every other case it is 0.
- `out_alwaysblock` must be 1 only when `a` is 1 and `b` is 0. In every other case it is 0. Note that this is *not* the same function as `out_assign`: the two outputs are intentionally different.

**Timing and other requirements**

- Both outputs are purely combinational. There is no clock, no reset, and no stored state. Each output must respond immediately to any change on `a` or `b`.
- `out_alwaysblock` should be declared as a `reg` so that it can be driven from a combinational procedural block (`always @(*)`), while `out_assign` should be driven by a continuous assignment.
- There are no unusual edge cases: every one of the four input combinations (`a`,`b`) = 00, 01, 10, 11 must produce a fully defined 0 or 1 on both outputs.

**Truth table for reference**

| a | b | out_assign | out_alwaysblock |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |

Your module will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `out_assign` | out | 1 | |
| `out_alwaysblock` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
