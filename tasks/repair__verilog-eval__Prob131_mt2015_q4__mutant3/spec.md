# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Inhibited Signal Detector**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 1 bit |
| `y`  | input     | 1 bit |
| `z`  | output    | 1 bit |

**Behavior**

The module acts as a gated signal with an inhibit control. Input `x` is the data signal, and input `y` is an inhibit line. The output `z` should be asserted (logic 1) only when the data signal `x` is asserted while the inhibit line `y` is *not* asserted. In every other situation, `z` must be logic 0.

**Requirements**

- The circuit is combinational: `z` must respond immediately to any change on `x` or `y`. There is no clock, no reset, and no stored state.
- Both inputs are single-bit signals.
- The behavior must be fully specified by the following truth table:

| x | y | z |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

**Notes**

- The roles of `x` and `y` are not symmetric: swapping them changes the function.
- Use exactly the module name and port names given above. Your design will be checked for formal equivalence against a reference implementation.

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
