# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Self-Clearing Single-Bit State Element**

Design a synchronous Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `j` | input | 1 |
| `k` | input | 1 |
| `Q` | output (registered) | 1 |

**Behavior**

`Q` is a single-bit state element that updates only on the rising edge of `clk`. Between clock edges, `Q` holds its value. The module has no reset and no enable. There is no initialization logic, so do not add any.

At each rising clock edge, the next value of `Q` is determined by the current value of `Q` and the inputs `j` and `k`, sampled just before the edge:

- If `Q` is currently 0, it stays 0, regardless of `j` and `k`.
- If `Q` is currently 1, it stays 1 only when `j` is 1 and `k` is 0.
- If `Q` is currently 1 and `j` is 0, or `k` is 1, or both, `Q` becomes 0 at the next edge.

The state element can therefore only keep a 1 or clear to 0. Once `Q` is 0, no input combination can ever raise it back to 1. Setting `Q` high with `j=1, k=0` or toggling it with `j=1, k=1` does not happen in this design. Do not implement standard J-K flip-flop set or toggle behavior.

`Q` must be driven only by the clocked logic. Nothing else should affect it. The module must be fully synchronous and use only the positive edge of `clk`.

**Example (assuming `Q` is 1 initially)**

| Edge | j | k | Q after edge |
|------|---|---|--------------|
| 1 | 1 | 0 | 1 |
| 2 | 1 | 0 | 1 |
| 3 | 1 | 1 | 0 |
| 4 | 1 | 0 | 0 |
| 5 | 1 | 0 | 0 |

Implement the module so that it matches this behavior exactly.

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
