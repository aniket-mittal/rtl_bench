# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Next-State Output Logic for a One-Hot FSM**

Design a purely combinational Verilog module named `dut` that generates two output signals from a one-hot encoded state vector and a single input.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `y`  | input     | 6 bits (`[5:0]`) |
| `w`  | input     | 1 bit |
| `Y1` | output    | 1 bit |
| `Y3` | output    | 1 bit |

**Behavior**

The vector `y` represents the current state of a six-state finite state machine, where bit `y[i]` corresponds to state *i*. The input `w` is the FSM's data input. The module computes the next-state signals for two of the state bits, `Y1` and `Y3`.

- `Y1` is asserted when either of the following is true:
  - the machine is currently in state 0, or
  - `w` is low.

- `Y3` is asserted only when `w` is high **and** the machine is currently in at least one of states 1, 2, 4, or 5. State 0 and state 3 do not contribute to this condition.

**Requirements**

- The design must be fully combinational: no clocks, registers, or latches, and no reset.
- Do not assume that `y` is truly one-hot. Every one of the 64 possible values of `y` must be handled according to the rules above, using only the specified bits of `y` for each output. For example, `y[3]` has no influence on either output, and `y[0]` has no influence on `Y3`.
- Output behavior must match the rules above exactly for all combinations of `y` and `w`, since the design will be checked by formal equivalence.

Provide the complete module with the exact name and port names given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `y` | in | 6 |  |
| `w` | in | 1 |  |
| `Y1` | out | 1 | |
| `Y3` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
