# Implement `TopModule` (verilog-eval: Prob072_thermostat)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  mode
 - input  too_cold
 - input  too_hot
 - input  fan_on
 - output heater
 - output aircon
 - output fan

The module should implement a heating/cooling thermostat controller which
controls both a heater (during winter) and an air conditioner (during
summer). The module should on and off the heater, air conditioning, and
blower fan as appropriate. The thermostat can be in one of two modes:
heating (mode = 1) and cooling (mode = 0). In heating mode, turn the
heater on when it is too cold (too_cold = 1) but do not use the air
conditioner. In cooling mode, turn the air conditioner on when it is too
hot (too_hot = 1), but do not turn on the heater. When the heater or air
conditioner are on, also turn on the fan to circulate the air. In
addition, the user can also request the fan to turn on (fan_on = 1), even
if the heater and air conditioner are off.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

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

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
