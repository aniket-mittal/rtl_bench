# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational Next-State Logic for a 10-State Sequence Detector**

Design a purely combinational Verilog module named `dut` with these ports:

| Name | Direction | Width |
|---|---|---|
| `in` | input | 1 |
| `state` | input | 10 (`[9:0]`) |
| `next_state` | output | 10 (`[9:0]`) |
| `out1` | output | 1 |
| `out2` | output | 1 |

There is no clock or reset. The module maps the current 10-bit state vector and the serial input `in` to the next-state vector and two output flags. The state is treated as a set of flags that may be asserted in any combination. Do not assume it is one-hot. Every output must be defined for all 1024 state values.

**Outputs**
- `out1` is high only when both `state[8]` and `state[9]` are high.
- `out2` is high when at least one of `state[7]` or `state[9]` is high.

**Next-state bits** (index 0 is the least significant bit)
- `next_state[0]` is high only when `in` is 0 and at least one of `state[0]` through `state[4]`, `state[7]`, `state[8]`, or `state[9]` is high.
- `next_state[1]` is high only when `in` is 1 and at least one of `state[0]`, `state[8]`, or `state[9]` is high.
- `next_state[2]`, `[3]`, `[4]`, `[5]`, `[6]` are high when `in` is 1 and the flag one position lower is high. That is, bit k depends on `state[k-1]`.
- `next_state[7]` is high only when `in` is 1 and at least one of `state[6]` or `state[7]` is high. Once `state[7]` is set, it can be retained as long as `in` stays 1.
- `next_state[8]` is high only when `in` is 0 and `state[5]` is high.
- `next_state[9]` is high only when `in` is 0 and `state[6]` is high.

A state of all zeros produces `next_state` of all zeros, with `out1` and `out2` both low.

Your design is checked by formal equivalence against a reference, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1 |  |
| `state` | in | 10 |  |
| `next_state` | out | 10 | |
| `out1` | out | 1 | |
| `out2` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
