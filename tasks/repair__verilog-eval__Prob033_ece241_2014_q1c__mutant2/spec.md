# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Eight-Bit Adder with Custom Overflow Flag**

Design a combinational Verilog module named `dut` with the following ports:

| Name | Direction | Width |
|------|-----------|-------|
| `a` | input | 8 bits |
| `b` | input | 8 bits |
| `s` | output | 8 bits |
| `overflow` | output | 1 bit |

**Behavior**

The module adds two 8-bit values, but the adder is unusual: only the lower 7 bits of each input (bits 6 down to 0) participate in the addition. The most significant bit of each input (bit 7) is **not** included in the arithmetic.

- `s` is the 8-bit result of adding the lower 7 bits of `a` to the lower 7 bits of `b`. The carry out of the 7-bit addition lands in bit 7 of `s`. Consequently, `s[7]` is only ever the carry from the lower-bit addition and is never influenced directly by `a[7]` or `b[7]`.

- `overflow` is a single-bit flag that is asserted (1) when both of the following are true:
  1. The sign bits of the inputs are equal, i.e. `a[7]` and `b[7]` have the same value.
  2. The sign bit of the input `a` differs from bit 7 of the output `s`.

  Otherwise `overflow` is 0.

The overflow flag is computed using the `s` value produced by the adder described above (not a separately computed result), and should be reproduced exactly as specified, even though it does not correspond to true two's-complement overflow detection.

**Requirements**

- The circuit is purely combinational: no clock, no reset, no state.
- Outputs must update whenever any input changes.
- Behavior must match the description for all 65,536 input combinations.

**Example**

- `a = 8'b0100_0000`, `b = 8'b0100_0000`: lower 7 bits are 64 each, so the sum is 128 and `s = 8'b1000_0000`. Here `a[7] = b[7] = 0`, and `a[7] != s[7]`, so `overflow = 1`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `s` | out | 8 | |
| `overflow` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
