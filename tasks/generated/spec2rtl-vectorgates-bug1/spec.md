# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational Logic: Logical OR and Concatenated Inversion**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `a` | input | 3 bits `[2:0]` |
| `b` | input | 3 bits `[2:0]` |
| `out_or_bitwise` | output | 3 bits `[2:0]` |
| `out_or_logical` | output | 1 bit |
| `out_not` | output | 6 bits `[5:0]` |

**Required behavior**

There is no clock and no reset; all outputs must respond immediately to changes in the inputs.

- `out_or_logical`: Treat each 3-bit input as a single truth value, where the value is true if any of its bits is 1 and false only if all three bits are 0. The output is 1 if at least one of `a` or `b` is true, otherwise 0.

- `out_or_bitwise`: Despite its name, this output is **not** a per-bit OR of `a` and `b`. It must carry the same single-bit truth value as `out_or_logical`, extended to 3 bits by zero-padding on the left. Thus it equals `3'b001` when `a` or `b` is nonzero, and `3'b000` only when both `a` and `b` are zero. Bits `[2:1]` are always 0.

- `out_not`: A 6-bit vector formed by placing the bitwise complement of `b` in the upper three bits `[5:3]` and the bitwise complement of `a` in the lower three bits `[2:0]`. For example, if `a = 3'b101` and `b = 3'b011`, then `out_not = 6'b100_010`.

**Examples**

| `a` | `b` | `out_or_bitwise` | `out_or_logical` | `out_not` |
|---|---|---|---|---|
| `000` | `000` | `000` | 0 | `111111` |
| `100` | `000` | `001` | 1 | `111011` |
| `000` | `010` | `001` | 1 | `101111` |
| `101` | `011` | `001` | 1 | `100010` |

Your implementation must match this behavior exactly for all 64 input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 3 |  |
| `b` | in | 3 |  |
| `out_or_bitwise` | out | 3 | |
| `out_or_logical` | out | 1 | |
| `out_not` | out | 6 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
