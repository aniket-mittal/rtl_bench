# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Signal Fan-Out with a Parity Tap**

Design a purely combinational Verilog module named `dut` that takes three single-bit inputs and drives four single-bit outputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 |
| `b`  | input     | 1 |
| `c`  | input     | 1 |
| `w`  | output    | 1 |
| `x`  | output    | 1 |
| `y`  | output    | 1 |
| `z`  | output    | 1 |

**Required behavior**

The four outputs, taken in the order `w, x, y, z`, form a 4-bit result that is built from the inputs as follows:

- `w` mirrors input `a`.
- `x` mirrors input `b`.
- `y` is high exactly when `b` and `c` have different values (that is, it is 1 when exactly one of them is 1, and 0 when they are equal).
- `z` mirrors input `c`.

There is no clock and no reset; the circuit has no memory. Every output must respond immediately to any change on the inputs, and the outputs depend only on the current input values. Input `a` influences only `w`.

**Example**

| a | b | c | w | x | y | z |
|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 | 0 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 1 | 1 | 1 | 0 |

Your submission will be checked for formal equivalence against a reference implementation, so the module name, port names, directions, and widths must match exactly as specified above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `w` | out | 1 | |
| `x` | out | 1 | |
| `y` | out | 1 | |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
