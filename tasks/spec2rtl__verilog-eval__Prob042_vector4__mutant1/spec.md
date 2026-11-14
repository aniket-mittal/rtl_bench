# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Partial Sign Extender**

Design a purely combinational Verilog module named `dut` that widens an 8-bit value to 32 bits.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in` | input | 8 bits |
| `out` | output | 32 bits |

**Behavior**

Treat `in` as an 8-bit two's-complement number. The module first sign-extends it to a 31-bit value, then places that 31-bit value into the low bits of the 32-bit output `out`.

Unlike a standard sign extender, the result is **not** a full 32-bit sign extension. The most significant bit of `out` is always `0`, regardless of the input.

Examples (hex values):

- `in = 8'h05` gives `out = 32'h0000_0005`
- `in = 8'h7F` gives `out = 32'h0000_007F`
- `in = 8'h80` gives `out = 32'h7FFF_FF80`
- `in = 8'hFF` gives `out = 32'h7FFF_FFFF`

**Requirements**

- The design must be combinational, with no clock, reset, or state.
- `out` must update whenever `in` changes.
- The port names, directions, and widths must match the table exactly.
- Your output must match the behavior above for all 256 possible input values, including the top-bit case.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 8 |  |
| `out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
