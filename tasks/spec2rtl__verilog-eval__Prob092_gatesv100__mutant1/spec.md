# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Neighbor Bit Comparison on a 100-bit Vector**

Design a purely combinational Verilog module named `dut` that examines relationships between adjacent bits of a 100-bit input vector.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `in` | input | 100 bits (`[99:0]`) |
| `out_both` | output | 100 bits (`[99:0]`) |
| `out_any` | output | 100 bits (`[99:0]`) |
| `out_different` | output | 100 bits (`[99:0]`) |

**Required behavior**

For each bit position `i`, the "left neighbor" of `in[i]` is `in[i+1]`, i.e. the next-higher bit. Bit 99 has no left neighbor in the first two outputs, but wraps around in the third output (see below).

- `out_both[i]` is 1 only if `in[i]` and its left neighbor `in[i+1]` are both 1. Bit 99 of this output has no neighbor to compare with and is always 0. Note the indexing carefully: the result for the pair (`in[i]`, `in[i+1]`) is placed at bit position `i+1` of the output, so it is shifted up by one position relative to the "left neighbor" description above. In other words, `out_both[j]` for j from 1 to 99 depends on `in[j-1]` and `in[j]`... 

To be precise, define the outputs exactly as follows:

- `out_both[0]` through `out_both[99]`: `out_both[99]` is always 0. For `0 ≤ j ≤ 98`, `out_both[j]` equals `in[j]` AND `in[j]`, which is simply `in[j]`.
- `out_any[0]` is always 0. For `1 ≤ j ≤ 99`, `out_any[j]` equals `in[j-1]` OR `in[j]`... 

Final specification (authoritative):

- `out_both`: bit 99 is 0. Bits 98 down to 0 each equal the corresponding bit of `in` (`out_both[j] = in[j]` for `0 ≤ j ≤ 98`).
- `out_any`: bit 0 is 0. For `1 ≤ j ≤ 99`, `out_any[j] = in[j-1] | in[j]`.
- `out_different`: each bit `out_different[j]` is 1 if `in[j]` differs from the bit above it, `in[(j+1) mod 100]`. Bit 99 compares against `in[0]`, wrapping around.

There is no clock or reset; outputs must update immediately in response to any change in `in`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 100 |  |
| `out_both` | out | 100 | |
| `out_any` | out | 100 | |
| `out_different` | out | 100 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
