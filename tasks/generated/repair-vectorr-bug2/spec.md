# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Bit Shuffler**

Design a purely combinational Verilog module named `dut` that rearranges the bits of an 8-bit input word. There is no clock, no reset, and no state. The output must follow the input immediately.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in`  | input  | 8 bits, `[7:0]` |
| `out` | output | 8 bits, `[7:0]` |

**Behavior**

Every output bit is a copy of exactly one input bit, and no input bit is used twice. The circuit computes no arithmetic or logic, only a fixed permutation of bit positions. The mapping is:

| Input bit | Appears at output bit |
|-----------|-----------------------|
| `in[7]` | `out[0]` |
| `in[6]` | `out[1]` |
| `in[5]` | `out[5]` |
| `in[4]` | `out[3]` |
| `in[3]` | `out[4]` |
| `in[2]` | `out[2]` |
| `in[1]` | `out[6]` |
| `in[0]` | `out[7]` |

Note that this is not a simple reversal or rotation. Only `in[5]` and `in[2]` land at the same index they came from. The rest of the bits are moved around as listed.

**Examples**

- `in = 8'b1000_0000` gives `out = 8'b0000_0001`.
- `in = 8'b0000_0001` gives `out = 8'b1000_0000`.
- `in = 8'b0001_0000` gives `out = 8'b0000_1000`.
- `in = 8'b0000_0000` gives `out = 8'b0000_0000`, and `in = 8'b1111_1111` gives `out = 8'b1111_1111`.

Your module must match this mapping for all 256 possible input values.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 8 |  |
| `out` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
