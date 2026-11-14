# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Two-Bit Partial Match Detector**

Design a purely combinational Verilog module named `dut` that compares two 2-bit values and reports whether they match in at least one bit position.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `A`  | input     | 2 bits (`[1:0]`) |
| `B`  | input     | 2 bits (`[1:0]`) |
| `z`  | output    | 1 bit |

**Behavior**

Compare `A` and `B` bit by bit: bit 0 of `A` with bit 0 of `B`, and bit 1 of `A` with bit 1 of `B`. A position is a "match" when the two bits are equal (both 0 or both 1).

The output `z` must be 1 if at least one of the two positions is a match, and 0 otherwise.

Note that this is *not* a full equality check. `z` is 1 even when only one bit position agrees. `z` is 0 only when both bit positions differ, meaning `B` is the bitwise complement of `A`.

**Requirements**

- The circuit has no clock and no reset, and its output depends only on the current values of `A` and `B`.
- The output must respond immediately to any input change.
- There is no special handling needed beyond the behavior above.

**Examples**

| A    | B    | z |
|------|------|---|
| 2'b00 | 2'b00 | 1 |
| 2'b01 | 2'b00 | 1 |
| 2'b01 | 2'b10 | 0 |
| 2'b10 | 2'b01 | 0 |
| 2'b11 | 2'b00 | 0 |
| 2'b11 | 2'b10 | 1 |

Implement the module with the exact name and port names given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 2 |  |
| `B` | in | 2 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
