# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Single-Output Gate with an Unused Input**

Design a purely combinational Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 1 bit |
| `y`  | input     | 1 bit |
| `z`  | output    | 1 bit |

**Behavior**

The output `z` must respond only to input `x`. Input `y` is part of the interface but must have no influence on the output under any circumstances.

When `x` is logic 0, `z` must be logic 0. When `x` is logic 1, `z` must be logic 1. In other words, `z` always takes on the same value as `x`.

**Requirements**

- The design is purely combinational: there is no clock, no reset, and no stored state.
- The output must update immediately whenever `x` changes.
- Changes on `y` must never affect `z`.
- Port names, directions, and widths must match the table above exactly, including the unused input `y`, which must remain in the port list.
- Use a continuous assignment or equivalent combinational logic; do not infer latches or flip-flops.

**Examples**

| x | y | z |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

Your submission will be checked for formal equivalence against a reference implementation, so the module name and all port names and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `x` | in | 1 |  |
| `y` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
