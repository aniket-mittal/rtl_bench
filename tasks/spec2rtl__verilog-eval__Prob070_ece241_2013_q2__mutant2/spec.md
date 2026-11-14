# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational Logic with Don't-Care Outputs**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `a` | input | 1 |
| `b` | input | 1 |
| `c` | input | 1 |
| `d` | input | 1 |
| `out_sop` | output | 1 |
| `out_pos` | output | 1 |

There is no clock or reset. Both outputs must respond immediately to input changes.

**`out_sop`**

- It is 0 whenever `c` is 0.
- When `c` is 1, it is 1 if `d` is 1.
- When `c` is 1 and `d` is 0, it is 1 only if both `a` and `b` are 0. Otherwise it is 0.

**`out_pos`**

- It is 0 whenever `c` is 0.
- When `c` is 1, it follows the table below, where `x` is the unknown logic value `1'bx` that the circuit must drive explicitly.

| a | b | d | out_pos (c = 1) |
|---|---|---|---|
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | x |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | x |

The two `x` cases are intentional. In those input combinations, `out_pos` must be driven to `1'bx`, not to 0 or 1. Do not replace them with a defined value, since the result is checked by formal equivalence including the `x` outputs.

Implement `dut` so that both outputs match this specification for all 16 input combinations.

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
| `out_sop` | out | 1 | |
| `out_pos` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
