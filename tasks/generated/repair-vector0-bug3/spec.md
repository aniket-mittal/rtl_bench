# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Bit Fan-Out with Reversed Taps**

Design a purely combinational Verilog module named `dut` that distributes a 3-bit input vector onto several outputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `vec` | input | 3 bits, `[2:0]` |
| `outv` | output | 3 bits, `[2:0]` |
| `o2` | output | 1 bit |
| `o1` | output | 1 bit |
| `o0` | output | 1 bit |

**Required behavior**

- `outv` must always equal `vec`, bit for bit (bit 2 to bit 2, bit 1 to bit 1, bit 0 to bit 0).
- The three single-bit outputs are also driven from `vec`, but with a reversed (mirrored) mapping relative to their names:
  - `o0` carries the most significant bit of `vec` (`vec[2]`).
  - `o1` carries the middle bit of `vec` (`vec[1]`).
  - `o2` carries the least significant bit of `vec` (`vec[0]`).

Note that the naming of `o2`, `o1`, `o0` does **not** match the bit index of `vec` they reflect. Follow the mapping above exactly.

**Constraints**

- There is no clock and no reset; the module is purely combinational, and every output must respond immediately to any change in `vec`.
- No state, latches, or delays are allowed.
- All eight possible input values of `vec` must be handled according to the rules above; there are no special or don't-care cases.

**Example**

| `vec` | `outv` | `o2` | `o1` | `o0` |
|-------|--------|------|------|------|
| `3'b000` | `3'b000` | 0 | 0 | 0 |
| `3'b001` | `3'b001` | 1 | 0 | 0 |
| `3'b100` | `3'b100` | 0 | 0 | 1 |
| `3'b110` | `3'b110` | 0 | 1 | 1 |

Your submission will be checked for formal equivalence against a reference design, so port names, directions, and widths must match exactly.

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
