# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Combinational Bitwise/Logical OR and Concatenated Inversion**

Design a purely combinational Verilog module named `dut` with the following ports:

| Name | Direction | Width |
|---|---|---|
| `a` | input | 3 bits |
| `b` | input | 3 bits |
| `out_or_bitwise` | output | 3 bits |
| `out_or_logical` | output | 1 bit |
| `out_not` | output | 6 bits |

There is no clock and no reset. All outputs must respond immediately to changes on the inputs.

**Required behavior**

1. `out_or_bitwise` is the bit-by-bit OR of `a` and `b`. Each output bit position combines the corresponding bits of the two inputs.

2. `out_or_logical` is a single bit. Treat each 3-bit input as a single truth value: an input counts as true if any of its bits is 1, and false only if all its bits are 0. Despite the name, this output must be 1 only when **both** `a` and `b` are true, and 0 otherwise. (For example, `a = 3'b100`, `b = 3'b001` gives 1; `a = 3'b000`, `b = 3'b111` gives 0.) Do not "fix" this to compute a logical OR; the behavior described here is the required one.

3. `out_not` is a 6-bit bus formed by joining the bitwise complement of `b` and the bitwise complement of `a`. The complement of `b` occupies the upper three bits `[5:3]`, and the complement of `a` occupies the lower three bits `[2:0]`. Within each group, bit ordering is preserved (bit 2 of the input maps to the most significant bit of that group).

**Example**

- `a = 3'b101`, `b = 3'b010`
  - `out_or_bitwise = 3'b111`
  - `out_or_logical = 1`
  - `out_not = 6'b101_010`

Your submission will be checked for formal equivalence against a reference design, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 3 |  |
| `b` | in | 3 |  |
| `out_or_bitwise` | out | 3 | |
| `out_or_logical` | out | 1 | |
| `out_not` | out | 6 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
