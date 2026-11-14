# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: Five-Input Pattern Mixer**

Design a purely combinational Verilog module named `dut` with the following ports:

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1     |
| `b`  | input     | 1     |
| `c`  | input     | 1     |
| `d`  | input     | 1     |
| `e`  | input     | 1     |
| `out`| output    | 25    |

There is no clock or reset. `out` must respond immediately to any input change.

The output is the bitwise XOR of two 25-bit vectors, called Vector X and Vector Y.

**Vector X** consists of five groups of five identical bits. Listed from the most significant bit (bit 24) down to bit 0, the groups are:
1. Five copies of `a`
2. Five copies of `c`
3. Five copies of `b`
4. Five copies of `d`
5. Five copies of `e`

Note that the order of the middle groups is `c` then `b`, not alphabetical. Every bit of Vector X is then inverted.

**Vector Y** is the five-bit sequence `a, b, c, d, e` (with `a` as the leftmost bit) repeated five times, filling all 25 bits. Bit 24 is `a`, bit 23 is `b`, bit 22 is `c`, bit 21 is `d`, bit 20 is `e`, bit 19 is `a` again, and so on down to bit 0.

The result is `out = (inverted Vector X) XOR Vector Y`.

**Example:** If `a=1, b=0, c=0, d=0, e=0`:
- Vector X = `11111 00000 00000 00000 00000`, which is `1111100000000000000000000` before inversion.
- Inverted, it becomes `0000011111111111111111111`.
- Vector Y = `10000` repeated five times.
- XORing the two vectors gives `out`.

Your implementation will be checked for formal equivalence against a reference design, so port names, widths and bit ordering must match exactly.

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
