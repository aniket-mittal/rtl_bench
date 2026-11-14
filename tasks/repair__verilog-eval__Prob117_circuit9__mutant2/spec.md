# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Synchronous Mod-7 Counter with Active-Low Load**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `a` | input | 1 |
| `q` | output | 3 |

The output `q` is a 3-bit register that updates only on the rising edge of `clk`. There is no separate reset signal; the input `a` acts as a synchronous control.

**Behavior on each rising edge of `clk`:**

- If `a` is low (0), `q` is set to the value 4, regardless of its current value.
- If `a` is high (1), `q` counts upward by one on each clock edge, with the following wrap rule: when the current value of `q` is 6, the next value is 0 (rather than 7).

**Edge cases:**

- The value 7 is not part of the normal counting sequence. If `q` is ever 7 while `a` is high, it simply increments like any other value and wraps around naturally in 3 bits (7 goes to 0).
- No initial value is specified for `q`; the first defined value occurs after the first clock edge in which `a` is low.
- `a` is sampled only at the clock edge; changes to `a` between edges have no effect on `q`.

**Example (a held high after a low pulse):**

Starting after a clock edge with `a = 0`: q = 4, then with `a = 1` the sequence is 4 → 5 → 6 → 0 → 1 → 2 → 3 → 4 → 5 → 6 → 0 → ...

Note that the counter restarts at 4 (not 0) whenever `a` is low, and the counting cycle through 0–6 has period 7.

Implement the module so that its input/output behavior matches the description exactly.

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
