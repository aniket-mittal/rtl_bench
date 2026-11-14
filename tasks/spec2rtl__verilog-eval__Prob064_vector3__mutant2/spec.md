# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Six-Field Byte Repacker**

Design a purely combinational Verilog module named `dut` that packs six 5-bit input fields into four 8-bit output bytes.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input  | 5 bits ([4:0]) |
| `b`  | input  | 5 bits ([4:0]) |
| `c`  | input  | 5 bits ([4:0]) |
| `d`  | input  | 5 bits ([4:0]) |
| `e`  | input  | 5 bits ([4:0]) |
| `f`  | input  | 5 bits ([4:0]) |
| `w`  | output | 8 bits ([7:0]) |
| `x`  | output | 8 bits ([7:0]) |
| `y`  | output | 8 bits ([7:0]) |
| `z`  | output | 8 bits ([7:0]) |

**Behavior**

Form one 32-bit stream by placing the fields back to back, from most significant to least significant, in this order: `a`, `b`, `c`, `e`, `d`, `f`. Note that `e` comes before `d`. Each field keeps its internal bit order, with its MSB first. Append the constant 2-bit value `11` after `f`, so these two bits are the least significant bits of the stream. The stream is 5×6 + 2 = 32 bits.

Split the stream into four consecutive bytes, from the most significant end:
- `w` is the top byte (stream bits 31 down to 24).
- `x` is the next byte (bits 23 down to 16).
- `y` is the next byte (bits 15 down to 8).
- `z` is the bottom byte (bits 7 down to 0).

Fields can straddle byte boundaries. For example, `w` contains all of `a` plus the upper bits of `b`.

There is no clock and no reset. Each output must update immediately whenever any input changes. No input is ignored, and no output is ever undefined.

Your module must use exactly the module name and port names, directions, and widths given above.

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
