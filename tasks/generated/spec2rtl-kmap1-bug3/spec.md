# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Three-Input Gate with an Unused Input**

Design a purely combinational Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `out`| output    | 1 bit |

**Behavior**

The output `out` must be a logic function of the inputs, updating immediately whenever any input changes. There is no clock, no reset, and no stored state.

The output is `1` whenever at least one of `a` or `b` is `1`, and `0` only when both `a` and `b` are `0`.

The input `c` is part of the interface and must be declared exactly as specified, but it has no influence on the output. Whether `c` is `0` or `1`, the output must be identical for every combination of `a` and `b`.

**Truth table (c is a don't-care for the result)**

| a | b | c | out |
|---|---|---|-----|
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 |

**Requirements**

- The module name must be exactly `dut`.
- All ports must match the names, directions, and widths above.
- The design must be combinational, with no latches or registers.

Your submission will be checked for formal equivalence against a reference design.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
