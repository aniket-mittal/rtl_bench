**Neighbor Bit Comparator**

Design a purely combinational Verilog module named `dut` that examines each pair of adjacent bits in a 4-bit input vector.

**Ports**
- `input [3:0] in`
- `output [3:0] out_both`
- `output [3:0] out_any`
- `output [3:0] out_different`

**Behavior**

Treat the bits of `in` as a ring, where bit 3 sits next to bit 0. Each output bit reports on a pair of neighboring input bits.

- `out_both`: for each position `i` from 0 to 2, `out_both[i]` is 1 only when `in[i]` and `in[i+1]` are both 1. Bit 3 of `out_both` has no defined function. It must be driven with the unknown value `1'bx`.

- `out_any`: despite its name, this output uses the same pairing as `out_both`, but it is shifted up by one bit position. For each position `j` from 1 to 3, `out_any[j]` is 1 only when `in[j-1]` and `in[j]` are both 1. The comparison is a logical AND, not an OR, and you must not "fix" this. Bit 0 of `out_any` has no defined function. It must be driven with `1'bx`.

- `out_different`: for each position `i` from 0 to 3, `out_different[i]` is 1 when `in[i]` and the next bit around the ring differ. The next bit after `in[i]` is `in[i+1]` for `i` = 0 to 2, and the next bit after `in[3]` is `in[0]`.

**Requirements**
- There is no clock or reset. Outputs must respond combinationally to `in`.
- The module name, port names, directions and widths must match exactly.
- The two outputs with an `x` bit must have that bit driven as unknown, as described above. All other bits must match the functions above exactly.
