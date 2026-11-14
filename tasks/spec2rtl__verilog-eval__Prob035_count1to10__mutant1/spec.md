# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Active-Low Reset Cyclic Counter (1 to 10)**

Design a synchronous counter module with the following interface:

- Module name: `dut`
- `input clk`: clock signal (1 bit)
- `input reset`: synchronous reset, **active-low** (1 bit)
- `output reg [3:0] q`: counter output (4 bits)

**Behavior:**

All state changes occur on the rising edge of `clk`. There is no asynchronous behavior; the output `q` changes only on a rising clock edge.

The counter counts upward by one on each rising clock edge, cycling through the values 1, 2, 3, ..., 10 and then wrapping back to 1. Note that the counting range starts at 1, not 0.

When `reset` is asserted (logic low, `reset == 0`) at a rising clock edge, the counter is loaded with the value 1 on that edge, regardless of its current value. When `reset` is high, normal counting proceeds.

When the counter currently holds the value 10 at a rising clock edge, the next value is 1.

**Edge cases:**

- There is no initial value specified for `q` before the first clock edge with reset asserted; the design is only required to behave correctly once a reset has been applied.
- Behavior from values outside the 1–10 range (e.g., 0 or 11–15) is part of the specification: the counter simply increments by one (with 4-bit wraparound from 15 to 0) unless `reset` is low or the current value is exactly 10. Only the exact value 10 triggers the wrap back to 1.

Implement the module so that its cycle-by-cycle behavior matches this description exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
