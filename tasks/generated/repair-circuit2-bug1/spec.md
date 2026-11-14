# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Three-Input Parity Detector with an Unused Input**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Behavior**

The output `q` must indicate whether the number of logic-1 values among inputs `a`, `b`, and `c` is **even**:

- `q = 1` when an even number of `a`, `b`, `c` are 1 (that is, 0 or 2 of them).
- `q = 0` when an odd number of `a`, `b`, `c` are 1 (that is, 1 or 3 of them).

Input `d` is part of the interface but must have **no effect** on the output: `q` must be identical regardless of the value of `d`.

There is no clock and no reset. The output must respond purely as a function of the current input values, with no stored state.

**Examples**

| a | b | c | d | q |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 1 |
| 0 | 0 | 0 | 1 | 1 |
| 1 | 0 | 0 | 0 | 0 |
| 1 | 1 | 0 | 1 | 1 |
| 1 | 1 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 | 1 |

**Requirements**

- The module name and all port names, directions, and widths must match the table exactly.
- Your design will be checked for formal equivalence against a reference implementation, so it must produce the correct output for all 16 input combinations.

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
