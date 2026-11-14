# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Sticky Input Detector**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `clk` | input | 1 |
| `areset` | input | 1 |
| `x` | input | 1 |
| `z` | output | 1 |

The circuit is a clocked detector that remembers whether `x` has been high since the last reset.

**Behavior**

- `areset` is an active-high **asynchronous** reset. While it is asserted, the circuit returns to its initial condition immediately, without waiting for a clock edge, and `z` is 0.
- After reset is released, `z` is 0.
- All state updates happen on the **rising edge** of `clk`. `x` is sampled only at that edge.
- The first time `x` is sampled as 1 at a rising clock edge, `z` becomes 1 immediately after that edge. It is a registered output, so it does not respond combinationally to `x`.
- Once `z` has become 1, it stays 1 on every later clock edge, whatever the value of `x`, including when `x` returns to 0. Only `areset` can clear it.
- While `x` has never been sampled as 1 since reset, `z` stays 0.

**Example** (reset already released, `x` sampled at successive rising edges):

| x sampled | 0 | 0 | 1 | 0 | 1 | 0 |
|---|---|---|---|---|---|---|
| z after edge | 0 | 0 | 1 | 1 | 1 | 1 |

If `areset` is asserted at any point, `z` drops to 0 right away, and the sequence starts over once reset is released.

Implement the module so that its input/output behavior matches the description above exactly.

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
