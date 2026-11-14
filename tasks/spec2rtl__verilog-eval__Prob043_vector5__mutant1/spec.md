# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Pairwise XOR Grid**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `e`  | input     | 1 bit |
| `out`| output    | 25 bits, `out[24:0]` |

**Behavior**

Treat the five inputs as an ordered list: `a` is item 0, `b` is item 1, `c` is item 2, `d` is item 3, `e` is item 4.

Read `out` from the most significant bit (bit 24) down to the least significant bit (bit 0) as a 5×5 grid in row-major order. Each row holds five consecutive bits, and the first row occupies bits 24 down to 20.

The bit at row *r* and column *k* (both numbered 0 to 4, starting from the top-left, which is bit 24) is the XOR of input item *r* and input item *k*.

For example:
- The top row (bits 24 to 20) is `a^a, a^b, a^c, a^d, a^e`, which is `0, a^b, a^c, a^d, a^e`.
- The second row (bits 19 to 15) is `b^a, b^b, b^c, b^d, b^e`.
- The bottom row (bits 4 to 0) is `e^a, e^b, e^c, e^d, e^e`.

Consequently, the five "diagonal" bits of the grid are always 0, and the grid is symmetric in the sense that the entry for (*r*, *k*) equals the entry for (*k*, *r*).

**Requirements**

- No clock or reset. The output must respond combinationally to any input change.
- The module must be synthesizable.
- Port names, directions and widths must match the table exactly.

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
