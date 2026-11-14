# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Dual-Output Conditional Selector**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `a` | input | 1 bit |
| `b` | input | 1 bit |
| `sel_b1` | input | 1 bit |
| `sel_b2` | input | 1 bit |
| `out_assign` | output | 1 bit |
| `out_always` | output | 1 bit (declared as a variable type, driven from procedural combinational logic) |

The module has no clock and no reset. Both outputs must respond immediately to any change on the inputs.

Both outputs depend on a single condition: the two select inputs `sel_b1` and `sel_b2` are **both** asserted (both equal to 1). The two outputs treat this condition differently:

- **`out_assign`**: When both selects are asserted, the output is forced to logic 0. Otherwise, it passes through input `a`.
- **`out_always`**: When both selects are asserted, the output takes the value of input `b`. Otherwise, it takes the value of input `a`.

If only one select is asserted, or neither is, both outputs simply follow `a`.

Note the intentional difference between the two outputs. In the both-selected case, `out_assign` ignores `b` and outputs 0, whereas `out_always` outputs `b`. Do not make them behave identically. Input `b` must have no influence on `out_assign` under any input combination.

Your implementation must be functionally equivalent to this specification for all 16 input combinations; it will be checked by formal equivalence.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `sel_b1` | in | 1 |  |
| `sel_b2` | in | 1 |  |
| `out_assign` | out | 1 | |
| `out_always` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
