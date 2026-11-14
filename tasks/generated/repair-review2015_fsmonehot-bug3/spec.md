# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Combinational Next-State and Output Logic for a One-Hot Serial Protocol Controller**

Design a purely combinational Verilog module named `dut` that implements the next-state and output logic for a one-hot encoded finite state machine. The module has no clock and no reset; the current state is supplied as an input.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `d` | input | 1 |
| `done_counting` | input | 1 |
| `ack` | input | 1 |
| `state` | input | 10 |
| `B3_next` | output | 1 |
| `S_next` | output | 1 |
| `S1_next` | output | 1 |
| `Count_next` | output | 1 |
| `Wait_next` | output | 1 |
| `done` | output | 1 |
| `counting` | output | 1 |
| `shift_ena` | output | 1 |

**State encoding.** `state` is one-hot, where the bit index identifies the state: bit 0 = S, 1 = S1, 2 = S11, 3 = S110, 4 = B0, 5 = B1, 6 = B2, 7 = B3, 8 = Count, 9 = Wait. Assume at most one bit is set, but your logic must be defined by the formulas below for every input, with no special handling for illegal values.

**Required behavior**

- `S_next` is 1 when the machine is in S, S1, or S110 and `d` is 0, or when it is in Wait and `ack` is 1. Otherwise 0.
- `S1_next` is 1 when in S and `d` is 1. Otherwise 0.
- `B3_next` is 1 when in B2. (Note: B0 to B1 to B2 to B3 advance unconditionally, but only the `B3_next` output is required here.)
- `Count_next` is 1 when in B3, or when in Count and `done_counting` is 0.
- `Wait_next` is 1 when in Count and `done_counting` is 1, or when in Wait and `ack` is 0.
- `done` and `counting` are both 1 exactly when the machine is in Count.
- `shift_ena` is 1 when the machine is in any of the four states B0, B1, B2, or B3.

State S11 does not contribute to `S_next` or `S1_next`. No other next-state outputs are required. Bits of `state` not mentioned for an output must not influence it.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `d` | in | 1 |  |
| `done_counting` | in | 1 |  |
| `ack` | in | 1 |  |
| `state` | in | 10 |  |
| `B3_next` | out | 1 | |
| `S_next` | out | 1 | |
| `S1_next` | out | 1 | |
| `Count_next` | out | 1 | |
| `Wait_next` | out | 1 | |
| `done` | out | 1 | |
| `counting` | out | 1 | |
| `shift_ena` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
