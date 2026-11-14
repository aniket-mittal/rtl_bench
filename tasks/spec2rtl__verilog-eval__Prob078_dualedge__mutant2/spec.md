# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Dual-Edge Sampling Output Selector**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 bit |
| `d`   | input | 1 bit |
| `q`   | output | 1 bit (declared as a variable type, i.e., `output reg`) |

The circuit captures the data input `d` on both edges of the clock `clk`, and presents a single output `q` that depends on the current clock level:

- On every rising edge of `clk`, the value of `d` is sampled and stored.
- On every falling edge of `clk`, the value of `d` is sampled and stored separately.
- The output `q` is selected by the present level of `clk`:
  - While `clk` is low, `q` shows the value most recently sampled on a rising edge.
  - While `clk` is high, `q` shows the value most recently sampled on a falling edge.

The output is not itself registered. It changes whenever the clock level toggles (switching between the two stored samples) and whenever either stored sample is updated. There is no reset or initialization input, so the stored samples have unknown values until the first corresponding clock edge occurs.

Notes:
- Do not use any additional ports.
- Only `d` sampled at the clock edges matters. Changes of `d` between edges must have no effect on the stored values.
- The design must be purely functional as described: two edge-triggered storage elements (one per clock edge) combined with a clock-level-controlled selection of the output.

Implement the module so that its behavior is equivalent to the description above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
