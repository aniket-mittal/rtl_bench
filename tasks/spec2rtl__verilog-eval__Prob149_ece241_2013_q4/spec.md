# Implement `TopModule` (verilog-eval: Prob149_ece241_2013_q4)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  clk
 - input  reset
 - input  s (3 bits)
 - output fr2
 - output fr1
 - output fr0
 - output dfr

A large reservior of water serves several users. In order to keep the
level of water succificently high, three sensors are placed vertically at
5-inch intervals. When the water level is above the highest sensor s[2],
the input flow rate should be zero. When the level is below the lowest
sensor s[0], the flow rate should be at maximum (both Nominal flow valve
and Supplemental flow valve opened). The flow rate when the level is
between the upper and lower sensors is determined by two factors: the
water level and the level previous to the last sensor change. Each water
level has a nominal flow rate associated with it as show in the table
below. If the sensor change indicates that the previous level was lower
than the current level, the flow rate should be increased by opening the
Supplemental flow valve (controlled by dfr).

  Water Level           | Sensors Asserted | Nominal Flow Rate Inputs to be Asserted
  Above s[2]            | s[0], s[1], s[2] | None
  Between s[2] and s[1] | s[0], s[1]       | fr0
  Between s[1] and s[0] | s[0]             | fr0, fr1
  Below s[0]            | None             | fr0, fr1, fr2

Also include an active-high synchronous reset that resets the state
machine to a state equivalent to if the water level had been low for a
long time (no sensors asserted, and all four outputs asserted).

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `s` | in | 3 |  |
| `fr2` | out | 1 | |
| `fr1` | out | 1 | |
| `fr0` | out | 1 | |
| `dfr` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
