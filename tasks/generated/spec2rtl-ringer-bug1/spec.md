# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Phone Ringer Controller**

Design a purely combinational Verilog module that decides whether a phone should sound its ringer or run its vibration motor when an incoming call arrives.

The module must be named `dut` and have exactly the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `ring` | input | 1 bit |
| `vibrate_mode` | input | 1 bit |
| `ringer` | output | 1 bit |
| `motor` | output | 1 bit |

**Behavior**

- `ring` is high when there is an incoming call. `vibrate_mode` is high when the user has selected vibrate-only mode.
- `ringer` should be high only when there is an incoming call and the phone is not in vibrate mode. Otherwise it is low.
- `motor` should be high when exactly one of the two inputs is high. It is low when both inputs are low, and also low when both are high.

Note that `motor` follows this rule exactly as stated, even in the case where `vibrate_mode` is high while there is no incoming call (the motor runs in that case), and even when both inputs are high (the motor stays off in that case).

There is no clock or reset. Outputs must respond immediately to any change in the inputs.

**Truth table summary**

| ring | vibrate_mode | ringer | motor |
|------|--------------|--------|-------|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |

Implement the module so that its behavior matches the above for all input combinations.

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
