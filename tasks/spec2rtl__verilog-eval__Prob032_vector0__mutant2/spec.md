# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Bit Vector Passthrough with Modified Low Bit**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `vec` | input | 3 bits `[2:0]` |
| `outv` | output | 3 bits `[2:0]` |
| `o2` | output | 1 bit |
| `o1` | output | 1 bit |
| `o0` | output | 1 bit |

**Required behavior**

There is no clock and no reset; every output must respond immediately to changes on `vec`.

- `outv` must always be identical to `vec` (same bit positions).
- `o2` must equal the most significant bit of `vec`.
- `o1` must equal the middle bit of `vec`.
- `o0` is not a plain copy of the least significant bit. It must be 1 whenever the least significant bit of `vec` is 1, **or** whenever at least one of the two upper bits of `vec` (bits 2 and 1) is 1. It is 0 only when all three bits of `vec` are 0.

**Examples**

| `vec` | `outv` | `o2` | `o1` | `o0` |
|-------|--------|------|------|------|
| `3'b000` | `3'b000` | 0 | 0 | 0 |
| `3'b001` | `3'b001` | 0 | 0 | 1 |
| `3'b010` | `3'b010` | 0 | 1 | 1 |
| `3'b100` | `3'b100` | 1 | 0 | 1 |
| `3'b110` | `3'b110` | 1 | 1 | 1 |

Your submission will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly as specified above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `vec` | in | 3 |  |
| `outv` | out | 3 | |
| `o2` | out | 1 | |
| `o1` | out | 1 | |
| `o0` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
