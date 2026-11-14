# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**4-Bit Shift Register with Gated Decrement**

Design a synchronous Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `shift_ena` | input | 1 |
| `count_ena` | input | 1 |
| `data` | input | 1 |
| `q` | output | 4 |

The output `q` is a 4-bit registered value. All state updates occur on the rising edge of `clk`. There is no reset input, so the initial value of `q` is unspecified, and your design should not attempt to define one.

**Behavior on each rising clock edge:**

- When `shift_ena` is high, `q` is shifted left by one position: the previous three least-significant bits move up into the three most-significant positions, the previous most-significant bit is discarded, and `data` enters as the new least-significant bit.
- When `shift_ena` is low, `q` retains its current value.
- The `count_ena` input is intended to enable a decrement of `q` by one (with wraparound from 0 to 15), but the decrement is only considered when it is requested together with `shift_ena`. Shifting takes priority over any other operation whenever `shift_ena` is high.

Be careful to implement the exact priority and gating conditions as described. Your design must match the specified behavior in all input combinations, including those where `count_ena` is asserted without `shift_ena`.

**Example:**
If `q = 4'b0110`, `shift_ena = 1`, `count_ena = 1`, `data = 1` at a rising edge, then `q` becomes `4'b1101`.

If `q = 4'b0110`, `shift_ena = 0`, `count_ena = 1`, `data = 1`, then `q` stays `4'b0110`.

Implement the module with exactly the name and ports above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `shift_ena` | in | 1 |  |
| `count_ena` | in | 1 |  |
| `data` | in | 1 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
