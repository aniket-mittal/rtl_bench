# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Bit-Reversed Nibble Selector**

Design a purely combinational Verilog module named `dut` that extracts a 4-bit group from a large input vector and outputs it with its bit order reversed.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in`  | input  | 1024 bits (`[1023:0]`) |
| `sel` | input  | 8 bits (`[7:0]`) |
| `out` | output | 4 bits (`[3:0]`) |

**Behavior**

Treat `in` as a sequence of consecutive 4-bit groups, where group `k` consists of the bits `in[4k]`, `in[4k+1]`, `in[4k+2]`, `in[4k+3]` (`in[0]` is the least significant bit of `in`). The input `sel` is an unsigned index that chooses which group to read.

The output is that selected group in reversed order:

- `out[3]` = `in[4*sel + 0]`
- `out[2]` = `in[4*sel + 1]`
- `out[1]` = `in[4*sel + 2]`
- `out[0]` = `in[4*sel + 3]`

So the lowest-indexed bit of the selected group appears at the most significant bit of `out`.

**Edge cases**

- `sel` ranges over 0 to 255, but only indices 0 to 255 of 4-bit groups fit in 1024 bits, so every `sel` value maps to a valid group of `in`; no out-of-range handling is needed.
- The index arithmetic (`4*sel + offset`) must not overflow or truncate in a way that changes which bit is selected. For example, `sel = 255` must read bits 1020 through 1023.
- There is no clock or reset; `out` must update immediately whenever `in` or `sel` changes.

Your module must match the specified module name, port names, directions, and widths exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1024 |  |
| `sel` | in | 8 |  |
| `out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
