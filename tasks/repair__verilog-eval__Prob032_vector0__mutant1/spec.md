# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Bit Splitter with Inverted Bus**

Design a purely combinational Verilog module named `dut` that takes a 3-bit input vector and produces both an inverted copy of it and the individual bits of the original.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `vec` | input | 3 bits (`[2:0]`) |
| `outv` | output | 3 bits (`[2:0]`) |
| `o2` | output | 1 bit |
| `o1` | output | 1 bit |
| `o0` | output | 1 bit |

**Required behavior**

- `outv` is the bitwise complement of `vec`. Each bit of `outv` is the logical inverse of the bit at the same index in `vec`. For example, if `vec = 3'b101`, then `outv = 3'b010`.
- `o2`, `o1`, and `o0` expose the bits of `vec` unchanged, with `o2` carrying the most significant bit (`vec[2]`), `o1` carrying the middle bit (`vec[1]`), and `o0` carrying the least significant bit (`vec[0]`). For example, if `vec = 3'b101`, then `o2 = 1`, `o1 = 0`, `o0 = 1`.

**Constraints**

- There is no clock and no reset; all outputs must respond immediately to any change on `vec`.
- No state may be stored.
- All 8 possible input values must be handled, and the relationships above must hold for each one.

**Example**

| `vec` | `outv` | `o2` | `o1` | `o0` |
|-------|--------|------|------|------|
| `3'b000` | `3'b111` | 0 | 0 | 0 |
| `3'b011` | `3'b100` | 0 | 1 | 1 |
| `3'b110` | `3'b001` | 1 | 1 | 0 |

Your module must match the names, directions, and widths above exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `vec` | in | 3 |  |
| `outv` | out | 3 | |
| `o2` | out | 1 | |
| `o1` | out | 1 | |
| `o0` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
