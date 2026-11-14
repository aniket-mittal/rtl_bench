**Byte Split and Fold**

Design a purely combinational Verilog module named `dut` that splits a 16-bit input word into two bytes and produces two 8-bit outputs.

**Ports**

| Name     | Direction | Width  |
|----------|-----------|--------|
| `in`     | input     | 16 bits ([15:0]) |
| `out_hi` | output    | 8 bits ([7:0])  |
| `out_lo` | output    | 8 bits ([7:0])  |

**Behavior**

Treat `in` as two bytes: the upper byte (bits 15 down to 8) and the lower byte (bits 7 down to 0).

- `out_hi` must pass the upper byte of `in` through unchanged.
- `out_lo` must be the bitwise combination of the lower byte and the upper byte, where each bit position `i` of `out_lo` is 1 exactly when bit `i` of the lower byte and bit `i` of the upper byte differ.

There is no clock and no reset. Both outputs must respond immediately to any change in `in`, and there is no stored state. There are no special cases: the same rule applies to all 65,536 possible input values (for example, if `in` is `16'hFFFF`, then `out_hi` is `8'hFF` and `out_lo` is `8'h00`; if `in` is `16'h0000`, both outputs are `8'h00`).

**Requirements**

- Use the exact module name and port names, directions, and widths given above.
- The design must be fully combinational.
- Your solution will be checked for formal equivalence against a reference implementation, so the behavior must match exactly for every input.
