# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**100-Bit Reduction Unit**

Design a purely combinational Verilog module named `dut` that examines a 100-bit input vector and produces three single-bit status outputs.

**Ports**

| Name | Direction | Width |
|---------|-----------|----------|
| `in` | input | 100 bits ([99:0]) |
| `out_and` | output | 1 bit |
| `out_or` | output | 1 bit |
| `out_xor` | output | 1 bit |

**Required behavior**

- `out_or` is 1 if at least one bit of `in` is 1, and 0 only when every bit of `in` is 0.
- `out_xor` is the parity of `in`: it is 1 when an odd number of bits in `in` are 1, and 0 when an even number (including zero) are 1.
- `out_and` is **not** the plain "all ones" detector. It is the logical inverse of that condition: it is 0 only when every one of the 100 bits of `in` is 1, and it is 1 for every other input value (including all zeros).

**Notes**

- There is no clock or reset; the outputs must respond purely combinationally to changes on `in`.
- Despite its name, `out_and` follows the inverted behavior described above. Do not "correct" it to a standard AND reduction.
- Bit 0 and bit 99 are treated symmetrically for all three outputs; the order of bits does not matter.

**Examples**

| `in` | `out_and` | `out_or` | `out_xor` |
|-----------------------|-----------|----------|-----------|
| all zeros | 1 | 0 | 0 |
| exactly one bit set | 1 | 1 | 1 |
| exactly two bits set | 1 | 1 | 0 |
| all 100 bits set | 0 | 1 | 0 |
| 99 bits set, one clear| 1 | 1 | 1 |

Your module must match this behavior exactly for all 2^100 input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 100 |  |
| `out_and` | out | 1 | |
| `out_or` | out | 1 | |
| `out_xor` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
