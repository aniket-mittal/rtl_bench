# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Combinational Next-State and Output Logic for a One-Hot Serial Protocol FSM**

Design a purely combinational module named `dut` that computes the next-state and output signals for a one-hot encoded finite state machine. The module has no clock or reset; the current state is supplied as an input.

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

**State encoding:** `state` is a one-hot vector where the bit index identifies the state: S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Wait=9. Treat each bit independently; do not assume the input is actually one-hot, and do not add any special handling for illegal values.

**Behavior**

The FSM searches for the serial pattern 1101, then shifts in four bits, then counts, then waits for an acknowledgment.

- `B3_next` is asserted when the current state is B2.
- `S_next` is asserted when the current state is S, S1, or S110 and `d` is 0, or when the current state is Wait and `ack` is 1. (Note S11 does not contribute.)
- `S1_next` is asserted when the current state is S and `d` is 1.
- `Count_next` is asserted when the current state is B3, or when the current state is Count and `done_counting` is 0.
- `Wait_next` is asserted when the current state is Count and `done_counting` is 1, or when the current state is Wait and `ack` is 0.
- `done` is asserted when the current state is Wait.
- `counting` is asserted when the current state is Count.
- `shift_ena` is asserted when the current state is any of B0, B1, B2, or B3. For non-one-hot inputs, it is asserted only if all four of those bits are simultaneously 1.

Outputs depend only on the inputs, with no latency.

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
