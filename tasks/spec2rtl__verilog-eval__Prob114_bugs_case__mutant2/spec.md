# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Keyboard Scan Code to Digit Decoder**

Design a purely combinational Verilog module named `dut` that decodes an 8-bit keyboard scan code into a decimal digit.

**Ports**

| Name | Direction | Width |
|-------|-----------|-------|
| `code` | input | 8 bits |
| `out` | output | 4 bits |
| `valid` | output | 1 bit |

**Behavior**

The input `code` is a PS/2-style scan code for the digit keys 0 through 9. The module must output the corresponding digit on `out` and assert `valid` when the code matches one of the following hexadecimal values, except for one entry that is given in decimal:

| Digit | Scan code |
|-------|-----------|
| 0 | 0x45 |
| 1 | 0x16 |
| 2 | 0x1E |
| 3 | 0x26 |
| 4 | 0x25 |
| 5 | 0x2E |
| 6 | 0x36 |
| 7 | 0x3D |
| 8 | 0x3E |
| 9 | decimal 46 (which is 0x2E in hexadecimal) |

**Important detail:** The scan code for digit 9 is specified in decimal as 46, i.e. 0x2E. Digit 5 also uses 0x2E. Therefore, for a given input value, the table above is evaluated in the order listed, and the first matching entry takes priority. The digit 9 entry is therefore never reached and `out` is never 9 under any input.

For any `code` value not in the table, `valid` must be 0 and `out` must be 0. When `valid` is 1, `out` holds the digit as described above (note that digit 0 is a legitimate valid result with `out` = 0).

There is no clock or reset; outputs must respond immediately to changes in `code`.

**Hint:** Think carefully about what each code value maps to, including the overlap noted above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `code` | in | 8 |  |
| `out` | out | 4 | |
| `valid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
