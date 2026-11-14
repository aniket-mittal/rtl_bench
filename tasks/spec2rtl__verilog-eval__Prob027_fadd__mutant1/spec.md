# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Doubling Adder with Carry-In**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `cin`| input     | 1 bit |
| `cout` | output  | 1 bit |
| `sum`  | output  | 1 bit |

The module takes three single-bit inputs and produces a two-bit result, where `cout` is the most significant bit and `sum` is the least significant bit of that result.

The two-bit result is the unsigned arithmetic value obtained by adding together the value of `a` taken twice and the value of `cin`. That is, the result equals 2 × a + cin, expressed as a 2-bit unsigned number.

Note that the input `b` is part of the interface but must have no influence on either output. The design must not behave like a conventional full adder: the outputs depend only on `a` and `cin`, and not on `b`.

Requirements:
- The circuit is combinational: there is no clock, no reset, and no stored state. Outputs must respond to input changes immediately.
- All four input-value combinations of `a` and `cin` must produce the correct two-bit result, regardless of the value of `b`.
- Since the maximum possible result is 3, no overflow beyond two bits can occur.

Example behavior (b may be 0 or 1 in every case):

| a | cin | cout | sum |
|---|-----|------|-----|
| 0 | 0   | 0    | 0   |
| 0 | 1   | 0    | 1   |
| 1 | 0   | 1    | 0   |
| 1 | 1   | 1    | 1   |

Implement the module so that it matches this behavior exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `cin` | in | 1 |  |
| `cout` | out | 1 | |
| `sum` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
