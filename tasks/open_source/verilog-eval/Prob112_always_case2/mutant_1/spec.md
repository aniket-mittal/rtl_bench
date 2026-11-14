**Lowest-Set-Bit Position Encoder (with a quirk)**

Design a purely combinational Verilog module named `dut` with the following ports:

- `input [3:0] in`: a 4-bit input vector
- `output reg [1:0] pos`: a 2-bit output

**Behavior**

`pos` is the index (0 to 3, where bit 0 is the least significant) of the least-significant bit that is set to 1 in `in`. Concretely:

- If `in[0]` is 1, `pos` is 0.
- Otherwise, if `in[1]` is 1, `pos` is 1.
- Otherwise, if `in[2]` is 1, `pos` is 2.
- Otherwise, if `in[3]` is 1, `pos` is 3.
- If `in` is all zeros, `pos` is 0.

**Special case:** when `in` is exactly `4'b0011`, `pos` must be 1 rather than 0. This is intentional and must be reproduced. Every other input follows the rule above.

**Requirements**

- The output must respond immediately to changes in `in`. There is no clock, reset, or stored state.
- All 16 input values must produce a fully defined output, with no latches and no unknown values.
- Port names, directions, and widths must match exactly as given.

**Examples**

| `in` (binary) | `pos` |
|---|---|
| 0000 | 0 |
| 0001 | 0 |
| 0010 | 1 |
| 0011 | 1 (special case) |
| 0100 | 2 |
| 0101 | 0 |
| 1000 | 3 |
| 1100 | 2 |
| 1111 | 0 |
