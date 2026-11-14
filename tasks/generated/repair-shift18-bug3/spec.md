# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**64-bit Loadable Shifter/Rotator Register**

Design a synchronous Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `clk` | input | 1 |
| `load` | input | 1 |
| `ena` | input | 1 |
| `amount` | input | 2 |
| `data` | input | 64 |
| `q` | output (registered) | 64 |

The module holds a 64-bit value in `q`. All updates occur on the rising edge of `clk`. There is no reset signal, so the initial value of `q` is unspecified.

On each rising clock edge, the behavior is prioritized as follows:

1. If `load` is high, `q` is replaced with `data`. This takes priority over everything else.
2. Otherwise, if `ena` is high, `q` is modified according to `amount`:
   - `amount = 0`: shift `q` left by 1 bit position, filling the vacated least-significant bit with 0.
   - `amount = 1`: shift `q` left by 8 bit positions, filling the vacated low-order bits with 0.
   - `amount = 2`: arithmetic shift right by 1 bit position, so the sign bit (bit 63) is preserved and replicated into the vacated top bit.
   - `amount = 3`: arithmetic shift right by 7 bit positions, with the vacated upper bits filled with copies of the original sign bit (bit 63).
3. If neither `load` nor `ena` is high, `q` holds its current value.

Notes:
- Shifts are not rotations; bits shifted out are discarded.
- All four `amount` values are fully specified, so no other cases need handling.
- The output `q` changes only on the rising edge of `clk` (no combinational path from the inputs to `q`).

Implement the module with exactly the module name and port names/widths given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `ena` | in | 1 |  |
| `amount` | in | 2 |  |
| `data` | in | 64 |  |
| `q` | out | 64 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
