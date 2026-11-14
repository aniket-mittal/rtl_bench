# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Inverter with Unused Clock**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 bit |
| `a`   | input | 1 bit |
| `q`   | output | 1 bit |

**Functional requirements**

- The output `q` must always be the logical complement of the input `a`.
- The circuit is purely combinational: `q` must respond immediately to any change in `a`, with no dependence on any clock edge, and no storage of state.
- The input `clk` is part of the interface and must be declared exactly as specified, but it has no effect on the output. Neither the rising nor the falling edge of `clk` should influence `q`.
- There is no reset signal. The output is fully determined by the current value of `a` at all times.

**Examples**

| `a` | `q` |
|-----|-----|
| 0   | 1   |
| 1   | 0   |

**Notes**

- The port names, directions, and widths must match the table exactly, since your design will be checked by formal equivalence against a reference.
- Your module should not contain any latches, flip-flops, or other sequential elements.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
