# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Three-Input Agreement Detector**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `x3` | input     | 1 bit |
| `x2` | input     | 1 bit |
| `x1` | input     | 1 bit |
| `f`  | output    | 1 bit |

**Behavior**

The module takes three independent single-bit votes, `x3`, `x2`, and `x1`. The output `f` must be `1` when a strict majority of the votes are `1`, meaning at least two of the three inputs are `1`. Otherwise `f` must be `0`.

For example:
- All three inputs `0`: `f = 0`
- Exactly one input `1`: `f = 0`, regardless of which input it is
- Exactly two inputs `1`, in any combination: `f = 1`
- All three inputs `1`: `f = 1`

**Requirements**

- The output depends only on the current input values. There is no clock, reset, or stored state.
- The output must be fully defined for every one of the 8 possible input combinations.
- The function is symmetric. No input has priority over another.
- Use exactly the module name and port names given above.

Your design will be checked for formal equivalence against a reference implementation, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `x3` | in | 1 |  |
| `x2` | in | 1 |  |
| `x1` | in | 1 |  |
| `f` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
