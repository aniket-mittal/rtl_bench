# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**100-Input Reduction Unit**

Design a purely combinational Verilog module named `dut` that performs three reductions over a 100-bit input vector.

**Ports**

| Name | Direction | Width |
|---------|-----------|----------------|
| `in` | input | 100 bits ([99:0]) |
| `out_and` | output | 1 bit |
| `out_or` | output | 1 bit |
| `out_xor` | output | 1 bit |

**Required behavior**

- `out_and` is 1 only when every one of the 100 input bits is 1. Otherwise it is 0.
- `out_or` is 1 only when every one of the 100 input bits is 0 (that is, no bit is set). Otherwise it is 0. Note that despite its name, this output does *not* indicate that at least one bit is set. It reports the opposite: the output is the inverse of an ordinary OR reduction.
- `out_xor` is the parity of the input: it is 1 when an odd number of input bits are 1, and 0 when an even number (including zero) are 1.

**Constraints**

- The circuit has no clock and no reset, and no state. Outputs must respond purely as a function of the current value of `in`.
- No special handling is needed for unknown or high-impedance values; assume all inputs are 0 or 1.

**Examples**

| `in` | `out_and` | `out_or` | `out_xor` |
|--------------------------------|-----------|----------|-----------|
| All 100 bits 0 | 0 | 1 | 0 |
| All 100 bits 1 | 1 | 0 | 0 |
| Only `in[0]` = 1 | 0 | 0 | 1 |
| Only `in[99]` = 1 | 0 | 0 | 1 |
| Exactly three bits set | 0 | 0 | 1 |

Your module must match these outputs for all 2^100 possible input values.

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
