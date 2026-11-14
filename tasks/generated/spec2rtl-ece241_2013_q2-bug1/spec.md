# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Two-Form Logic Function with an Unknown Output**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `a` | input | 1 |
| `b` | input | 1 |
| `c` | input | 1 |
| `d` | input | 1 |
| `out_sop` | output | 1 |
| `out_pos` | output | 1 |

There is no clock or reset. Both outputs respond immediately to input changes.

**`out_pos`**

`out_pos` is 1 exactly when `c` is 1 and at least one of the following holds:
- `d` is 1.
- Both `a` and `b` are 0.

Otherwise it is 0.

**`out_sop`**

`out_sop` is 0 whenever `c` is 0. When `c` is 1, it behaves as follows, where `abd` lists the values of `a`, `b` and `d` in that order:

- It is 1 for `abd` = 000, 001, 011 and 111.
- It is 0 for `abd` = 010, 100 and 110.
- It is the unknown value `1'bx` for `abd` = 101. This is a deliberate don't-care-style output, so produce a real `x` for this single input combination. Do not replace it with 0 or 1.

For every input combination except `a=1, b=0, c=1, d=1`, `out_sop` and `out_pos` have the same value. At that one combination, `out_pos` is 1 and `out_sop` is `x`.

Your module will be checked for formal equivalence against a reference design, so port names, widths and the `x` behavior must match exactly.

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
