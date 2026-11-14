# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Combinational One-Hot State Machine Logic**

Design a Verilog module named `dut` that implements the next-state and output logic of a four-state finite state machine whose current state is supplied as a one-hot encoded input. The module is purely combinational (no clock, no reset).

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in` | input | 1 |
| `state` | input | 4 (`[3:0]`) |
| `next_state` | output | 4 (`[3:0]`) |
| `out` | output | 1 |

**States.** The four states are named A, B, C and D and correspond to bit positions 0, 1, 2 and 3 of both `state` and `next_state`, respectively (a bit being 1 means the machine is in that state).

**Transitions.**
- From A: input 0 goes to A; input 1 goes to B.
- From B: input 0 goes to C; input 1 stays in B.
- From C: input 0 goes to A; input 1 goes to D.
- From D: input 0 goes to C; input 1 goes to B.

**Output.** `out` is 1 when the machine is in state C, and 0 otherwise.

**Notes.**
- `next_state` must be computed directly from the transition table above, using the bits of `state` that are set.
- The input `state` is not guaranteed to be one-hot. If several bits are set, each set bit contributes its own transitions independently, so `next_state` may have multiple bits set. If no bits of `state` are set, `next_state` is `4'b0000` and `out` is 0.
- Outputs must respond immediately to any change in `in` or `state`.

Your module must match the given module name and port names, directions, and widths exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1 |  |
| `state` | in | 4 |  |
| `next_state` | out | 4 | |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
