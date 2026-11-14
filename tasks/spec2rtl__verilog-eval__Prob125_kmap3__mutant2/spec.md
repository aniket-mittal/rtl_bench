# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Four-Input Combinational Lookup with Unknown Outputs**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 |
| `b`  | input     | 1 |
| `c`  | input     | 1 |
| `d`  | input     | 1 |
| `out`| output (reg) | 1 |

`out` is a function of the four inputs only. It has no clock, no reset and no stored state, and it must respond immediately to any input change.

Treat the inputs as a 4-bit selector in the order `{b, a, c, d}`, with `b` as the most significant bit and `d` as the least significant bit. Write each row as `(b a c d)`. The output must be:

- **Logic 1** for these combinations:
  - `0010`, `0011`
  - `1000`, `1010`, `1011`
  - `1100`, `1110`, `1111`
- **Logic 0** for these combinations:
  - `0000`, `0001`
  - `0101`, `0110`, `0111`
- **Unknown (`1'bx`)** for these combinations:
  - `0100`
  - `1001`
  - `1101`

The unknown value must be driven deliberately as `1'bx` in those three cases. It is not a don't-care you may resolve to 0 or 1. All 16 input combinations are listed above, so no other cases need handling.

**Requirements**
- The module name, port names, directions and widths must match the table exactly.
- Use a combinational description with no latches.
- The behavior must match the specification for all 16 input combinations, including the three that produce `x`.

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
