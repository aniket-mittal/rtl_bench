# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Byte Rotate-and-Clear Shuffler**

Design a purely combinational Verilog module named `dut` that rearranges the bytes of a 32-bit word.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in` | input | 32 bits |
| `out` | output | 32 bits |

**Behavior**

Treat both `in` and `out` as four bytes, numbered from least significant (byte 0, bits [7:0]) to most significant (byte 3, bits [31:24]).

The output bytes are formed as follows:

- Output byte 0 (the least significant byte) is always `8'h00`.
- Output byte 1 is a copy of input byte 2.
- Output byte 2 is a copy of input byte 1.
- Output byte 3 (the most significant byte) is a copy of input byte 0.
- Input byte 3 (bits [31:24] of `in`) is discarded and does not influence the output.

Bit order inside each byte is preserved; only the byte positions change.

**Requirements**

- The circuit has no clock and no reset. The output must respond combinationally to any change in `in`.
- No state or latches are allowed.
- The module must use exactly the name `dut` and the port names `in` and `out` with the widths shown above.

**Examples**

| `in` | `out` |
|------|-------|
| `32'hAABBCCDD` | `32'hDDCCBB00` |
| `32'h01020304` | `32'h04030200` |
| `32'hFF000000` | `32'h00000000` |
| `32'h000000FF` | `32'hFF000000` |

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
