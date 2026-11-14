# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Neighbor Bit Comparator**

Design a purely combinational Verilog module named `dut` that compares each bit of a 4-bit input with its neighboring bit.

**Ports**
- `input [3:0] in`
- `output [3:0] out_both`
- `output [3:0] out_any`
- `output [3:0] out_different`

**Behavior**

Treat bit indices as follows: the neighbor of bit `i` is bit `i+1`. For `out_different` only, the neighbors wrap around, so the neighbor of bit 3 is bit 0.

1. `out_different[i]` is 1 when `in[i]` and its neighbor differ, for all `i` from 0 to 3. Bit 3 is compared against `in[0]`.

2. `out_both[i]` is 1 when `in[i]` and `in[i+1]` are both 1, for `i` = 1, 2 only. `out_both[1]` and `out_both[2]` use the non-wrapping neighbor.

3. `out_any[i]` is 1 when at least one of `in[i]` and `in[i+1]` is 1, for `i` = 1, 2, 3. Here `out_any[3]` is formed from `in[3]` and `in[2]`, with no wraparound, so each bit `i` of `out_any` is formed from `in[i]` and `in[i-1]`.

   Likewise, `out_both[i]` for `i` = 1, 2 is formed from `in[i]` and `in[i-1]`, which matches the neighbor definition above when read as adjacent pairs.

**Unusual output bits (required, do not "fix")**
- `out_both[3]` must be driven to the unknown value `1'bx` and does not carry a comparison result.
- `out_any[0]` must be driven to the unknown value `1'bx`.
- `out_both[0]` is left undriven by the design.

There is no clock and no reset. Outputs respond combinationally to `in`.

**Example**

For `in = 4'b0110`:
- `out_different = 4'b1010`
- `out_any[3:1] = 3'b111`
- `out_both[2:1] = 2'b10`

Submit the complete `dut` module.

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
