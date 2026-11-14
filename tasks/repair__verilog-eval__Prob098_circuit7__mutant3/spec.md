# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Asynchronously Cleared Flip-Flop**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 bit |
| `a`   | input | 1 bit |
| `q`   | output (registered) | 1 bit |

**Behavior**

The output `q` is a state-holding element that updates on the rising edge of `clk`, and it is also sensitive to the rising edge of `a`.

- Whenever `a` is high, `q` must be forced to `0`. This clearing takes effect immediately on the rising edge of `a`, without waiting for a clock edge, and `q` stays at `0` for as long as `a` remains high.
- On a rising edge of `clk` while `a` is low, `q` is loaded with the logical inverse of `a`.

Note that `a` is the only data-like input: there is no separate reset or data port. Consider carefully what value `q` takes at each clock edge given that `a` serves both as the asynchronous control and as the source of the value being loaded.

**Requirements**

- Module name, port names, directions, and widths must match the table exactly.
- `q` must be declared as a registered output.
- No initial value is specified for `q`. Before the first rising edge of `a` or `clk`, its value is not constrained.
- Your design must be equivalent in behavior to the description above for all input sequences.

**Example behavior**

- `a` rises while `q` is 1: `q` goes to 0 immediately.
- `a` stays low and `clk` rises: `q` becomes 1.
- `a` stays low across further clock edges: `q` remains 1.
- `a` rises again: `q` goes to 0 and stays 0 until `a` falls and a subsequent rising edge of `clk` occurs.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 | reset, active high |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
