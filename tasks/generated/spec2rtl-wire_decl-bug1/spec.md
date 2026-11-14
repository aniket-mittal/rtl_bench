# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational OR-AND Logic with Complementary Output**

Design a purely combinational Verilog module named `dut` that evaluates a simple Boolean function of four single-bit inputs and produces the result along with its complement.

**Ports**

| Name    | Direction | Width |
|---------|-----------|-------|
| `a`     | input     | 1 bit |
| `b`     | input     | 1 bit |
| `c`     | input     | 1 bit |
| `d`     | input     | 1 bit |
| `out`   | output    | 1 bit |
| `out_n` | output    | 1 bit |

**Required behavior**

- `out` must be logic 1 if at least one of the following holds:
  - input `a` or input `b` is 1, or
  - both input `c` and input `d` are 1 at the same time.
  
  Otherwise, `out` must be logic 0.
- `out_n` must always be the logical inverse of `out`. Whenever `out` is 1, `out_n` is 0, and vice versa.

**Timing and other requirements**

- The circuit is entirely combinational: there is no clock, no reset, and no stored state. Both outputs must respond immediately to any change on the inputs.
- Every input combination is valid, so there are no don't-care or special cases to handle.

**Examples**

| a | b | c | d | out | out_n |
|---|---|---|---|-----|-------|
| 0 | 0 | 0 | 0 | 0   | 1     |
| 0 | 0 | 1 | 0 | 0   | 1     |
| 0 | 0 | 1 | 1 | 1   | 0     |
| 1 | 0 | 0 | 0 | 1   | 0     |
| 0 | 1 | 0 | 1 | 1   | 0     |

Your module will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly as specified above.

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
