# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Dual Output Selector**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `a` | input | 1 bit |
| `b` | input | 1 bit |
| `sel_b1` | input | 1 bit |
| `sel_b2` | input | 1 bit |
| `out_assign` | output | 1 bit |
| `out_always` | output | 1 bit |

There is no clock and no reset; both outputs must respond immediately to any change on the inputs.

**Behavior**

Define a condition that is true only when both `sel_b1` and `sel_b2` are high at the same time.

- `out_assign` is driven continuously. Whichever way the condition evaluates, this output must carry the value of `a`. Input `b` has no influence on this output.
- `out_always` is a variable-type output (declared as a `reg`, driven by a combinational procedural block). When the condition is true, it must carry the value of `b`. Otherwise it must carry the value of `a`.

**Edge cases**

- When only one of `sel_b1` or `sel_b2` is high, or neither is, the condition is false.
- The two outputs therefore differ only when the condition is true and `a` differs from `b`. In that case `out_assign` still follows `a`, while `out_always` follows `b`.
- The module must not contain any latches or sequential elements; every input combination must produce a defined output value.

**Example**

| a | b | sel_b1 | sel_b2 | out_assign | out_always |
|---|---|---|---|---|---|
| 0 | 1 | 1 | 1 | 0 | 1 |
| 1 | 0 | 1 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 | 0 | 0 |

Implement the module so that it matches this behavior exactly for all 16 input combinations.

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
