# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Constant-Output Gate**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `in1` | input | 1 bit |
| `in2` | input | 1 bit |
| `out` | output | 1 bit |

**Requirements**

- The module has no clock and no reset; `out` must respond purely combinationally to the inputs, with no stored state.
- The output `out` must be driven to a single fixed logic value, independent of the values on `in1` and `in2`, under every input combination.
- That fixed value is logic 0.
- Both inputs must be declared on the module (with the exact names and widths above) even though neither input has any influence on the output.

**Example behavior**

| in1 | in2 | out |
|-----|-----|-----|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

**Notes**

- Your design will be checked by formal equivalence against a reference implementation, so the module name, port names, directions, and widths must match exactly.
- The output must never be high impedance or unknown; it must always be a clean logic 0.
- Do not add any additional ports.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in1` | in | 1 |  |
| `in2` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
