# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**256-to-1 Multiplexer with Offset Select**

Design a purely combinational module named `dut` that selects a single bit from a wide input vector, using an offset select value.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in`  | input  | 256 bits (`[255:0]`) |
| `sel` | input  | 8 bits (`[7:0]`) |
| `out` | output | 1 bit |

**Functionality**

The output `out` is the bit of `in` whose index is one greater than the value of `sel`. That is, `sel = 0` selects `in[1]`, `sel = 1` selects `in[2]`, and so on, up to `sel = 254` selecting `in[255]`.

The select value is treated as an unsigned 8-bit quantity, and the increment is performed in that same 8-bit width, so the computed index does not grow beyond 8 bits. Consequently, when `sel = 255`, the index wraps around and the output is `in[0]`.

**Requirements**

- The circuit is purely combinational: there is no clock, no reset, and no stored state. `out` must respond immediately to any change in `in` or `sel`.
- Every one of the 256 possible values of `sel` must map to a valid bit of `in`, so there are no out-of-range cases to handle.
- Port names, directions, and widths must match the table exactly.

**Example**

- If `sel = 8'd0`, then `out = in[1]`.
- If `sel = 8'd9`, then `out = in[10]`.
- If `sel = 8'd254`, then `out = in[255]`.
- If `sel = 8'd255`, then `out = in[0]`.

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
