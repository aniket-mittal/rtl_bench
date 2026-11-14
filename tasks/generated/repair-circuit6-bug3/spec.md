# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Constant Lookup Decoder**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 3 bits, `[2:0]` |
| `q`  | output    | 16 bits, `[15:0]` |

The module maps the 3-bit input `a` to a fixed 16-bit output `q`. The output must update whenever `a` changes. There is no clock and no reset, and the module must not hold state.

The required mapping, with `q` given as an unsigned decimal value, is:

| `a` | `q` |
|-----|-----|
| 0 | 4658 |
| 1 | 224 |
| 2 | 10196 |
| 3 | 23054 |
| 4 | 8294 |
| 5 | 25806 |
| 6 | 50470 |
| 7 | 12057 |

Note the entry for `a = 1`. It is 224, not a value close to 44768. The result is a small number whose upper 8 bits are zero.

Every possible value of `a` is covered, so there are no other edge cases. `a` is a 2-state input, and the output must always be one of the eight values above.

Your task is to implement `dut` so that its input/output behavior exactly matches this table. Submissions are checked by formal equivalence, so the port names, directions and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 3 |  |
| `q` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
