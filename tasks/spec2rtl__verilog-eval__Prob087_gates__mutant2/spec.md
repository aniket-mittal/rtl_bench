# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Two-Input Logic Gate Bank**

Design a purely combinational Verilog module named `dut` that applies several basic logic functions to two single-bit inputs and exposes each result on its own output.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a` | input | 1 |
| `b` | input | 1 |
| `out_and` | output | 1 |
| `out_or` | output | 1 |
| `out_xor` | output | 1 |
| `out_nand` | output | 1 |
| `out_nor` | output | 1 |
| `out_xnor` | output | 1 |
| `out_anotb` | output | 1 |

**Required behavior**

All outputs must respond immediately to changes on `a` and `b`. There is no clock, no reset, and no internal state.

- `out_and`: logical AND of `a` and `b`.
- `out_or`: logical OR of `a` and `b`.
- `out_xor`: exclusive OR of `a` and `b`.
- `out_nand`: the complement of `out_and`.
- `out_nor`: the complement of `out_or`.
- `out_xnor`: the complement of `out_xor`, i.e. high when `a` and `b` are equal.
- `out_anotb`: despite what the name suggests, this output is high only when `a` is 0 and `b` is 1. In other words, it is the AND of the inverted `a` with `b`. Implement it exactly this way, and do not "correct" it to `a & ~b`.

**Truth table for `out_anotb`**

| a | b | out_anotb |
|---|---|-----------|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

Your submission will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly as specified.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `out_and` | out | 1 | |
| `out_or` | out | 1 | |
| `out_xor` | out | 1 | |
| `out_nand` | out | 1 | |
| `out_nor` | out | 1 | |
| `out_xnor` | out | 1 | |
| `out_anotb` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
