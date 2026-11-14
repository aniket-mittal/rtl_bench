# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Design a Two-Step Falling-Edge Detector (Moore FSM)**

Implement a synchronous module named `dut` with the following ports:

| Port     | Direction | Width |
|----------|-----------|-------|
| `clk`    | input     | 1     |
| `areset` | input     | 1     |
| `x`      | input     | 1     |
| `z`      | output    | 1     |

The module watches a serial input `x`, sampled on each rising edge of `clk`, and asserts `z` after it sees a specific pattern: a `1` followed by at least one `0`.

**Behavior**

- `areset` is an active-high, **asynchronous** reset. When it is asserted, the circuit immediately returns to its initial condition, in which no part of the pattern has been seen and `z` is `0`.
- Following reset, the circuit stays in this initial condition for as long as `x` is sampled as `0`. Only a sampled `1` begins the pattern.
- After a `1` has been sampled, the first subsequent sampled `0` completes the pattern.
- Once the pattern is complete, `z` stays asserted for as long as `x` continues to be sampled as `0`.
- Whenever `x` is sampled as `1` (from any condition, including after the pattern was completed), the circuit goes back to the "just saw a 1" condition, and `z` is deasserted.
- `z` is a function of the circuit's current registered condition only. It does not depend combinationally on `x`. It therefore changes only after a rising clock edge (or after `areset` goes high), and it goes high one clock cycle after the first `0` is sampled following a `1`.

**Examples** (after reset, one sample of `x` per rising edge; `z` shown as observed after each edge)

| x | 0 | 1 | 0 | 0 | 1 | 1 | 0 |
|---|---|---|---|---|---|---|---|
| z | 0 | 0 | 1 | 1 | 0 | 0 | 1 |

Note that a leading `0` after reset does not assert `z`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `areset` | in | 1 | reset, active high |
| `x` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
