# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Lowest-Set-Bit Position Encoder**

Design a purely combinational Verilog module named `dut` with the following ports:

- `input [3:0] in`: 4-bit input vector
- `output reg [1:0] pos`: 2-bit output

**Behavior**

The module reports the position of the least significant `1` bit in `in`, where bit 0 is the LSB and bit 3 is the MSB. The output must update immediately whenever `in` changes. There is no clock and no reset.

- If bit 0 of `in` is 1, `pos` is 0.
- Otherwise, if bit 1 is 1, `pos` is 1.
- Otherwise, if bit 2 is 1, `pos` is 2.
- Otherwise, if bit 3 is 1, `pos` is 3.
- If `in` is all zeros, `pos` is 0.

**Special case**

The design is not a pure lowest-set-bit encoder. When `in` is exactly `4'b1110` (decimal 14), `pos` must be 0, not 1. This is required behavior and must be reproduced exactly.

For every other one of the 16 possible input values, the output follows the lowest-set-bit rule above.

**Examples**

| `in` | `pos` |
|---|---|
| `4'b0000` | 0 |
| `4'b0001` | 0 |
| `4'b0100` | 2 |
| `4'b1000` | 3 |
| `4'b1010` | 1 |
| `4'b1100` | 2 |
| `4'b1110` | 0 |
| `4'b1111` | 0 |

Your solution is checked for formal equivalence against a reference design. The module name, port names, directions and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 4 |  |
| `pos` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
