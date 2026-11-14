# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Two-Input Gate**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 1 bit |
| `y`  | input     | 1 bit |
| `z`  | output    | 1 bit |

**Behavior**

The output `z` must be a function of the two single-bit inputs `x` and `y` only. There is no clock, no reset, and no stored state: whenever either input changes, `z` must reflect the new result immediately.

`z` should be logic 1 only when both `x` and `y` are logic 1. For every other input combination (`x`=0 or `y`=0), `z` must be logic 0.

**Truth table**

| x | y | z |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

**Requirements**

- The module name and port names must match exactly as given above.
- All ports are scalar (1-bit) signals.
- The design must be combinational, with no latches, flip-flops, or other sequential elements.
- Your submission will be checked for formal equivalence against a reference design, so the input/output behavior must match the truth table for every input combination.

Write the Verilog module that implements this behavior.

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
