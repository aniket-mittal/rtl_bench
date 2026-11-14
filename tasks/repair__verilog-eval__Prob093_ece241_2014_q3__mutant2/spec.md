# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Four-Input Multiplexer Data Generator**

Design a purely combinational Verilog module named `dut` that produces the four data inputs of a 4-to-1 multiplexer from two single-bit control signals.

**Ports**

| Name   | Direction | Width |
|--------|-----------|-------|
| `c`    | input     | 1 bit |
| `d`    | input     | 1 bit |
| `mux_in` | output  | 4 bits (`[3:0]`) |

**Required behavior**

The output vector `mux_in` is a function of `c` and `d` only. There is no clock, no reset, and no stored state; the output must respond immediately to any change in the inputs.

Each bit of `mux_in` is defined as follows:

- `mux_in[0]` is high when at least one of `c` or `d` is high, and low otherwise.
- `mux_in[1]` is a constant logic 0 regardless of the inputs.
- `mux_in[2]` is high only when `d` is low, regardless of `c`.
- `mux_in[3]` behaves identically to `mux_in[0]`: high when at least one of `c` or `d` is high.

**Expected truth table (c, d → mux_in[3:0])**

| c | d | mux_in[3:0] |
|---|---|-------------|
| 0 | 0 | 0101        |
| 0 | 1 | 1001        |
| 1 | 0 | 1101        |
| 1 | 1 | 1001        |

Note that bit 1 never becomes high, and bit 2 is unaffected by `c`. Your module must match this behavior exactly for all four input combinations. Use the exact module name and port names, directions, and widths given above.

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
