# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**2-to-1 Selector**

Design a purely combinational Verilog module named `dut` that selects one of two single-bit data inputs based on a select signal.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`   | input  | 1 bit |
| `b`   | input  | 1 bit |
| `sel` | input  | 1 bit |
| `out` | output | 1 bit |

**Behavior**

- The output must follow the selected input continuously, with no clock, no storage, and no reset.
- When `sel` is `1`, `out` must equal `a`.
- When `sel` is `0`, `out` must equal `b`.

Note the polarity carefully: input `a` is chosen when `sel` is high, and input `b` is chosen when `sel` is low.

**Truth table summary**

| `sel` | `out` |
|-------|-------|
| 0     | `b`   |
| 1     | `a`   |

**Requirements**

- The module name must be exactly `dut`.
- Port names, directions, and widths must match the table above exactly.
- Any change in `a`, `b`, or `sel` must be reflected on `out` combinationally, with no latches or sequential elements.

Your task is to write the module that satisfies this specification.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `sel` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
