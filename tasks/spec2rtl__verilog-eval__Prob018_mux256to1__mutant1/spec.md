# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Bit-Swapped 256-to-1 Multiplexer**

Design a purely combinational Verilog module named `dut` that selects a single bit from a 256-bit input vector using a select value whose two lowest bits are interchanged.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in`  | input  | 256 bits (`[255:0]`) |
| `sel` | input  | 8 bits (`[7:0]`) |
| `out` | output | 1 bit |

**Behavior**

The module outputs one bit of `in`. The index of that bit is derived from `sel` as follows:

- Bits 7 down to 2 of `sel` are used unchanged as the upper six bits of the index.
- The two lowest bits of the index are swapped relative to `sel`: index bit 0 is taken from `sel[1]`, and index bit 1 is taken from `sel[0]`.

`out` is the bit of `in` at that index. For example:

- `sel = 8'd0` selects `in[0]`.
- `sel = 8'd1` selects `in[2]`.
- `sel = 8'd2` selects `in[1]`.
- `sel = 8'd3` selects `in[3]`.
- `sel = 8'd4` selects `in[4]`.
- `sel = 8'd255` selects `in[255]`.

**Requirements**

- The circuit must be purely combinational: there is no clock, no reset, and no stored state. `out` must respond immediately to any change in `in` or `sel`.
- All 256 values of `sel` are valid, and every one maps to a distinct bit of `in`, so no out-of-range handling is needed.
- Port names, directions, and widths must match the table exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 256 |  |
| `sel` | in | 8 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
