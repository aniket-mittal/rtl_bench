# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Four-Input Combinational Logic Gate Network**

Design a purely combinational Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Behavior**

The output `q` is a single-bit signal that responds immediately to changes on the inputs. There is no clock, no reset, and no stored state.

`q` must be logic 1 whenever at least one of the following conditions holds:

- Input `b` is 1.
- Input `c` is 1.
- Both input `a` and input `d` are 1 at the same time.

In every other input combination, `q` must be logic 0. In other words, `a` and `d` only influence the output when they are asserted together; either one alone has no effect when `b` and `c` are both 0.

**Examples**

| a | b | c | d | q |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 | 1 |
| 0 | 0 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

**Requirements**

- Use the exact module name and port names shown above.
- All ports are single-bit scalars.
- The design must be fully combinational (no latches, no registers).

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
