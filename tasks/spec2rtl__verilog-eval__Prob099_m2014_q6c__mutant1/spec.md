# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: One-Hot State Output Decoder**

Design a purely combinational Verilog module named `dut` that computes two output signals from a 6-bit one-hot-style state vector and a single input bit.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `y`  | input     | 6 bits (`[5:0]`) |
| `w`  | input     | 1 bit |
| `Y1` | output    | 1 bit |
| `Y3` | output    | 1 bit |

**Behavior**

The module has no clock and no reset; outputs must respond immediately to any change in the inputs.

- `Y1` is asserted (logic 1) when the lowest bit of the state vector (`y[0]`) is set and the input `w` is 0. Otherwise `Y1` is 0.
- `Y3` is asserted (logic 1) when the input `w` is 1 and at least one of the upper five bits of the state vector (`y[5:1]`) is set. Otherwise `Y3` is 0.

**Edge cases**

- The module must not assume that `y` is truly one-hot. Any 6-bit value of `y` is legal, including all zeros or several bits set simultaneously, and the outputs must be determined solely by the rules above.
- `y[0]` has no influence on `Y3`, and `y[5:1]` have no influence on `Y1`.
- When `w` is 0, `Y3` is always 0; when `w` is 1, `Y1` is always 0.
- Consequently, `Y1` and `Y3` are never asserted at the same time.

Your implementation must match the specified names and widths exactly so it can be checked by formal equivalence against a reference design.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `y` | in | 6 |  |
| `w` | in | 1 |  |
| `Y1` | out | 1 | |
| `Y3` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
