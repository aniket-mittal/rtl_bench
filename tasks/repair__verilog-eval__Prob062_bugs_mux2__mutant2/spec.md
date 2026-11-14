# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Selectable Bit-Reversal Multiplexer**

Design a purely combinational Verilog module named `dut` that either passes one 8-bit input through unchanged or outputs the bit-reversed form of another 8-bit input, depending on a select signal.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `sel` | input | 1 bit |
| `a`   | input | 8 bits, `[7:0]` |
| `b`   | input | 8 bits, `[7:0]` |
| `out` | output | 8 bits, `[7:0]` |

**Behavior**

- When `sel` is 1, `out` is the bit-reversed version of `a`: the least significant bit of `a` appears in the most significant bit position of `out`, the next-lowest bit of `a` appears in the next-highest position, and so on, until the most significant bit of `a` appears in the least significant bit position of `out`. The value of `b` has no effect in this case.
- When `sel` is 0, `out` is simply equal to `b`, unchanged. The value of `a` has no effect in this case.

**Requirements**

- The circuit must be purely combinational: there is no clock, no reset, and no stored state. `out` must respond immediately to any change in `sel`, `a`, or `b`.
- The port names, directions, and widths must match the table above exactly.
- There are no special cases beyond the two described above; every combination of inputs must produce the output specified for the current value of `sel`.

**Example**

- `sel = 1`, `a = 8'b1100_0001`, `b = 8'b0000_0000` → `out = 8'b1000_0011`
- `sel = 0`, `a = 8'b1100_0001`, `b = 8'b0101_1010` → `out = 8'b0101_1010`

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `sel` | in | 1 |  |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `out` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
