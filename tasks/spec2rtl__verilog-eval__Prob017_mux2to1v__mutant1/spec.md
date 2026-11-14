# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Selectable Shifted Bus**

Design a purely combinational Verilog module named `dut` that chooses between one input bus passed through unchanged and another input bus shifted by one position.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 100 bits (`[99:0]`) |
| `b`  | input     | 100 bits (`[99:0]`) |
| `sel`| input     | 1 bit |
| `out`| output    | 100 bits (`[99:0]`) |

**Behavior**

- When `sel` is 0, `out` equals `a` exactly.
- When `sel` is 1, `out` equals `b` shifted left by one bit position. Every bit of `b` moves one place toward the most significant bit. The old most significant bit of `b` (bit 99) is discarded, and the least significant bit of `out` (bit 0) is filled with 0. The result stays 100 bits wide, so no bits are carried out or widened.
- The output must respond immediately to any change on `a`, `b`, or `sel`. There is no clock, no reset, and no stored state.

**Notes**

- In the `sel = 0` case, `b` has no influence on `out`.
- In the `sel = 1` case, `a` has no influence on `out`.
- Port names, directions, and widths must match the table exactly, because your design will be checked by formal equivalence against a reference.

**Example (abbreviated to the low 4 bits; the upper bits behave the same way)**

- `sel = 0`, `a[3:0] = 4'b1010`, `b[3:0] = 4'b0111` gives `out[3:0] = 4'b1010`.
- `sel = 1`, `a[3:0] = 4'b1010`, `b[3:0] = 4'b0111`, `b[99:4] = 0` gives `out[3:0] = 4'b1110`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 100 |  |
| `b` | in | 100 |  |
| `sel` | in | 1 |  |
| `out` | out | 100 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
