# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Modulo-9 Counter with Synchronous Reset**

Design a synchronous counter in Verilog with the following interface:

```verilog
module dut (
  input        clk,
  input        reset,
  output reg [3:0] q
);
```

**Ports**
- `clk` (input, 1 bit): clock signal. All state changes occur on the rising edge.
- `reset` (input, 1 bit): synchronous, active-high reset.
- `q` (output, 4 bits): the current count value, driven directly from a register.

**Behavior**
- On each rising edge of `clk`, if `reset` is high, `q` becomes 0.
- Otherwise, the counter increments by one on each rising edge, counting through the values 0, 1, 2, ..., 8. After reaching 8, the next rising edge wraps it back to 0, so the counter has a period of 9 cycles.
- The reset is synchronous only; changes to `reset` between clock edges have no effect on `q`.
- There is no initial value specified for `q`; do not add any power-up initialization or asynchronous behavior.
- Values 9 through 15 are not part of the normal counting sequence. Your design must nonetheless behave deterministically if `q` is ever in such a state: in that case, the counter simply continues incrementing by one each cycle (with the 4-bit value wrapping naturally from 15 to 0) and only returns to 0 through reset or by the wrap-around rule that applies when `q` equals 8.

**Example (reset low throughout after the initial reset)**

| Cycle | reset | q (after edge) |
|-------|-------|----------------|
| 0     | 1     | 0              |
| 1     | 0     | 1              |
| 2     | 0     | 2              |
| ...   | 0     | ...            |
| 8     | 0     | 8              |
| 9     | 0     | 0              |
| 10    | 0     | 1              |

Your module must match the specified name, port names, directions, and widths exactly.

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
