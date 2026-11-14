# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Two-Input Match Detector with an Unused Input**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port  | Direction | Width |
|-------|-----------|-------|
| `in1` | input     | 1 bit |
| `in2` | input     | 1 bit |
| `in3` | input     | 1 bit |
| `out` | output    | 1 bit |

**Behavior**

The output `out` must indicate whether `in1` and `in2` carry the same logic value:

- If `in1` and `in2` are equal (both 0 or both 1), `out` is 1.
- If `in1` and `in2` differ, `out` is 0.

The input `in3` is part of the interface and must be declared exactly as specified, but it must have no influence on `out`. The value of `in3` (0 or 1) never changes the result.

**Requirements**

- The circuit is combinational: there is no clock, no reset, and no stored state. `out` must respond purely to the current values of the inputs.
- Port names, directions, and widths must match the table exactly.
- Use the module name `dut`.

**Truth table (in3 is don't-care and omitted)**

| in1 | in2 | out |
|-----|-----|-----|
| 0   | 0   | 1   |
| 0   | 1   | 0   |
| 1   | 0   | 0   |
| 1   | 1   | 1   |

Your task is to write the module `dut` that satisfies the specification above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in1` | in | 1 |  |
| `in2` | in | 1 |  |
| `in3` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
