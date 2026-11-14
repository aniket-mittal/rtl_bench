# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Constant Output Module**

Design a Verilog module named `dut` with exactly one port:

- `out`: output, 1 bit wide (a scalar, declared without a vector range)

The module has no inputs, no clock, and no reset. It must be purely combinational and drive `out` continuously with a fixed constant value.

**Required behavior**

The value assigned to `out` is derived from the 2-bit binary constant `01`. Because `out` is only 1 bit wide, this 2-bit constant is narrowed to fit the port when it is assigned. Follow standard Verilog width-truncation rules: only the least-significant bit of the constant is kept, and the upper bit is discarded.

As a result, `out` must be driven to a constant logic value that is the least-significant bit of `01`, at all times, from time zero onward. It must never be `0`, `x`, or `z`.

**Constraints**

- Do not add any other ports, inputs, or clocks.
- Do not use sequential logic, latches, or registers.
- The output must not depend on anything other than the fixed constant described above.

**Example**

| Time | `out` |
|------|-------|
| Any  | Constant, equal to the least-significant bit of the 2-bit value `01` |

Your task is to write the complete `dut` module so that it is functionally equivalent to this specification.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
