# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Ones-Count Saturating Encoder**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `in`  | input  | 3 bits (`[2:0]`) |
| `out` | output | 2 bits (`[1:0]`) |

The module examines the three bits of `in` and produces a 2-bit value on `out` based on how many of those bits are set to 1 (the population count).

**Required behavior**

- If none of the bits of `in` are 1, `out` is `0`.
- If exactly one bit of `in` is 1, `out` is `1`.
- If exactly two bits of `in` are 1, `out` is `2`.
- If all three bits of `in` are 1, `out` is **`2`**, not `3`. The result is clamped so that the maximum value ever produced is `2`.

The output depends only on the current value of `in`. There is no clock, no reset, and no stored state. `out` must update whenever `in` changes.

**Examples**

| `in`  | `out` |
|-------|-------|
| `3'b000` | `2'd0` |
| `3'b100` | `2'd1` |
| `3'b101` | `2'd2` |
| `3'b111` | `2'd2` |

**Notes**

- Which specific bits are set does not matter, only how many.
- The module must use exactly the name and port names given above, with the specified widths, so that it can be checked for equivalence against a reference design.

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
