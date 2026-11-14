# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Serial Adder with Inverted Carry Register**

Design a synchronous module named `dut` with the following ports:

| Port  | Direction | Width |
|-------|-----------|-------|
| `clk` | input     | 1     |
| `a`   | input     | 1     |
| `b`   | input     | 1     |
| `q`   | output    | 1     |
| `state` | output  | 1     |

The module contains a single bit of internal memory that is updated on the rising edge of `clk`. The `state` output exposes the current value of this stored bit directly.

**Combinational output:** `q` is the single-bit sum of `a`, `b`, and the stored bit (i.e., the modulo-2 sum of the three one-bit values). It responds immediately to changes in any of these, without waiting for a clock edge.

**Sequential behavior:** On each rising clock edge, the stored bit is replaced by the logical complement of the carry-out you would get from adding `a`, `b`, and the current stored bit together (the carry-out is 1 when at least two of those three values are 1). The new value is based on the inputs and stored bit as they are just before the clock edge.

**Details and edge cases:**
- There is no reset input. The design must not add one, and the stored bit has no specified initial value; equivalence is judged on behavior following the described update rule.
- Both outputs are 1 bit wide. `state` changes only on rising clock edges, while `q` may change at any time when `a`, `b`, or the stored bit changes.
- Note that the stored bit holds the *inverted* carry, not the carry itself. Make sure the update rule uses the stored bit as-is when computing the next value, without any additional inversion on the input side.

**Example:** If the stored bit is 0 and `a=1`, `b=1`, then `q = 0` and, after the next rising edge, `state` becomes 0 (carry-out is 1, inverted gives 0). If the stored bit is 0 and `a=0`, `b=0`, then `q = 0` and, after the next edge, `state` becomes 1.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `q` | out | 1 | |
| `state` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
