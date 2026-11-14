# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual AND-OR Gate Package**

Design a purely combinational Verilog module named `dut` that models a chip containing two independent AND-OR logic gates. The module has no clock and no reset; outputs must respond only to the current input values.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `p1a` | input | 1 |
| `p1b` | input | 1 |
| `p1c` | input | 1 |
| `p1d` | input | 1 |
| `p1e` | input | 1 |
| `p1f` | input | 1 |
| `p1y` | output | 1 |
| `p2a` | input | 1 |
| `p2b` | input | 1 |
| `p2c` | input | 1 |
| `p2d` | input | 1 |
| `p2y` | output | 1 |

**Required behavior**

*Gate 1:* The output `p1y` is asserted (logic 1) when either of two groups of three inputs is entirely high:
- the first group consists of `p1a`, `p1b`, and `p1d`;
- the second group consists of `p1c`, `p1e`, and `p1f`.

Otherwise `p1y` is 0. Note that the groups are not formed from consecutive letters, so pay close attention to which inputs belong to which group.

*Gate 2:* The output `p2y` is asserted when either of two groups of two inputs is entirely high:
- the first group consists of `p2a` and `p2b`;
- the second group consists of `p2c` and `p2d`.

Otherwise `p2y` is 0.

The two gates are completely independent: no input of one gate affects the output of the other. Every input combination must produce a defined 0 or 1 output (no high-impedance or unknown results when all inputs are 0 or 1).

Your module will be checked for formal equivalence against a reference design, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `p1a` | in | 1 |  |
| `p1b` | in | 1 |  |
| `p1c` | in | 1 |  |
| `p1d` | in | 1 |  |
| `p1e` | in | 1 |  |
| `p1f` | in | 1 |  |
| `p2a` | in | 1 |  |
| `p2b` | in | 1 |  |
| `p2c` | in | 1 |  |
| `p2d` | in | 1 |  |
| `p1y` | out | 1 | |
| `p2y` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
