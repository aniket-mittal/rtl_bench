# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Sign-Extension Variant (8-bit to 32-bit)**

Design a purely combinational Verilog module named `dut` that widens an 8-bit input value into a 32-bit output value.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in` | input | 8 bits ([7:0]) |
| `out` | output | 32 bits ([31:0]) |

**Behavior**

- The lower 8 bits of `out` (bits [7:0]) must be an exact copy of `in`.
- The upper 24 bits of `out` (bits [31:8]) must all be set to the same single value, which is taken from bit 6 of `in` (the second most significant bit of the input), not from bit 7.
- Consequently, bit 7 of `in` appears only in bit 7 of `out` and has no influence on any of the upper 24 bits.

**Requirements**

- The circuit has no clock, no reset, and no internal state. The output must update immediately whenever the input changes.
- Every one of the 256 possible input values must be handled according to the rules above. There are no special cases or don't-care conditions.

**Examples**

| `in` (binary) | `out` (hex) |
|---------------|-------------|
| `00000000` | `0x00000000` |
| `01000000` | `0xFFFFFF40` |
| `10000000` | `0x00000080` |
| `11000001` | `0xFFFFFFC1` |
| `01111111` | `0xFFFFFF7F` |

Note that this is intentionally not a standard sign extension: the replicated bit is bit 6, so an input with bit 7 set and bit 6 clear produces zeros in the upper 24 bits.

Write the module so that its port names, directions, and widths match the table above exactly.

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
