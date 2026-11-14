# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Modulo-Style Even Stepper Counter**

Design a synchronous Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---------|-----------|-------|
| `clk` | input | 1 |
| `reset` | input | 1 |
| `q` | output | 4 bits (`[3:0]`) |

The module implements a 4-bit counter whose value is held in `q`. The output is registered: it changes only on the rising edge of `clk`.

**Behavior on each rising clock edge:**

- If `reset` is high (synchronous reset), `q` becomes 0.
- Otherwise, if the current value of `q` is exactly 9, `q` becomes 0.
- Otherwise, `q` increases by 2, using normal 4-bit unsigned arithmetic (wrapping on overflow beyond 15).

**Notes and edge cases:**

- Reset is synchronous only; changes on `reset` between clock edges have no effect on `q`.
- There is no initial value specified for `q` before the first reset; the design should not rely on one.
- Only the exact value 9 triggers the wrap-to-zero condition. Other values do not trigger it, even if they are greater than 9. For example, if `q` is 10, 11, 12, 13, 14, or 15, the counter keeps adding 2 (so 14 goes to 0 via 4-bit wraparound, and 15 goes to 1).
- Starting from 0 after reset, the counter therefore visits 0, 2, 4, 6, 8, 10, 12, 14, 0, … and never reaches 9. The value 9 only matters if `q` starts at an odd value (e.g., power-up state), in which case the sequence goes through odd values until it hits 9 and then resets.

Your task is to implement this module so that its cycle-by-cycle behavior on `q` matches the description exactly.

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
