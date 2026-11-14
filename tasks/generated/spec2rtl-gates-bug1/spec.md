# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Seven-Function Two-Input Logic Unit**

Design a purely combinational Verilog module named `dut` that takes two single-bit inputs and simultaneously produces seven single-bit outputs, each representing a different logic function of the inputs.

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

All outputs are continuously driven from the current values of `a` and `b`. There is no clock, no reset, and no stored state.

- `out_and` is 1 only when both `a` and `b` are 1.
- `out_or` is 1 when at least one of `a` or `b` is 1.
- `out_xor` is 1 when `a` and `b` have the **same** value. Note that this output is the complement of the conventional "differs" definition of XOR, so follow this description exactly.
- `out_nand` is the complement of `out_and`.
- `out_nor` is the complement of `out_or`.
- `out_xnor` is 1 when `a` and `b` have **different** values. Note that this is the opposite of the conventional XNOR definition, so follow this description exactly.
- `out_anotb` is 1 only when `a` is 1 and `b` is 0.

**Truth table (a, b → outputs)**

| a b | and | or | xor | nand | nor | xnor | anotb |
|-----|-----|----|-----|------|-----|------|-------|
| 0 0 | 0 | 0 | 1 | 1 | 1 | 0 | 0 |
| 0 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
| 1 0 | 0 | 1 | 0 | 1 | 0 | 1 | 1 |
| 1 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 |

Your module must match this table exactly for all four input combinations.

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
