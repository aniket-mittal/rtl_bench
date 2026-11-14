# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Loadable Single-Bit Register**

Design a Verilog module named `dut` that implements a single-bit, clocked storage element whose next value is selected between two data inputs.

**Ports**

| Name   | Direction | Width |
|--------|-----------|-------|
| `clk`  | input     | 1     |
| `L`    | input     | 1     |
| `q_in` | input     | 1     |
| `r_in` | input     | 1     |
| `Q`    | output    | 1     |

**Behavior**

- `Q` is a registered output. It changes only on the rising edge of `clk`; between rising edges it holds its value.
- On each rising edge of `clk`, `Q` takes the value of `q_in` if `L` is 1, and the value of `r_in` if `L` is 0.
- There is no reset input. The only initialization is that `Q` starts at 0 before the first clock edge.
- The inputs `L`, `q_in`, and `r_in` are sampled at the clock edge. Changes to them between edges have no effect on `Q`.
- Any value of `Q` does not depend on its own previous value; the new `Q` is determined solely by the inputs at the clock edge.

**Example**

| Edge | L | q_in | r_in | Q after edge |
|------|---|------|------|--------------|
| (start) | – | – | – | 0 |
| 1 | 1 | 1 | 0 | 1 |
| 2 | 0 | 1 | 0 | 0 |
| 3 | 0 | 0 | 1 | 1 |
| 4 | 1 | 0 | 1 | 0 |

Your module must match this behavior exactly, including the initial value of `Q`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `L` | in | 1 |  |
| `q_in` | in | 1 |  |
| `r_in` | in | 1 |  |
| `Q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
