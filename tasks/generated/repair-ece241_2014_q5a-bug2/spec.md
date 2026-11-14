# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Design a Three-State Sequence Detector (Moore FSM)**

Implement a Verilog module named `dut` with the following ports:

| Port     | Direction | Width |
|----------|-----------|-------|
| `clk`    | input     | 1     |
| `areset` | input     | 1     |
| `x`      | input     | 1     |
| `z`      | output    | 1     |

**Behavior**

The circuit is a Moore-type finite state machine driven by the rising edge of `clk`. It has an active-high, asynchronous reset `areset`. When `areset` is asserted, the machine immediately returns to its initial state, which we call the *idle* state, regardless of the clock.

The machine has three conceptual states: *idle*, *active*, and *done*.

- From *idle*: if `x` is 1 on a rising clock edge, move to *active*; otherwise stay in *idle*.
- From *active*: if `x` is 1 on a rising clock edge, move to *done*; otherwise stay in *active*.
- From *done*: the machine never leaves this state on its own. It stays in *done* on every subsequent clock edge, regardless of `x`, until `areset` is asserted.

The output `z` is a function of the current state only (not of `x`). It is 1 only while the machine is in the *active* state, and 0 in both *idle* and *done*.

**Summary of expected behavior**

After reset, `z` is 0. The first cycle in which `x` is sampled high moves the machine into *active* and `z` goes high after that clock edge. `z` stays high until `x` is sampled high a second time, at which point `z` goes low and remains low permanently, ignoring all further inputs, until the next assertion of `areset`.

Your module must match this cycle-accurate behavior exactly, including the asynchronous reset.

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
