# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: SHA-256 Round Constant Lookup (with a quirk)**

Design a purely combinational lookup module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `round` | input | 6 bits |
| `K` | output | 32 bits |

**Behavior**

`K` is the 32-bit round constant selected by `round` (0 to 63). The constants are the standard SHA-256 round constants. These are the first 32 bits of the fractional parts of the cube roots of the first 64 primes. For example:

- `round = 0` gives `32'h428a2f98`
- `round = 1` gives `32'h71374491`
- `round = 63` gives `32'hc67178f2`

The table has two deliberate deviations from the standard, and your circuit must reproduce both exactly:

1. **Round 54:** `K` must be `32'hd6990624`. This is the constant that standard SHA-256 assigns to round 45. It is **not** the standard round-54 value `32'h5b9cca4f`.

2. **Round 45:** No value is defined for this input. When `round` equals 45, `K` must not change. It keeps whatever value it held immediately before `round` became 45, so the design has level-sensitive memory behavior at that input. For every other value of `round`, `K` follows the table above, with no clock and no reset.

All other rounds (0 to 44, 46 to 53, and 55 to 63) use the standard SHA-256 constants. Output changes must follow input changes combinationally, with no clock involved.

Submit the full module with the exact name and port declarations above.

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
