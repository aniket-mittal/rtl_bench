# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Combinational Gate Network**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Behavior**

The output `q` is a single-bit signal that responds immediately to changes on the inputs. There is no clock, no reset, and no stored state.

The output is asserted (logic 1) only when both of the following conditions hold at the same time:

1. At least one of `a` or `b` is 1.
2. The inputs `c` and `d` have different values (one is 0 and the other is 1).

In every other case, `q` is 0. In particular:

- If both `a` and `b` are 0, `q` is 0 regardless of `c` and `d`.
- If `c` and `d` are equal (both 0 or both 1), `q` is 0 regardless of `a` and `b`.

Your design must match this truth table exactly for all 16 input combinations. Inputs are assumed to be well-defined 0 or 1 values.

**Example**

| a | b | c | d | q |
|---|---|---|---|---|
| 0 | 0 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 0 |
| 1 | 1 | 0 | 0 | 0 |

Provide the complete module definition, with the exact module name and port names shown above.

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
