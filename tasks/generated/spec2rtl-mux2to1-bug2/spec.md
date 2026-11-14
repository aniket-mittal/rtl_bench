# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Selectable Pass / Invert Multiplexer**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`   | input  | 1 bit |
| `b`   | input  | 1 bit |
| `sel` | input  | 1 bit |
| `out` | output | 1 bit |

**Behavior**

The module acts as a 2-to-1 selector whose two data choices are not symmetric. The control input `sel` determines which choice appears on `out`:

- When `sel` is 0, `out` follows input `a` unchanged.
- When `sel` is 1, `out` is the logical complement of input `b`. Input `a` has no influence on `out` in this case.

**Requirements**

- The circuit has no clock, no reset, and no internal state. `out` must respond immediately to any change on `a`, `b`, or `sel`.
- Input `b` is only observable on `out` when `sel` is 1, and in that case it must appear inverted. When `sel` is 0, `b` must have no influence on `out`.
- All signals are single-bit scalars (not vectors).
- Treat `sel` as a standard 2-valued logic signal (0 or 1); no special handling of unknown or high-impedance values is required.

**Example behavior**

| sel | a | b | out |
|-----|---|---|-----|
| 0   | 0 | x | 0   |
| 0   | 1 | x | 1   |
| 1   | x | 0 | 1   |
| 1   | x | 1 | 0   |

(Here `x` means "don't care" in the sense that the value does not affect the output for that row.)

Your submission will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

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
