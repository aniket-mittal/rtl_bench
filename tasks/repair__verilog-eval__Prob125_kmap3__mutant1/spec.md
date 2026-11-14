# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Four-Input Combinational Function with Unknown Outputs**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 |
| `b`  | input     | 1 |
| `c`  | input     | 1 |
| `d`  | input     | 1 |
| `out`| output    | 1 |

Treat the inputs as a 4-bit value N = {a, b, c, d}, where `a` is the most significant bit and `d` is the least significant bit (N ranges from 0 to 15). The output `out` must respond immediately to any input change. There is no clock and no reset.

The output is defined for each value of N as follows:

- `out` = 1 when N is 2, 8, 10, 11, 12, 14, or 15.
- `out` = 0 when N is 0, 1, 3, 5, 6, or 7.
- `out` = unknown (the Verilog `x` value, not 0 or 1) when N is 4, 9, or 13.

Every one of the 16 input combinations is covered above, so there is no case in which `out` retains a previous value.

The unknown outputs are intentional. For N = 4, 9, and 13 the module must drive `out` to the literal 1'bx rather than a resolved 0 or 1. Do not optimize these cases into known values, since the result is checked for exact equivalence, including these unknown outputs.

**Requirements:**
- The module name and port names must match the table exactly.
- `out` must be a single-bit output.
- The design must be combinational, with no latches or sequential elements.
- The behavior must match the specification for all 16 input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
