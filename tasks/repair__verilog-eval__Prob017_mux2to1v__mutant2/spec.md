# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**100-bit Two-Way Selector**

Design a combinational Verilog module named `dut` that chooses between two 100-bit data words based on a single control bit.

**Ports**

| Name  | Direction | Width   |
|-------|-----------|---------|
| `a`   | input     | 100 bits (`[99:0]`) |
| `b`   | input     | 100 bits (`[99:0]`) |
| `sel` | input     | 1 bit   |
| `out` | output    | 100 bits (`[99:0]`) |

**Behavior**

- When `sel` is 1, `out` must equal `a`, bit for bit.
- When `sel` is 0, `out` must equal `b`, bit for bit.
- The selection applies to the whole 100-bit word at once. Every bit of `out` is driven by the corresponding bit position of the chosen input, with no bit reordering, inversion, or masking.

**Requirements**

- The circuit is purely combinational. There is no clock, no reset, and no stored state. `out` must respond immediately to any change in `a`, `b`, or `sel`.
- The module must not introduce latches or any other sequential behavior.
- Port names, directions, and widths must match the table exactly.

**Example**

- `sel = 1`, `a = 100'h…A5`, `b = 100'h…3C` gives `out = a`.
- `sel = 0` with the same `a` and `b` gives `out = b`.

Implement the module `dut` so that it satisfies the behavior above.

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
