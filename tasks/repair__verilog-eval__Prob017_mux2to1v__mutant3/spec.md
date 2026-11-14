# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Bit-Reversing Selector**

Design a purely combinational Verilog module named `dut` that either passes one 100-bit input through unchanged or passes the bit-reversed version of another 100-bit input, depending on a select signal.

**Ports**

| Name  | Direction | Width   |
|-------|-----------|---------|
| `a`   | input     | [99:0]  |
| `b`   | input     | [99:0]  |
| `sel` | input     | 1 bit   |
| `out` | output    | [99:0]  |

**Behavior**

- When `sel` is 1, `out` is the bit-reversal of `b`: the most significant bit of `out` (bit 99) equals bit 0 of `b`, bit 98 of `out` equals bit 1 of `b`, and so on, until bit 0 of `out` equals bit 99 of `b`. In general, `out[i] = b[99 - i]`.
- When `sel` is 0, `out` equals `a` exactly, with no reordering.

**Requirements**

- The circuit has no clock, no reset, and no internal state. `out` must respond immediately to any change on `a`, `b`, or `sel`.
- The input `a` is never reversed, and the input `b` is never passed through without reversal.
- Every bit of `out` depends only on `sel`, the corresponding bit of `a` (index `i`), and the mirrored bit of `b` (index `99 - i`).

**Examples**

- `sel = 0`, `a = 100'h1`, any `b`: `out = 100'h1`.
- `sel = 1`, `b = 100'h1`, any `a`: `out` has only bit 99 set, i.e. `out = 100'h8_0000_0000_0000_0000_0000_0000`.
- `sel = 1`, `b = 100'h0`: `out = 0` regardless of `a`.

Your module must match the specified module name, port names, directions, and widths exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 100 |  |
| `b` | in | 100 |  |
| `sel` | in | 1 |  |
| `out` | out | 100 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
