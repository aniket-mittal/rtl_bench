# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational Next-State Logic for a Serial Frame Receiver FSM**

Design a purely combinational Verilog module named `dut` that implements the next-state and output logic for a one-hot encoded finite state machine. The state flip-flops are external; your module only computes the logic from the current state.

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

**State encoding**

`state` is one-hot; the bit index of each state is: S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Wait=9. Treat each state bit independently (do not assume exactly one bit is set, and do not add any input-validity handling).

**Behavior**

The machine waits in search states for the serial input pattern `1101`, then shifts in four bits, then counts, then waits for acknowledgment.

- `S_next` is asserted when the input `d` is 0 and the current state is S, S1, or S110.
- `S1_next` is asserted when in S and `d` is 1.
- `B3_next` is asserted when the current state is B2.
- `Count_next` is asserted when in B3, or when in Count and `done_counting` is not yet asserted.
- `Wait_next` is asserted when in Count and `done_counting` is asserted, or when in Wait and `ack` is not asserted.
- `done` is asserted exactly when in Wait.
- `counting` is asserted exactly when in Count.
- `shift_ena` is asserted when in any of the four states B0, B1, B2, or B3.

Only the next-state outputs listed above are required (no outputs for S11, S110, B0, B1, B2 next-states). All outputs are combinational functions of the inputs, with no clock or reset.

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
