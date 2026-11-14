# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Four-Input Combinational Detector**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`   | input  | 1 |
| `b`   | input  | 1 |
| `c`   | input  | 1 |
| `d`   | input  | 1 |
| `out` | output | 1 |

There is no clock and no reset. `out` must respond to input changes with no storage or state.

Treat the inputs as a 4-bit number `N = {a, b, c, d}`, where `a` is the most significant bit and `d` is the least significant bit. The output `out` must be `1` when `N` is one of the following decimal values:

**0, 1, 2, 4, 6, 8, 9, 11, 15**

For every other value of `N` (that is, 3, 5, 7, 10, 12, 13, 14), `out` must be `0`.

Every one of the 16 input combinations is fully specified, so there are no don't-care cases. Your implementation will be checked by formal equivalence against a reference design, so the port names, directions and widths must match exactly, and the logic function must match for all 16 input combinations.

**Example behavior**
- `a=0, b=0, c=0, d=0` (N = 0) → `out = 1`
- `a=0, b=0, c=1, d=1` (N = 3) → `out = 0`
- `a=1, b=0, c=1, d=1` (N = 11) → `out = 1`
- `a=1, b=1, c=1, d=0` (N = 14) → `out = 0`

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
