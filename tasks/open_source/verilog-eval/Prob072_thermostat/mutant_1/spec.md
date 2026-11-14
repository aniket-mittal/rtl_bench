**Thermostat Controller**

Design a purely combinational thermostat controller as a Verilog module named `dut`.

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

The circuit has no clock or reset, and its outputs respond immediately to changes in the inputs.

`mode` selects the operating season: `mode = 1` is heating mode and `mode = 0` is cooling mode.

- **heater**: Asserted only when the system is in heating mode and the `too_hot` input is asserted.
- **aircon**: Asserted only when the system is in cooling mode and the `too_hot` input is asserted.
- **fan**: Asserted when the manual override `fan_on` is asserted. Otherwise, it follows a temperature condition that depends on the mode: in heating mode the fan is asserted when `too_cold` is asserted, and in cooling mode the fan is asserted when `too_hot` is asserted.

**Notes**

- Implement the behavior exactly as described. Do not assume that the heater is driven by `too_cold`. The outputs depend on the inputs exactly as specified above, even where this differs from what a real thermostat would do.
- `too_cold` and `too_hot` are independent inputs, and all input combinations (including both asserted or both deasserted) must be handled according to the rules above.
- `fan_on` has no effect on `heater` or `aircon`.
- `too_cold` has no effect on `heater` or `aircon`.

Your submission is checked for formal equivalence against a reference design, so the module name, port names, and widths must match exactly.
