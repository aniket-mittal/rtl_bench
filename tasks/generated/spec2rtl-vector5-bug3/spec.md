# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Input Pattern Comparator**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 |
| `b`  | input     | 1 |
| `c`  | input     | 1 |
| `d`  | input     | 1 |
| `e`  | input     | 1 |
| `out`| output    | 25 |

There is no clock or reset. `out` must respond immediately to any input change.

**Behavior**

Treat the five inputs as a 5-bit word `W` with `a` as the most significant bit and `e` as the least significant bit, so `W = {a,b,c,d,e}`.

Split `out` into five consecutive 5-bit fields, from `out[24:20]` (the top field) down to `out[4:0]` (the bottom field). Each field is `W` bitwise XORed with a "mask" word:

- Top field `out[24:20]`: the mask is five copies of the **inverted** value of `a`.
- Second field `out[19:15]`: the mask is five copies of `b`.
- Third field `out[14:10]`: the mask is five copies of `c`.
- Fourth field `out[9:5]`: the mask is five copies of `d`.
- Bottom field `out[4:0]`: the mask is five copies of `e`.

Within every field, the bit positions line up with `W`, so the MSB of the field is XORed with `a`, and the LSB of the field is XORed with `e`.

**Edge cases and notes**

- Only the top field uses an inverted input. The other four fields use their inputs unmodified.
- The result is defined for all 32 input combinations. There are no don't-care cases.

Implement the module so that its output matches this description exactly for every input combination.

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
| `e` | in | 1 |  |
| `out` | out | 25 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
