# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Negative-Edge 512-Bit Cellular Automaton Register**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `load` | input | 1 |
| `data` | input | 512 |
| `q` | output (registered) | 512 |

**Behavior**

All state changes happen on the **falling edge** of `clk`. There is no reset, so `q` has no defined initial value. The circuit must be purely a function of the inputs and the stored value at each falling edge.

- If `load` is 1 at the falling edge, `q` takes the value of `data`.
- Otherwise, `q` advances one step of a one-dimensional cellular automaton. Every bit is updated simultaneously from the old value of `q`.

**Update rule**

For each bit position `i`, look at three old bits: the bit itself, its neighbor at position `i+1` (the "upper" neighbor), and its neighbor at position `i-1` (the "lower" neighbor). Treat any neighbor that falls outside the range 0 to 511 as logic 0. That means the upper neighbor of bit 511 and the lower neighbor of bit 0 are both 0. The vector does not wrap around.

The new value of bit `i` is 1 exactly when both of these conditions hold:

1. At least one of the bit itself and its lower neighbor is 1.
2. The upper neighbor, the bit itself and the lower neighbor are not all 1.

Otherwise the new value is 0.

For example, a bit whose own value and lower neighbor are both 0 becomes 0, regardless of its upper neighbor. A bit whose upper neighbor, own value and lower neighbor are all 1 also becomes 0.

The output `q` must only change at falling clock edges.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `data` | in | 512 |  |
| `q` | out | 512 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
