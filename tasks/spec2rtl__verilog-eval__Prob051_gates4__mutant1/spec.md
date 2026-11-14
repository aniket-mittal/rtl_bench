# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Four-Bit Input Reduction Unit**

Design a purely combinational Verilog module named `dut` that analyzes a 4-bit input vector and produces three single-bit status outputs.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `in` | input | 4 bits (`[3:0]`) |
| `out_and` | output | 1 bit |
| `out_or` | output | 1 bit |
| `out_xor` | output | 1 bit |

**Required behavior**

Number the bits of `in` from 0 (least significant) to 3 (most significant).

- `out_and`: Asserted (1) only when all of the **upper three bits** (bits 3, 2, and 1) are 1. Bit 0 of `in` has no influence on this output, so `out_and` is 1 for both `in = 4'b1110` and `in = 4'b1111`.
- `out_or`: Asserted (1) when **at least one** of the four input bits is 1. It is 0 only when `in = 4'b0000`.
- `out_xor`: The parity of the entire 4-bit input. It is 1 when an odd number of the four bits are 1, and 0 when an even number are 1 (including zero).

**Timing and other requirements**

- There is no clock and no reset; all three outputs must respond immediately to any change on `in`.
- The design must not contain any state or latches.
- All 16 input combinations are valid. There are no don't-care cases, and outputs must never be X or Z for known inputs.

**Examples**

| `in` | `out_and` | `out_or` | `out_xor` |
|---|---|---|---|
| `4'b0000` | 0 | 0 | 0 |
| `4'b0001` | 0 | 1 | 1 |
| `4'b0110` | 0 | 1 | 0 |
| `4'b1110` | 1 | 1 | 1 |
| `4'b1111` | 1 | 1 | 0 |

Your module will be checked for formal equivalence against a reference design, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 4 |  |
| `out_and` | out | 1 | |
| `out_or` | out | 1 | |
| `out_xor` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
