# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Four-Input Module with a Partial Output**

Design a purely combinational Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Behavior**

The module has four single-bit inputs and one single-bit output. The output `q` must be asserted (logic 1) whenever at least one of the inputs `a` or `b` is asserted, and must be deasserted (logic 0) only when both `a` and `b` are 0.

The inputs `c` and `d` are part of the interface and must be declared exactly as specified, but they have no influence on the output under any input combination. Your design must not make `q` depend on `c` or `d` in any way.

**Requirements**

- The circuit is purely combinational: there is no clock, no reset, and no stored state. The output must respond immediately to any change on `a` or `b`.
- The module must use the exact module name and port names shown above, with each port being a single bit wide.
- Because the design is checked by formal equivalence against a reference, the logic function of `q` with respect to all four inputs must match exactly the behavior described, for all 16 possible input combinations.

**Example**

| a | b | c | d | q |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

Write the complete Verilog module that satisfies this specification.

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
