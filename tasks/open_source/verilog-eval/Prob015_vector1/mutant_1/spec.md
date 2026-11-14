**Byte Swap**

Design a purely combinational Verilog module named `dut` that rearranges the two bytes of a 16-bit input word.

**Ports**

| Name     | Direction | Width  |
|----------|-----------|--------|
| `in`     | input     | 16 bits ([15:0]) |
| `out_hi` | output    | 8 bits ([7:0])  |
| `out_lo` | output    | 8 bits ([7:0])  |

**Behavior**

The module takes the 16-bit input `in` and splits it into its upper byte (bits 15:8) and its lower byte (bits 7:0). Despite what the output names might suggest, the outputs are assigned in a crossed fashion:

- `out_hi` must carry the **lower** byte of `in` (bits 7:0), with bit ordering within the byte preserved (bit 0 of `in` maps to bit 0 of `out_hi`, and so on).
- `out_lo` must carry the **upper** byte of `in` (bits 15:8), with bit ordering within the byte preserved (bit 8 of `in` maps to bit 0 of `out_lo`, and so on).

In other words, concatenating the outputs as `{out_lo, out_hi}` must reproduce `in` exactly.

**Requirements**

- The circuit is purely combinational: no clock, no reset, no state. Outputs must update immediately whenever `in` changes.
- No bits are inverted, reversed, or otherwise modified; every output bit is a direct copy of exactly one input bit.
- The module name and all port names and widths must match the table above exactly.

**Example**

- `in = 16'hABCD` → `out_hi = 8'hCD`, `out_lo = 8'hAB`
- `in = 16'h0001` → `out_hi = 8'h01`, `out_lo = 8'h00`
- `in = 16'h8000` → `out_hi = 8'h00`, `out_lo = 8'h80`
