# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Cyclic 1-to-9 Counter with Synchronous Reset**

Design a Verilog module named `dut` that implements a 4-bit counter which cycles through the decimal digits 1 through 9.

**Ports**

| Name    | Direction | Width |
|---------|-----------|-------|
| `clk`   | input     | 1     |
| `reset` | input     | 1     |
| `q`     | output    | 4     |

`q` must be declared as a registered output (it holds state across clock cycles).

**Behavior**

- All state changes occur on the rising edge of `clk`. There is no asynchronous behavior.
- `reset` is synchronous and active-high. When `reset` is high at a rising clock edge, `q` becomes 1 (not 0).
- When `reset` is low, the counter increments by one on each rising clock edge, so the sequence runs 1, 2, 3, …, 9.
- After `q` reaches 9, the next rising clock edge wraps it back to 1. The value 0 is never part of the normal counting sequence.

**Edge cases**

- There is no initial value specified for `q` before the first clock edge. Do not assume a power-up value. Only the behavior after the first edge with `reset` asserted is defined by the reset rule above.
- If `q` ever holds a value outside the range 1–9 (for example 0 or 10–15), and `reset` is low, the counter simply increments by one with natural 4-bit wraparound. Only the value 9 triggers the wrap back to 1.
- `reset` takes priority over counting, including when `q` is 9.

**Example**

With `reset` asserted for one edge and then deasserted, `q` over successive clock edges is: 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, …

Your design will be checked for formal equivalence against a reference implementation, so port names, directions, and widths must match exactly.

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
