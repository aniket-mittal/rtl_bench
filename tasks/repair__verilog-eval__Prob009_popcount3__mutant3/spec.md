# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: Bit Sum with Conditional Toggle**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `in` | input | 3 bits (`[2:0]`) |
| `out` | output | 2 bits (`[1:0]`) |

**Behavior**

Treat the three bits of `in` as separate single-bit values: `in[0]`, `in[1]` and `in[2]`.

1. Add `in[0]` and `in[1]` as unsigned one-bit numbers. The result is a 2-bit unsigned value from 0 to 2, and the carry must not be lost.
2. Take `in[2]` as a 2-bit unsigned value, zero-extended (its upper bit is 0, its lower bit is `in[2]`).
3. Combine the 2-bit sum from step 1 with the value from step 2 using a bitwise XOR, and drive the 2-bit result onto `out`.

So when `in[2]` is 1, only the least significant bit of the sum is inverted. The most significant bit of `out` is never affected by `in[2]`.

**Requirements**

- The circuit is combinational. It has no clock, no reset and no state, and `out` must update whenever `in` changes.
- All 8 input combinations must produce the defined 2-bit output. There are no don't-care or undefined cases.

**Examples**

| `in[2:0]` | `out[1:0]` |
|-----------|-----------|
| `000` | `00` |
| `001` | `01` |
| `011` | `10` |
| `100` | `01` |
| `111` | `11` |

Write the module so that it exactly matches the port names, directions and widths above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 3 |  |
| `out` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
