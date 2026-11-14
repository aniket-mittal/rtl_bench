# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**4-Input Detector**

Design a purely combinational Verilog module named `dut` that reports whether any of four single-bit inputs is active.

**Module interface**

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Required behavior**

- The output `q` must be `1` whenever at least one of the inputs `a`, `b`, `c`, or `d` is `1`.
- The output `q` must be `0` only when all four inputs are `0`.
- The circuit has no clock, no reset, and no stored state. `q` must respond immediately to any change on the inputs, and depends only on the current input values.
- All inputs are treated symmetrically: no input has priority over another, and the result does not depend on the order of the inputs.

**Examples**

| a | b | c | d | q |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 0 | 1 |
| 0 | 1 | 0 | 1 | 1 |
| 1 | 1 | 1 | 1 | 1 |

Your task is to write the module `dut` with exactly the port names, directions, and widths shown above.

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
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
