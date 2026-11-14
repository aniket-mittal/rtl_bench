# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Two-Input Combinational Gate**

Design a Verilog module named `dut` that implements a simple purely combinational logic gate.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 1 bit |
| `y`  | input     | 1 bit |
| `z`  | output    | 1 bit |

**Behavior**

The output `z` must be asserted (logic 1) whenever at least one of the inputs `x` or `y` is logic 1. The output must be logic 0 only when both `x` and `y` are logic 0.

**Requirements**

- The circuit is purely combinational: there is no clock, no reset, and no internal state. The output must respond to changes on the inputs with no memory of previous values.
- All ports are single-bit scalars. Use the exact module name and port names given above.
- No additional ports are permitted.

**Truth table**

| x | y | z |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

Your task is to write the module so that its input/output behavior matches the description exactly.

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
