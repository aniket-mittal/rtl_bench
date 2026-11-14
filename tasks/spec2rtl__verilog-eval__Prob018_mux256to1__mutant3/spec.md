# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**256-to-1 Bit Selector with Oversized Select**

Design a combinational Verilog module named `dut` that selects a single bit from a wide input vector.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in` | input | 256 bits (`[255:0]`) |
| `sel` | input | 8 bits (`[7:0]`) |
| `out` | output | 1 bit |

**Behavior**

The output `out` is the bit of `in` whose index is given by the select input `sel`. Index 0 refers to the least significant bit of `in`, and index 255 refers to the most significant bit.

Note the following unusual detail: the select input is 8 bits wide, but only its lower 7 bits take part in choosing the bit. The most significant bit of `sel` (`sel[7]`) must be ignored entirely. As a consequence, the selectable index range is 0 to 127, and bits 128 through 255 of `in` can never appear on the output. For example, `sel = 8'd130` selects the same bit as `sel = 8'd2`, namely `in[2]`.

**Requirements**

- The circuit is purely combinational: there is no clock, no reset, and no stored state. `out` must respond immediately to any change in `in` or `sel`.
- Every one of the 256 possible values of `sel` must map to a defined bit of `in`; there are no invalid select values and no special default output.
- Do not add any ports beyond those listed, and use the exact names and widths given above.

**Example**

- `sel = 8'd0` → `out = in[0]`
- `sel = 8'd127` → `out = in[127]`
- `sel = 8'd128` → `out = in[0]`
- `sel = 8'd255` → `out = in[127]`

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
