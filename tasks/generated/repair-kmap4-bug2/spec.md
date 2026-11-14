# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Four-Input Logic Function**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `out`| output    | 1 bit |

There is no clock and no reset. `out` must respond only to the current values of the inputs and must never hold a previous value.

Treat the inputs as a 4-bit number formed by concatenating them, with `a` as the most significant bit and `d` as the least significant bit. That is, the value is `8a + 4b + 2c + d`, ranging from 0 to 15.

The output is defined for all 16 input combinations:

- `out` is 1 when the 4-bit value is one of: 1, 3, 4, 7, 8, 11, 13, 14.
- `out` is 0 for every other value: 0, 2, 5, 6, 9, 10, 12, 15.

Every input combination is fully specified, so there are no don't-care cases. Your circuit must match this truth table exactly. Any logically equivalent implementation is acceptable.

**Example**

- `a=0, b=0, c=0, d=1` (value 1) gives `out = 1`.
- `a=1, b=1, c=1, d=1` (value 15) gives `out = 0`.
- `a=0, b=1, c=1, d=0` (value 6) gives `out = 0`.

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
