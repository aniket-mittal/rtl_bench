# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Byte Shuffle with Dropped Bit**

Design a purely combinational Verilog module named `dut` with the following ports:

- `input [31:0] in`: 32-bit input word
- `output [31:0] out`: 32-bit output word

**Behavior**

The module rearranges the byte-sized fields of `in` into `out`. There is no clock or reset, and `out` must respond combinationally to any change in `in`.

Number the bits of both words 0 to 31, with bit 0 as the least significant bit. The output is built as follows:

- The most significant bit of `out` (bit 31) is always `0`.
- Output bits 30 down to 23 hold the lowest byte of the input (bits 7 down to 0), with its bit order preserved.
- Output bits 22 down to 15 hold the second-lowest byte of the input (bits 15 down to 8), with its bit order preserved.
- Output bits 14 down to 8 hold only a 7-bit field taken from the input (bits 22 down to 16), with its bit order preserved. Input bit 23 is **not** used anywhere in the output.
- Output bits 7 down to 0 hold the highest byte of the input (bits 31 down to 24), with its bit order preserved.

Within each field, bit order is not reversed. Only the positions of the fields change.

**Example**

- `in = 32'hAABBCCDD` gives `out = 32'h6EF7_5BAA` & `32'h7FFFFFFF`. Computing it field by field: the low byte `DD` goes to bits 30:23, `CC` goes to bits 22:15, the 7-bit field `in[22:16]` (`0x3B`) goes to bits 14:8, and `AA` goes to bits 7:0. Bit 31 is `0`.

Your module must match this specification exactly for all 2^32 input values.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 32 |  |
| `out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
