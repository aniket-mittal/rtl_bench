# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Single-Bit Inverter**

Design a purely combinational Verilog module named `dut` that takes a single-bit input and produces its logical complement.

**Module interface**

| Port | Direction | Width |
|------|-----------|-------|
| `in` | input | 1 bit |
| `out` | output | 1 bit |

**Requirements**

- The output `out` must always be the opposite logic value of the input `in`: when `in` is 0, `out` is 1, and when `in` is 1, `out` is 0.
- The circuit has no clock and no reset, and it must not store any state. The output must respond immediately to any change on the input, with no sequential elements or latches.
- Both ports are plain single-bit scalars (no vectors).

**Examples**

| `in` | `out` |
|------|-------|
| 0 | 1 |
| 1 | 0 |

Your submission will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly as specified above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
