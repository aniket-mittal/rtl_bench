# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**2-Bit Unsigned Comparator (Less Than or Equal)**

Design a purely combinational Verilog module that compares two 2-bit unsigned numbers and reports whether the first is less than or equal to the second.

**Module name:** `dut`

**Ports:**

| Name | Direction | Width |
|------|-----------|-------|
| `A`  | input     | 2 bits (`[1:0]`) |
| `B`  | input     | 2 bits (`[1:0]`) |
| `z`  | output    | 1 bit |

**Behavior:**

- Interpret `A` and `B` as unsigned integers in the range 0 to 3, where bit 1 is the most significant bit.
- Output `z` must be logic 1 when the value of `A` is less than or equal to the value of `B`, and logic 0 when `A` is strictly greater than `B`.
- In particular, `z` must be 1 whenever `A` and `B` are equal.
- The circuit has no clock, no reset, and no internal state. `z` must respond purely as a function of the current values of `A` and `B`.

**Examples:**

| A  | B  | z |
|----|----|---|
| 00 | 00 | 1 |
| 01 | 10 | 1 |
| 10 | 10 | 1 |
| 11 | 10 | 0 |
| 10 | 01 | 0 |
| 11 | 11 | 1 |

Your submission will be checked for formal equivalence against a reference implementation, so port names, directions, and widths must match the table above exactly.

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
