# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: Offset Nibble Selector**

Design a purely combinational Verilog module named `dut` that extracts one 4-bit nibble from a wide input vector.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in`  | input  | 1024 bits (`[1023:0]`) |
| `sel` | input  | 8 bits (`[7:0]`) |
| `out` | output | 4 bits (`[3:0]`) |

**Behavior**

Treat `in` as 256 consecutive 4-bit nibbles. Nibble 0 is `in[3:0]`, nibble 1 is `in[7:4]`, and so on, up to nibble 255 at `in[1023:1020]`.

The output is the nibble at index `sel + 1`, not the one at index `sel`. For example:
- `sel = 0` gives `out = in[7:4]`.
- `sel = 1` gives `out = in[11:8]`.
- `sel = 254` gives `out = in[1023:1020]`.

Within the selected nibble, the bit ordering is preserved. `out[0]` is the nibble's least significant bit and `out[3]` is its most significant bit.

**Edge cases**

- The increment of `sel` must not wrap at 8 bits. For `sel = 255`, the requested index is 256, not 0. This nibble lies entirely beyond the top of `in`, so the output for that case is not defined by the specification and is a don't-care. In particular, it must not be treated as a wraparound to nibble 0.
- All other `sel` values (0 through 254) must behave exactly as described above.

There is no clock and no reset. The output must update combinationally whenever `in` or `sel` changes.

Your answer must use the exact module name and port names, directions and widths given above.

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
