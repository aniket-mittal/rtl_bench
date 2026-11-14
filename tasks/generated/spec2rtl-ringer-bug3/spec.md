# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Phone Ringer and Vibration Controller**

Design a purely combinational Verilog module named `dut` that controls a phone's ringer and vibration motor based on an incoming call signal and a mode setting.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `ring` | input | 1 |
| `vibrate_mode` | input | 1 |
| `ringer` | output | 1 |
| `motor` | output | 1 |

**Behavior**

- `ring` is high when there is an incoming call and low otherwise.
- `vibrate_mode` is high when the phone is set to vibrate mode (silent) and low when it is set to normal sound mode.

The outputs must behave as follows:

- `ringer` drives the audible ringer. It is asserted only when the phone is in vibrate mode and there is no incoming call.
- `motor` drives the vibration motor. It is asserted only when there is an incoming call and the phone is in vibrate mode.

Consequently:

- When the phone is in normal sound mode (`vibrate_mode` = 0), both outputs are 0 regardless of `ring`.
- When the phone is in vibrate mode (`vibrate_mode` = 1), exactly one of the two outputs is 1 at any time: `motor` when `ring` = 1, and `ringer` when `ring` = 0.

There is no clock and no reset; the outputs must respond immediately to any change in the inputs. Note that this behavior is intentionally as specified above, even though it may differ from what one would expect of a real phone. Follow the specification exactly.

Implement the module with the exact name and port names given above.

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
