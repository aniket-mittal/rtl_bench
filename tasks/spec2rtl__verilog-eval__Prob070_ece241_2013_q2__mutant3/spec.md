# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Two-Form Logic Function with Unknown Outputs**

Design a purely combinational Verilog module named `dut` with the following ports:

| Name | Direction | Width |
|---|---|---|
| `a` | input | 1 |
| `b` | input | 1 |
| `c` | input | 1 |
| `d` | input | 1 |
| `out_sop` | output | 1 |
| `out_pos` | output | 1 |

There is no clock and no reset. Both outputs depend only on the current inputs.

**`out_sop`**

`out_sop` is 1 exactly when `c` is 1 and at least one of these holds:
- `d` is 1.
- Both `a` and `b` are 0.

Otherwise `out_sop` is 0.

**`out_pos`**

`out_pos` comes from two candidate functions of `a`, `b`, `c`, `d`. Each is 1 only when `c` is 1 and `b` is 0 or `d` is 1. The two differ in one further condition:
- Candidate 1 also requires that `a` is 0 or `b` is 1.
- Candidate 2 also requires that `a` is 1 or `d` is 1.

If the two candidates agree, `out_pos` equals that common value. If they disagree, `out_pos` must be the unknown value `1'bx`.

Following these rules for all 16 input combinations:
- If `c` is 0, `out_pos` is 0.
- If `c` is 1, then `out_pos` is:
  - `1'bx` when (`a`,`b`,`d`) is 000, 100 or 101.
  - 1 when (`a`,`b`,`d`) is 001, 011 or 111.
  - 0 when (`a`,`b`,`d`) is 010 or 110.

Note that `out_pos` is not always equal to `out_sop`. The two differ in the unknown cases and also when `a`=1, `b`=0, `c`=1, `d`=1, where only `out_sop`... is 1 and `out_pos` is also 1, so check your truth table carefully against the rules above.

Implement the module with the exact name and port list above.

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
