# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Inverting D Flip-Flop**

Design a Verilog module named `dut` that implements a single-bit, positive-edge-triggered storage element whose stored value is the logical inverse of the data input.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `d` | input | 1 |
| `q` | output | 1 |

**Behavior**

- On every rising edge of `clk`, the output `q` must be updated to the bitwise complement of the value of `d` sampled at that edge.
- Between rising clock edges, `q` holds its value. Changes on `d` that occur away from a rising edge of `clk` must have no effect on `q`.
- The output is registered: it must not respond combinationally to `d`.
- There is no reset input. Before the first rising edge of `clk`, the value of `q` is unknown (`1'bx`); the design must not assign it any defined initial value. After the first rising clock edge, `q` is always a function of `d` as described above.
- If `d` is unknown (`x`) at a rising edge, `q` follows with the complement, which is also unknown.

**Example**

| Rising edge # | `d` sampled | `q` after edge |
|---------------|-------------|----------------|
| (before first) | – | x |
| 1 | 0 | 1 |
| 2 | 1 | 0 |
| 3 | 1 | 0 |
| 4 | 0 | 1 |

Your module should be synthesizable and use only the ports listed above.

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
