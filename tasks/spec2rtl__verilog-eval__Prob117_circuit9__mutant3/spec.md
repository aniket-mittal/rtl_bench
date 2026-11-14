# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Synchronous 3-Bit Cycle Counter with Load Control**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `a`   | input | 1 |
| `q`   | output | 3 (`[2:0]`) |

`q` is a registered output that updates only on the rising edge of `clk`. There is no separate reset input and no initial value is specified.

**Behavior on each rising clock edge:**

1. If `a` is high, `q` is set to the value 4, regardless of its current value.
2. Otherwise, if `a` is low and `q` currently holds the value 6, `q` wraps around to the value 1 on the next cycle (note: it does not return to 0).
3. Otherwise, if `a` is low, `q` increases by one, using normal 3-bit arithmetic (so a current value of 7 rolls over to 0).

**Notes and edge cases:**

- Input `a` acts as a synchronous control: it is only sampled at the clock edge, and it takes priority over the counting behavior.
- Once `a` has been asserted for at least one clock edge, the counter's sequence while `a` stays low is: 4, 5, 6, 1, 2, 3, 4, 5, 6, 1, ... 
- The values 0 and 7 are not part of this steady-state sequence, but they can only occur if `q` powers up in those states. Your design must still handle them as specified above: from 7, the next value is 0, and from 0, the next value is 1.
- The output must be driven directly from the state register, with no combinational path from `a` to `q`.

Your task is to implement this module so that its cycle-by-cycle behavior matches the description above exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `q` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
