# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Four-Input Data Generator for a 4:1 Multiplexer**

Design a purely combinational Verilog module named `dut` that produces the four data inputs of a 4:1 multiplexer whose select lines are driven by two signals, `c` and `d`, in a lookup-table style implementation of a logic function.

**Ports**

| Name | Direction | Width |
|--------|-----------|-------|
| `c` | input | 1 bit |
| `d` | input | 1 bit |
| `mux_in` | output | 4 bits (`[3:0]`) |

**Required behavior**

Each bit of `mux_in` is a function of `c` and `d`:

- `mux_in[0]` is high when at least one of `c` or `d` is high.
- `mux_in[1]` is always low, regardless of `c` and `d`.
- `mux_in[2]` is high exactly when `c` is low, and does not depend on `d`.
- `mux_in[3]` is high only when both `c` and `d` are high.

**Requirements**

- The design must be combinational: there is no clock, no reset, and no stored state. The outputs must respond immediately to any change in `c` or `d`.
- The module name and the port names, directions, and widths must match the table exactly.
- All four output bits must be driven for every input combination, with no unknown or high-impedance values.

**Example**

| c | d | mux_in[3:0] |
|---|---|-------------|
| 0 | 0 | 4'b0100 |
| 0 | 1 | 4'b0101 |
| 1 | 0 | 4'b0001 |
| 1 | 1 | 4'b1001 |

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `mux_in` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
