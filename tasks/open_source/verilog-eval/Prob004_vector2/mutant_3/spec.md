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
