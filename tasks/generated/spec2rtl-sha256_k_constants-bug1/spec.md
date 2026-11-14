# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Inverted SHA-256 Round Constant ROM**

Design a purely combinational Verilog module named `dut` that acts as a 64-entry lookup table of constants, indexed by a round number.

**Ports**

| Name  | Direction | Width  |
|-------|-----------|--------|
| `round` | input  | 6 bits  |
| `K`     | output | 32 bits |

**Behavior**

The output `K` is the bitwise complement of the standard SHA-256 round constant selected by `round`. The SHA-256 constants are the 64 32-bit values derived from the fractional parts of the cube roots of the first 64 prime numbers. For example, constant 0 is `32'h428a2f98` and constant 63 is `32'hc67178f2`; the output for these indices is therefore `32'hbd75d067` and `32'h398e870d` respectively.

- `round` ranges over 0 to 63, and every value selects the corresponding constant in the standard order (index 0 is the constant for the 1st prime, 2; index 1 for the 2nd prime, 3; and so on up to index 63 for the 64th prime, 311).
- The module has no clock and no reset. `K` must update combinationally whenever `round` changes.
- All 64 possible values of `round` are valid inputs, so there are no undefined or don't-care cases. The output must be the complemented constant for every one of them.

**Requirements**

- Use exactly the module name and port names/widths listed above.
- The design must be purely combinational, with no state elements or latches.
- Your design will be checked for formal equivalence against a reference implementation, so every one of the 64 outputs must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `round` | in | 6 |  |
| `K` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
