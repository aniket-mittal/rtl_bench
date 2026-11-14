# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Next-State Output Logic for a One-Hot-Style State Register**

Design a purely combinational Verilog module named `dut` that produces two output signals from a 6-bit state value and a single input bit.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `y`  | input     | 6 bits (`[5:0]`) |
| `w`  | input     | 1 bit |
| `Y1` | output    | 1 bit |
| `Y3` | output    | 1 bit |

**Required behavior**

There is no clock and no reset. Both outputs must respond immediately to any change on the inputs.

- `Y1` is asserted only when the input `w` is high and bit 0 of `y` is high. In every other case it is low.

- `Y3` is asserted only when the input `w` is low and an odd number of the bits among positions 1, 2, 4 and 5 of `y` are high (that is, the parity of those four bits is odd). In every other case it is low. Bits 0 and 3 of `y` have no influence on `Y3`.

**Additional notes**

- Bit 3 of `y` is not used by either output.
- Bit 0 of `y` affects only `Y1`.
- When `w` is high, `Y3` must be low regardless of `y`. When `w` is low, `Y1` must be low regardless of `y`.
- The behavior is fully specified for every combination of the 7 input bits (no don't-care cases, and no unknown-value handling is required).

Your module must match the specified input/output behavior exactly, using the exact module name and port names, directions and widths given above.

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
