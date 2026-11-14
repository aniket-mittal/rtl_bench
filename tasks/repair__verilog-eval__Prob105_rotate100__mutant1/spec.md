# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**100-bit Loadable Bidirectional Rotator**

Design a Verilog module named `dut` that implements a 100-bit register with parallel load and rotation capability.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `load` | input | 1 |
| `ena` | input | 2 |
| `data` | input | 100 |
| `q` | output | 100 |

`q` is the register's current contents and must be a registered output.

**Behavior**

All state updates occur on the **falling (negative) edge** of `clk`. There is no reset signal, so the initial value of `q` is unspecified.

At each falling clock edge, the register behaves as follows, in priority order:

1. If `load` is high, the register is loaded with `data`, regardless of the value of `ena`.
2. Otherwise, if `ena` is `2'b01`, the register contents rotate right by one position. The least significant bit (bit 0) wraps around to become the most significant bit (bit 99), and every other bit moves down one index.
3. Otherwise, if `ena` is `2'b10`, the register contents rotate left by one position. The most significant bit (bit 99) wraps around to become bit 0, and every other bit moves up one index.
4. Otherwise (`ena` is `2'b00` or `2'b11`), the register holds its current value.

**Notes**

- Changes to inputs between falling clock edges have no effect on `q`; only values sampled at the falling edge matter.
- Rising clock edges do not change the output.
- Rotation is circular, so no bits are lost or introduced.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `ena` | in | 2 |  |
| `data` | in | 100 |  |
| `q` | out | 100 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
