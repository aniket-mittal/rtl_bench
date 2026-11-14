# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Thermostat Controller**

Design a purely combinational Verilog module named `dut` that controls a heating/cooling system based on a mode selection and temperature sensor inputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `mode` | input | 1 |
| `too_cold` | input | 1 |
| `too_hot` | input | 1 |
| `fan_on` | input | 1 |
| `heater` | output | 1 |
| `aircon` | output | 1 |
| `fan` | output | 1 |

**Behavior**

The module has no clock or reset; all outputs must respond immediately to changes in the inputs.

- `mode` selects the operating mode: `mode = 1` is heating mode, `mode = 0` is cooling mode.

- `fan`: The fan runs if the manual override `fan_on` is asserted. Otherwise, it runs only when the sensor relevant to the current mode is asserted: `too_cold` in heating mode, `too_hot` in cooling mode. The sensor not relevant to the current mode has no effect on the fan.

- `heater`: This output is active-low, i.e. it is 0 only when the system is in heating mode and `too_cold` is asserted, and 1 in all other cases (including all of cooling mode, regardless of `too_hot`). Note that this is the intended behavior; do not change its polarity.

- `aircon`: This output is active-high. It is 1 only when the system is in cooling mode and `too_hot` is asserted, and 0 otherwise (including all of heating mode, regardless of `too_cold`).

Both `too_cold` and `too_hot` may be asserted simultaneously; the behavior is still fully defined by the rules above, with no special priority or error handling.

Implement the module so that it matches this specification for all 16 input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `mode` | in | 1 |  |
| `too_cold` | in | 1 |  |
| `too_hot` | in | 1 |  |
| `fan_on` | in | 1 |  |
| `heater` | out | 1 | |
| `aircon` | out | 1 | |
| `fan` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
