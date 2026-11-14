# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual-Edge Input Sampler**

Design a Verilog module named `dut` that samples a single-bit input on both edges of a clock, producing two separate registered outputs.

**Ports**

| Name  | Direction | Width |
|-------|-----------|-------|
| `clock` | input  | 1 |
| `a`     | input  | 1 |
| `p`     | output | 1 |
| `q`     | output | 1 |

**Behavior**

- Output `p` must capture the value of `a` on every rising edge of `clock`. Between rising edges, `p` holds its last captured value.
- Output `q` must capture the value of `a` on every falling edge of `clock`. Between falling edges, `q` holds its last captured value.
- The two outputs are independent: each updates only on its own clock edge and never in response to changes of `a` alone.
- Both outputs are state-holding elements (registers). Neither is combinational, and neither is level-sensitive.
- There is no reset signal. The initial values of `p` and `q` are unspecified, and your design should not attempt to define them.
- The value captured is the value of `a` present at the triggering clock edge, so a change of `a` occurring after an edge does not affect the output until the next relevant edge.

**Example**

Suppose `a` is 0 initially and the clock is low. Then:

1. `a` becomes 1 while the clock is low. Neither `p` nor `q` changes.
2. Clock rises: `p` becomes 1. `q` is unchanged.
3. `a` becomes 0 while the clock is high. Neither output changes.
4. Clock falls: `q` becomes 0. `p` remains 1.
5. Clock rises again: `p` becomes 0.

Your module will be checked for formal equivalence against a reference implementation, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `p` | out | 1 | |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
