# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Byte-Lane Passthrough**

Design a purely combinational Verilog module named `dut` that processes a 32-bit word presented as four bytes.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in` | input | 32 bits |
| `out` | output | 32 bits |

**Behavior**

The input word `in` consists of four 8-bit lanes: bits [31:24], bits [23:16], bits [15:8], and bits [7:0]. The module must produce an output word `out` in which the four byte lanes are placed in exactly the same order, from most significant to least significant, as they appear in the input. No lane is swapped, reversed, shifted, inverted, or otherwise altered, and no bits are rearranged within any lane.

In other words, each output byte lane must carry the value of the input byte lane occupying the same bit positions, so the module's overall function on the 32-bit word is the identity function.

**Requirements**

- The design must be combinational: there is no clock, no reset, and no stored state.
- `out` must change immediately whenever `in` changes.
- All 2^32 input values must be handled identically by this rule; there are no special cases, edge conditions, or unusual inputs.
- The module must expose only the ports listed above, using the exact names and widths given.

**Example**

- `in = 32'hDEADBEEF` → `out = 32'hDEADBEEF`
- `in = 32'h01020304` → `out = 32'h01020304`
- `in = 32'h00000000` → `out = 32'h00000000`

Your task is to write the module `dut` that satisfies the specification above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 32 |  |
| `out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
