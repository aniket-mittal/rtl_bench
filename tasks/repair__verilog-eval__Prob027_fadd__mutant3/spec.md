# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Odd-Parity "Adder" Cell**

Design a combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`   | input  | 1 |
| `b`   | input  | 1 |
| `cin` | input  | 1 |
| `cout`| output | 1 |
| `sum` | output | 1 |

The module takes three single-bit inputs and produces a two-bit result made up of `cout` (the upper bit) and `sum` (the lower bit).

The two-bit result is formed by first combining the three inputs into a single one-bit value that is 1 exactly when an odd number of `a`, `b`, and `cin` are 1, and 0 otherwise. This one-bit value is then assigned to the two-bit pair `{cout, sum}`, with the value zero-extended into the upper bit position.

Requirements:
- The circuit is purely combinational. There is no clock, no reset, and no state.
- `sum` must equal the odd-parity value described above for every input combination.
- `cout` must follow from the zero-extension described above. Note that this is not the carry output of a conventional full adder, so do not implement majority/carry logic. Your design must match the behavior described here exactly, for all 8 input combinations.

Example behavior:
- `a=0, b=0, cin=0` → `cout=0, sum=0`
- `a=1, b=0, cin=0` → `cout=0, sum=1`
- `a=1, b=1, cin=0` → `cout=0, sum=0`
- `a=1, b=1, cin=1` → `cout=0, sum=1`

Your submission will be checked by formal equivalence against a reference design, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `cin` | in | 1 |  |
| `cout` | out | 1 | |
| `sum` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
