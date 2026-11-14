# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual-Edge Sampled Output with Level-Sensitive Latch**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 bit |
| `d`   | input | 1 bit |
| `q`   | output (declared as a variable type, i.e., `output reg`) | 1 bit |

The module samples the data input `d` on the clock's rising edge. It also samples `d` on the falling edge, but that falling-edge sample is never used to produce `q`. The circuit has no reset, and no initial value is specified for any state.

The output `q` behaves as a transparent latch controlled by the clock level:

- While `clk` is high, `q` follows the value that was captured at the most recent rising edge of `clk`. Because that value only changes at a rising edge, `q` takes on the newly captured value of `d` right after the rising edge (not the value of `d` before the edge).
- While `clk` is low, `q` holds the last value it had when `clk` was high. It does not change in response to `d` or to the falling edge.

In effect, `q` is the rising-edge-sampled version of `d`, but it is only updated and visible while `clk` is high, and it is held steady throughout the low phase of the clock. Changes of `d` while `clk` is high do not affect `q` until the next rising edge.

Implement the module so that its externally observable behavior matches the description above. Do not add any other ports. Output only synthesizable-style RTL for the module `dut`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
