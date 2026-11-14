# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Split Bitwise Inverter**

Design a purely combinational Verilog module named `dut` that inverts a 16-bit input and presents the result as two separate 8-bit halves.

**Ports**

| Name     | Direction | Width  |
|----------|-----------|--------|
| `in`     | input     | 16 bits ([15:0]) |
| `out_hi` | output    | 8 bits ([7:0])  |
| `out_lo` | output    | 8 bits ([7:0])  |

**Behavior**

- Every bit of the 16-bit input is logically inverted (a 0 becomes a 1 and a 1 becomes a 0).
- The inverted 16-bit value is then split: the upper 8 bits (the inverted `in[15:8]`) appear on `out_hi`, and the lower 8 bits (the inverted `in[7:0]`) appear on `out_lo`.
- Bit positions are preserved. For example, `out_hi[7]` is the inverse of `in[15]`, and `out_lo[0]` is the inverse of `in[0]`.

**Requirements**

- The circuit has no clock and no reset, and it holds no state. Outputs must respond immediately to any change on `in`.
- There are no special cases or exceptions: the same rule applies to all 65,536 possible input values.

**Examples**

| `in`     | `out_hi` | `out_lo` |
|----------|----------|----------|
| 16'h0000 | 8'hFF    | 8'hFF    |
| 16'hFFFF | 8'h00    | 8'h00    |
| 16'h12AB | 8'hED    | 8'h54    |
| 16'hF00F | 8'h0F    | 8'hF0    |

Write the module using the exact module name and port names given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 16 |  |
| `out_hi` | out | 8 | |
| `out_lo` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
