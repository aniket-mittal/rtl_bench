# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Two-Input Combinational Gate**

Design a Verilog module named `dut` that implements a simple two-input logic function.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 1 bit |
| `y`  | input     | 1 bit |
| `z`  | output    | 1 bit |

**Behavior**

The circuit is purely combinational. There is no clock, no reset, and no stored state. The output `z` must respond to changes on the inputs with no memory of prior values.

The output `z` is logic 1 only when both inputs are logic 0. In every other input combination, at least one input is logic 1, and `z` must be logic 0.

Truth table summary:

| `x` | `y` | `z` |
|-----|-----|-----|
| 0   | 0   | 1   |
| 0   | 1   | 0   |
| 1   | 0   | 0   |
| 1   | 1   | 0   |

**Requirements**

- The module name must be exactly `dut`.
- Port names, directions, and widths must match the table above exactly.
- The design must be purely combinational (no latches, no flip-flops).
- Do not add any additional ports.

**Example**

- `x = 0`, `y = 0` → `z = 1`
- `x = 1`, `y = 0` → `z = 0`
- `x = 1`, `y = 1` → `z = 0`

Your task is to write the synthesizable RTL for this module.

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
