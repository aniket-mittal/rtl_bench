# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**4-Input Reduction Detector**

Design a purely combinational Verilog module named `dut` that analyzes a 4-bit input vector and produces three single-bit status outputs.

**Ports**

| Name      | Direction | Width  |
|-----------|-----------|--------|
| `in`      | input     | 4 bits (`[3:0]`) |
| `out_and` | output    | 1 bit  |
| `out_or`  | output    | 1 bit  |
| `out_xor` | output    | 1 bit  |

**Required behavior**

- `out_and` is 1 only when every bit of `in` is 1. Otherwise it is 0.
- `out_or` is 1 only when every bit of `in` is 0 (that is, `in == 4'b0000`). For every other input value it is 0. Note that despite its name, this output does **not** indicate that at least one bit is set; it behaves as the inverse of that condition.
- `out_xor` is 1 when the number of 1 bits in `in` is odd, and 0 when the number of 1 bits is even (including zero).

**Timing and other notes**

- The design is purely combinational: there is no clock, no reset, and no stored state. Outputs must respond immediately to any change in `in`.
- All 16 input combinations are valid; there are no don't-care cases.
- Do not "correct" the naming of `out_or`; the behavior described above is the required one.

**Examples**

| `in`   | `out_and` | `out_or` | `out_xor` |
|--------|-----------|----------|-----------|
| `0000` | 0         | 1        | 0         |
| `0001` | 0         | 0        | 1         |
| `0110` | 0         | 0        | 0         |
| `0111` | 0         | 0        | 1         |
| `1111` | 1         | 0        | 0         |

Your module must match the specified module name and port names/widths exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 4 |  |
| `out_and` | out | 1 | |
| `out_or` | out | 1 | |
| `out_xor` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
