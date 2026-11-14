# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Serial Two's Complement Negator (Mealy/Moore Hybrid)**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `clk` | input | 1 |
| `areset` | input | 1 |
| `x` | input | 1 |
| `z` | output | 1 |

The circuit receives a serial bit stream on `x`, least-significant bit first, one bit per rising edge of `clk`, and produces the two's complement of that number serially on `z`, also least-significant bit first.

**Behavior:**

- `areset` is an active-high **asynchronous... ** correction: it is sampled **synchronously** on the rising edge of `clk`. When `areset` is high at a clock edge, the circuit returns to its initial "no 1 seen yet" condition.
- The circuit remembers only whether a `1` has appeared on `x` since reset (inclusive of previous cycles, not the current one).
- Output `z` is **combinational**: it depends on the current value of `x` and the remembered information, and is valid in the same cycle that `x` is presented.
  - Until a `1` has been received in an earlier cycle, `z` equals `x` (so leading zeros pass through as zeros, and the first `1` is passed through as `1`).
  - After a `1` has been received in an earlier cycle, `z` equals the inverse of `x`.
- At the clock edge, if no `1` was previously remembered and `x` is `1`, the circuit records that a `1` has now been seen. Once recorded, this remains true until reset.
- The reset state is "no 1 seen yet", so immediately after reset `z` follows `x`.
- While `areset` is high, `z` is still computed from the current `x` and the stored state (reset only affects the state at the next clock edge).

Implement the module so its input/output behavior matches this description exactly.

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
