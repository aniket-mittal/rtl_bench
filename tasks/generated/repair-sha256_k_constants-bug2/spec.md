# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: SHA-256 Round Constant Lookup (with a quirk)**

Design a purely combinational Verilog module named `dut` that looks up a 32-bit round constant from a 6-bit round index.

**Ports**
- `input wire [5:0] round`: round index, 0 to 63
- `output wire [31:0] K`: round constant

**Behavior**

For most indices, `K` is the standard SHA-256 round constant for that index. These are the first 32 bits of the fractional parts of the cube roots of the first 64 primes, so index 0 gives `32'h428a2f98`, index 1 gives `32'h71374491`, and index 63 gives `32'hc67178f2`.

There are two deviations from the standard table that your design must reproduce exactly:

1. **Round 16:** `K` is `32'h243185be`. This is the constant normally associated with index 10. The standard index-16 constant (`32'he49b69c1`) must never be produced.
2. **Round 10:** The module has no defined constant for this index. When `round` is 10, `K` must not be driven to a new value and must keep whatever value it held just before `round` became 10. The output therefore behaves as a level-sensitive latch for this one input value. In every other case, `K` follows the lookup immediately.

All other indices (0–9, 11–15, 17–63) return their standard SHA-256 constants.

**Requirements**
- There is no clock and no reset.
- `K` must respond combinationally to changes in `round`, apart from the held value at index 10.
- Use exactly the module name and port names, directions and widths given above.
- All 64 index values of `round` are legal inputs, and the behavior for each must match the description.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `round` | in | 6 |  |
| `K` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
