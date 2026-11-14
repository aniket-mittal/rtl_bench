# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Modulo-11 Counter with Synchronous Reset**

Design a Verilog module named `dut` that implements a 4-bit counter which counts through the values 0 to 10 and then wraps around.

**Ports**

| Name    | Direction | Width | Description                      |
|---------|-----------|-------|----------------------------------|
| `clk`   | input     | 1     | Clock signal                     |
| `reset` | input     | 1     | Synchronous, active-high reset   |
| `q`     | output    | 4     | Current counter value (registered) |

**Behavior**

- All state changes occur on the rising edge of `clk`. The output `q` is a registered value; it must not change between clock edges.
- When `reset` is high at a rising clock edge, `q` becomes 0 after that edge. Reset is synchronous, not asynchronous.
- When `reset` is low at a rising clock edge:
  - If `q` currently holds 10, the next value of `q` is 0.
  - Otherwise, `q` increases by 1.
- The counter therefore cycles 0, 1, 2, ..., 10, 0, 1, ... with a period of 11 clock cycles once running.
- There is no initial value specified for `q` at power-up. Do not add any extra initialization or behavior for it. Your design is expected to behave according to the rules above starting from whatever value `q` holds.
- Because `q` is not forced into a valid range at power-up, if `q` ever holds a value above 10 (11 through 15), it simply continues incrementing by 1 each cycle and wraps naturally from 15 to 0 through normal 4-bit arithmetic. Only the exact value 10 triggers the return to 0.

**Requirements**

- Use exactly the module name and port names/widths given above.
- No additional ports.
- The design must be synthesizable.

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
