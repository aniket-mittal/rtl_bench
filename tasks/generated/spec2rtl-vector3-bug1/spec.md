# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Bit Packer and Splitter**

Design a purely combinational Verilog module named `dut` that rearranges the bits of six 5-bit inputs into four 8-bit outputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 5 bits [4:0] |
| `b`  | input     | 5 bits [4:0] |
| `c`  | input     | 5 bits [4:0] |
| `d`  | input     | 5 bits [4:0] |
| `e`  | input     | 5 bits [4:0] |
| `f`  | input     | 5 bits [4:0] |
| `w`  | output    | 8 bits [7:0] |
| `x`  | output    | 8 bits [7:0] |
| `y`  | output    | 8 bits [7:0] |
| `z`  | output    | 8 bits [7:0] |

**Behavior**

Conceptually, build one 32-bit bus by concatenating the following fields, from the most significant bit down to the least significant bit:

1. The five bits of `a`, in **reversed** bit order (so `a[0]` comes first, at the top of the bus, followed by `a[1]`, `a[2]`, `a[3]`, and finally `a[4]`).
2. `b`, in its normal order (`b[4]` first, down to `b[0]`).
3. `c`, in normal order.
4. `d`, in normal order.
5. `e`, in normal order.
6. `f`, in normal order.
7. Two constant 1 bits at the very bottom (the two least significant bits of the bus).

This gives 5 + 25 + 2 = 32 bits in total. Split this bus into four consecutive bytes: `w` receives the top byte (bits 31:24), `x` the next byte (23:16), `y` the next byte (15:8), and `z` the lowest byte (7:0).

The circuit has no clock, no reset, and no internal state. Every output must update immediately whenever any input changes, and the outputs must be defined for every possible input value.

**Example**

If `a = 5'b00001` and every other input is all zeros, then the reversed form of `a` is `10000`, so `w = 8'b10000000`, `x = 8'h00`, `y = 8'h00`, and `z = 8'b00000011`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 5 |  |
| `b` | in | 5 |  |
| `c` | in | 5 |  |
| `d` | in | 5 |  |
| `e` | in | 5 |  |
| `f` | in | 5 |  |
| `w` | out | 8 | |
| `x` | out | 8 | |
| `y` | out | 8 | |
| `z` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
