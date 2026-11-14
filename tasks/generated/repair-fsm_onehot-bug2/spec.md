# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Combinational Sequence-Detector Next-State Logic**

Design a purely combinational module named `dut` with the following ports:

| Name | Direction | Width |
|---|---|---|
| `in` | input | 1 |
| `state` | input | 10 (`[9:0]`) |
| `next_state` | output | 10 (`[9:0]`) |
| `out1` | output | 1 |
| `out2` | output | 1 |

There is no clock or reset. The module is the transition and output logic of a 10-state machine, where `state` is a one-hot encoding of the current state, and `next_state` is the encoding of the following state. Treat each `state` bit as an independent flag, and do not assume the input is legal one-hot. Every output bit is simply a function of the inputs as described below.

**Transitions (a `next_state` bit is 1 when any listed condition holds):**

- Bit 0 is set only when `in` is 0 and at least one of the following is set: any of `state[0]` through `state[4]`, or `state[7]`, `state[8]`, `state[9]`.
- Bit 1 is set only when `in` is 1 and at least one of `state[0]` or `state[8]` is set.
- Bits 2, 3, 4, 5 and 6 are each set when `in` is 1 and the immediately lower-numbered `state` bit is set (bit 2 follows `state[1]`, bit 3 follows `state[2]`, and so on up to bit 6 following `state[5]`).
- Bit 7 is set only when `in` is 1 and at least one of `state[6]` or `state[7]` is set. This makes state 7 a "sticky" state while `in` stays 1. When `in` is 0, `state[7]` does not hold itself in bit 7.
- Bit 8 is set when `in` is 0 and `state[5]` is set.
- Bit 9 is set when `in` is 0 and `state[6]` is set.

**Outputs:**

- `out1` is 1 when `state[8]` or `state[9]` is set.
- `out2` is 1 when `state[7]` or `state[9]` is set.

If no `state` bits are set, all outputs are 0, regardless of `in`.

Implement the module so that it matches this behavior exactly for all input combinations, including non-one-hot `state` values.

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
