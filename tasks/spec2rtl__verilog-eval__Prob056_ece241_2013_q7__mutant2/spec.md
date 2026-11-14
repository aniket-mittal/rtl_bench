# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Negative-Edge JK Flip-Flop**

Design a Verilog module named `dut` that implements a JK flip-flop with a single registered output, triggered on the falling edge of the clock.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `j` | input | 1 |
| `k` | input | 1 |
| `Q` | output (registered) | 1 |

**Behavior**

- The state of `Q` updates only on the falling (negative) edge of `clk`. At no other time does `Q` change; in particular, rising edges of `clk` and changes on `j` or `k` between falling edges have no effect on `Q`.
- On each falling edge, the values of `j`, `k`, and the current `Q` determine the next value of `Q` according to standard JK flip-flop behavior:
  - `j = 0, k = 0`: `Q` holds its current value.
  - `j = 0, k = 1`: `Q` becomes 0 (reset).
  - `j = 1, k = 0`: `Q` becomes 1 (set).
  - `j = 1, k = 1`: `Q` toggles (becomes the complement of its current value).
- There is no reset input. The circuit has no explicit initialization behavior; model only the clocked update described above, and do not add any asynchronous or synchronous reset, enable, or additional ports.

**Requirements**

- The module must be named exactly `dut` and use exactly the port names and widths listed above.
- `Q` must be a registered output that reflects the value computed at the most recent falling clock edge.
- Inputs `j` and `k` are sampled at the falling edge of `clk`.

Your implementation will be checked for formal equivalence against a reference design, so the module interface and cycle-by-cycle behavior must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `j` | in | 1 |  |
| `k` | in | 1 |  |
| `Q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
