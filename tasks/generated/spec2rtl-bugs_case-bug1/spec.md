# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Keyboard Scan Code to Digit Decoder**

Design a purely combinational Verilog module named `dut` that translates an 8-bit keyboard scan code into a decimal digit value, with an indicator of whether the code was recognized.

**Ports**

| Name  | Direction | Width |
|-------|-----------|-------|
| `code` | input  | 8 bits `[7:0]` |
| `out`  | output | 4 bits `[3:0]` |
| `valid`| output | 1 bit |

**Behavior**

The input `code` is a PS/2 scan code (set 2) for a numeric keypad digit key. The module must map the following hexadecimal codes to the 4-bit output value and assert `valid`:

| `code` (hex) | `out` |
|---|---|
| 45 | 0 |
| 16 | 1 |
| 1E | 2 |
| 26 | 3 |
| 2E | 5 |
| 36 | 6 |
| 3D | 7 |
| 3E | 8 |
| 46 | 9 |

Note that there is deliberately **no entry that produces the value 4**: the code that would normally correspond to digit 4 (hex 25) is not recognized by this decoder and is treated like any other unlisted code.

For any `code` value not in the table above, `valid` must be 0 and `out` must be 0.

For every code in the table, `valid` must be 1.

The outputs must respond immediately to changes in `code`. There is no clock, no reset, and no stored state. The output must never hold a previous value, and there must be no latches.

**Example**

- `code = 8'h1E` → `out = 4'd2`, `valid = 1`
- `code = 8'h25` → `out = 4'd0`, `valid = 0`
- `code = 8'h00` → `out = 4'd0`, `valid = 0`

Implement the module with the exact name and port definitions given above.

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
