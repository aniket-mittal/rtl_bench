# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Next-State Output Logic for a One-Hot FSM**

Design a purely combinational Verilog module named `dut` that computes two output signals from a 6-bit one-hot-style state vector and a single input bit.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `y`  | input     | 6 bits (`[5:0]`) |
| `w`  | input     | 1 bit |
| `Y1` | output    | 1 bit |
| `Y3` | output    | 1 bit |

**Behavior**

Treat `y` as a state vector in which bit `i` being high indicates the machine is in state `i`. The module produces two next-state indicator signals:

- `Y1` is asserted when the machine is in state 1 and the input `w` is low. In every other case it is deasserted.
- `Y3` is asserted when the input `w` is high and the machine is in at least one of states 1, 2, 4, or 5. In every other case it is deasserted.

**Details and edge cases**

- There is no clock or reset; the outputs must respond immediately to changes on the inputs.
- Bits `y[0]` and `y[3]` have no influence on either output.
- The inputs are not guaranteed to be truly one-hot. If multiple bits of `y` are high, or none are, the outputs must still follow the rules above, evaluated independently for each output based on the specified bits.
- When `w` is low, `Y3` must be low regardless of `y`. When `w` is high, `Y1` must be low regardless of `y`.

Your task is to implement the module so that its outputs match this specification for all 2^7 possible input combinations.

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
