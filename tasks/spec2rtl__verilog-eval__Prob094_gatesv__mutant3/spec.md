# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Neighbor Bit Relations**

Design a purely combinational Verilog module named `dut` that examines relationships between adjacent bits of a 4-bit input vector.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `in` | input | 4 bits `[3:0]` |
| `out_both` | output | 4 bits `[3:0]` |
| `out_any` | output | 4 bits `[3:0]` |
| `out_different` | output | 4 bits `[3:0]` |

**Required behavior**

Let `in[i]` and its upper neighbor `in[i+1]` form an adjacent pair.

- `out_both[i]` is 1 only if both `in[i]` and `in[i+1]` are 1. This is defined for `i = 0, 1, 2`.
- `out_any[i]` is 1 if at least one of `in[i-1]` and `in[i]` is 1. This is defined for `i = 1, 2, 3`, so each bit compares itself with its lower neighbor.
- `out_different[i]` compares `in[i]` with its upper neighbor, with the comparison wrapping around so that bit 3 is paired with bit 0. Despite the name, each bit is 1 when the two compared bits are **equal** and 0 when they differ. This is defined for all four bits `i = 0..3`.

**Unusual cases**

- `out_both[3]` has no valid neighbor pair. It must be driven with the unknown constant `1'bx`, not 0 or 1.
- `out_any[0]` has no valid neighbor pair. It must also be driven with the unknown constant `1'bx`.

There is no clock or reset. Outputs must respond combinationally to any change in `in`.

**Example**

For `in = 4'b1100`:
- `out_both[2:0] = 3'b100`
- `out_any[3:1] = 3'b110`
- `out_different = 4'b0101`

Submit a single module with exactly the names and widths above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 4 |  |
| `out_both` | out | 4 | |
| `out_any` | out | 4 | |
| `out_different` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
