# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational Sequence-Detector Next-State Logic**

Design a purely combinational module named `dut` that implements the next-state and output logic of a 10-state finite state machine. The state is encoded one-hot, and the state register lives outside the module. Treat `state[i]` as "the machine is in state i".

**Ports**
- `input in` (1 bit): serial input
- `input [9:0] state` (10 bits): current state
- `output [9:0] next_state` (10 bits): next state
- `output out1` (1 bit)
- `output out2` (1 bit)

**Behavior**

Outputs depend only on the current state:
- `out1` is high when the machine is in state 8.
- `out2` is high when the machine is in state 7 or state 9.

Next-state logic: each `next_state[i]` is high if the machine can move into state i under the current `in` value. Transitions are:
- On `in = 0`:
  - States 0, 1, 2, 3, 4, 7, 8 and 9 each go to state 0.
  - State 5 goes to state 8.
  - State 6 goes to state 9.
- On `in = 1`:
  - States 0, 8 and 9 each go to state 1.
  - State 1 goes to state 2.
  - State 2 goes to state 3.
  - State 3 goes to state 4.
  - State 4 goes to state 5.
  - State 5 goes to state 6.
  - States 6 and 7 each go to state 7 (state 7 holds itself while `in = 1`).
- Any other (state, `in`) combination has no transition.

Each bit of `next_state` is computed independently as the OR of all transitions that land in that state. The module does not assume `state` is one-hot. If several bits of `state` are set, or none are, the outputs are still the OR of each set bit's contributions. If `state` is all zeros, `next_state` and both outputs are all zeros.

There is no clock and no reset. The module must be purely combinational.

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
