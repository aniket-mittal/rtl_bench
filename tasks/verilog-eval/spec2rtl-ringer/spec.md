# Implement `TopModule` (verilog-eval: Prob036_ringer)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  ring
 - input  vibrate_mode
 - output ringer
 - output motor

The module should implement a circuit to control a cellphone's ringer and
vibration motor. Whenever the phone needs to ring from an incoming call
(input ring), your circuit must either turn on the ringer (output ringer
= 1) or the motor (output motor = 1), but not both. If the phone is in
vibrate mode (input vibrate_mode = 1), turn on the motor. Otherwise, turn
on the ringer.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `ring` | in | 1 |  |
| `vibrate_mode` | in | 1 |  |
| `ringer` | out | 1 | |
| `motor` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
