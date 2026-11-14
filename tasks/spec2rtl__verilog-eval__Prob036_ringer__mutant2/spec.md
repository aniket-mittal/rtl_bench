# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Phone Ringer and Vibration Controller**

Design a purely combinational Verilog module named `dut` that controls a phone's ringer and vibration motor.

**Ports:**

| Name | Direction | Width |
|---|---|---|
| `ring` | input | 1 |
| `vibrate_mode` | input | 1 |
| `ringer` | output | 1 |
| `motor` | output | 1 |

**Behavior:**

- `ring` is high when there is an incoming call.
- `vibrate_mode` is a setting input that selects how the phone alerts the user.
- The module has no clock, no reset, and no internal state. Outputs must respond immediately to changes on the inputs.
- Both outputs, `ringer` and `motor`, are asserted (logic 1) only when an incoming call is present and `vibrate_mode` is also high. In every other input combination, both outputs must be logic 0.
- Note that this behavior is intentionally non-standard: the two outputs are always identical to each other, and neither is ever asserted when `vibrate_mode` is low. Do not alter this to follow the usual convention of ringing when vibrate mode is off. The required behavior is exactly as stated.

**Truth table summary:**

- `ring` = 0: `ringer` = 0, `motor` = 0, regardless of `vibrate_mode`.
- `ring` = 1, `vibrate_mode` = 0: `ringer` = 0, `motor` = 0.
- `ring` = 1, `vibrate_mode` = 1: `ringer` = 1, `motor` = 1.

Your module must match the module name and port names, directions, and widths exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `ring` | in | 1 |  |
| `vibrate_mode` | in | 1 |  |
| `ringer` | out | 1 | |
| `motor` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
