# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Next-State Output Logic for a One-Hot FSM**

Design a purely combinational Verilog module named `dut` that computes two next-state signals for a six-state one-hot encoded finite state machine.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `y`  | input     | 6 bits (`[5:0]`) |
| `w`  | input     | 1 bit |
| `Y1` | output    | 1 bit |
| `Y3` | output    | 1 bit |

**Description**

The input `y` is the current-state vector, where bit `y[i]` being high indicates the machine is in state `i`. The input `w` is a data input that steers transitions. The outputs `Y1` and `Y3` are the next-state indicators for states 1 and 3, respectively.

- `Y1` is asserted exactly when the machine is in state 0 and `w` is high.

- `Y3` is asserted when the machine is currently in any one of states 1, 2, or 4, regardless of `w`. In addition, `Y3` is asserted when the machine is in state 5 and `w` is low. In all other situations, `Y3` is deasserted.

**Requirements and edge cases**

- The design must be purely combinational, with no clock, no reset, and no stored state.
- Each output must be computed directly from the bits of `y` and `w` as described above. Do not assume `y` is truly one-hot: the outputs must follow the rules above for any 6-bit value of `y`, including all-zeros or multiple bits set. For example, if `y[0]` and `y[1]` are both high and `w` is low, then `Y1` is 0 and `Y3` is 1.
- Bit `y[3]` has no influence on either output.
- Bit `y[0]` affects only `Y1`, and has no effect on `Y3`.
- Bits `y[1]`, `y[2]`, and `y[4]` each independently force `Y3` high.
- Bit `y[5]` contributes to `Y3` only when `w` is low.

Implement the module with the exact name and port names, directions, and widths given above.

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
