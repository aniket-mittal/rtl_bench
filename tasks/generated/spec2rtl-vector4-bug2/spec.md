# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Byte Placement with Sign Fill**

Design a purely combinational Verilog module named `dut` that expands an 8-bit input into a 32-bit output.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in` | input | 8 bits ([7:0]) |
| `out` | output | 32 bits ([31:0]) |

**Behavior**

The 8-bit input value is placed in the most significant byte of the output, i.e. `out[31:24]` equals `in`. The remaining 24 low-order bits of the output, `out[23:0]`, must all be set to the same value as the most significant bit of the input, `in[7]`.

In other words:
- If `in[7]` is 0, the lower 24 bits of `out` are all 0.
- If `in[7]` is 1, the lower 24 bits of `out` are all 1.

Note that this is not a conventional sign extension: the input is not placed in the low byte with the sign bit replicated above it. Instead, the input occupies the top byte, and the sign bit is replicated below it.

**Requirements**

- The circuit has no clock and no reset; the output must respond immediately to any change in `in`.
- There is no state, and no special-case handling is needed for any input value. The behavior above applies uniformly to all 256 possible inputs.
- Use exactly the module name and port names/widths given above.

**Examples**

| `in` (binary) | `out` (hex) |
|---------------|-------------|
| `00000000` | `0x00000000` |
| `00000001` | `0x01000000` |
| `01111111` | `0x7F000000` |
| `10000000` | `0x80FFFFFF` |
| `10100101` | `0xA5FFFFFF` |
| `11111111` | `0xFFFFFFFF` |

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
