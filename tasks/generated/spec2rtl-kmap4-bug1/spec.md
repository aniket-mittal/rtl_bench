# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational 4-Input Logic Function**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `out`| output    | 1 bit |

There is no clock and no reset. The output must respond immediately to any change on the inputs.

Treat the four inputs as a 4-bit value `N = {a, b, c, d}`, where `a` is the most significant bit and `d` is the least significant bit. The output `out` is a function of `N` only:

- `out` is **1** when `N` is one of: 1, 2, 4, 7, 8, 11, 13, 14, 15.
- `out` is **0** when `N` is one of: 0, 3, 5, 6, 9, 10, 12.

All 16 input combinations are covered by the two lists above. There are no don't-care cases, and the output must never be unknown or hold a previous value.

Your module will be checked by formal equivalence against a reference design, so the module name, port names, and port widths must match exactly. Any logic structure is acceptable as long as the function matches the table above for every input combination.

**Examples**

- `a=0, b=0, c=0, d=0` (N=0) gives `out = 0`
- `a=0, b=0, c=0, d=1` (N=1) gives `out = 1`
- `a=0, b=1, c=1, d=0` (N=6) gives `out = 0`
- `a=1, b=0, c=1, d=1` (N=11) gives `out = 1`
- `a=1, b=1, c=0, d=0` (N=12) gives `out = 0`
- `a=1, b=1, c=1, d=1` (N=15) gives `out = 1`

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
