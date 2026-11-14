# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual-Output Combinational Gate Block**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port    | Direction | Width |
|---------|-----------|-------|
| `a`     | input     | 1 bit |
| `b`     | input     | 1 bit |
| `c`     | input     | 1 bit |
| `d`     | input     | 1 bit |
| `out`   | output    | 1 bit |
| `out_n` | output    | 1 bit |

**Behavior**

- `out` is a single-bit signal that is high only when both `a` and `b` are high. In every other case it is low.
- `out_n` is always the logical complement of `out`.

**Notes**

- The circuit has no clock, no reset, and no internal state. Outputs must respond immediately to any change on the inputs.
- Inputs `c` and `d` are part of the required interface and must be declared exactly as listed, but neither has any effect on either output. Every output value must be identical regardless of the values of `c` and `d`.
- All ports are single-bit scalars; do not use vectors.

**Examples**

| a | b | c | d | out | out_n |
|---|---|---|---|-----|-------|
| 0 | 0 | 0 | 0 | 0   | 1     |
| 1 | 1 | 0 | 0 | 1   | 0     |
| 1 | 1 | 1 | 1 | 1   | 0     |
| 1 | 0 | 1 | 0 | 0   | 1     |
| 0 | 1 | 1 | 1 | 0   | 1     |

Your submission will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `out` | out | 1 | |
| `out_n` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
