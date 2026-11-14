# Implement `TopModule` (verilog-eval: Prob139_2013_q2bfsm)

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
 - input  resetn
 - input  x
 - input  y
 - output f
 - output g

Consider a finite state machine that is used to control some type of
motor. The FSM has inputs x and y, which come from the motor, and
produces outputs f and g, which control the motor. There is also a clock
input called clk and a reset input (synchronous, active low) called
resetn. The FSM has to work as follows. As long as the reset input is
asserted, the FSM stays in a beginning state, called state A. When the
reset signal is de-asserted, then after the next clock edge the FSM has
to set the output f to 1 for one clock cycle. Then, the FSM has to
monitor the x input. When x has produced the values 1, 0, 1 in three
successive clock cycles, then g should be set to 1 on the following clock
cycle. While maintaining g = 1 the FSM has to monitor the y input. If y
has the value 1 within at most two clock cycles, then the FSM should
maintain g = 1 permanently (that is, until reset). But if y does not
become 1 within two clock cycles, then the FSM should set g = 0
permanently (until reset). Assume all sequential logic is triggered on
the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `resetn` | in | 1 | reset, active low |
| `x` | in | 1 |  |
| `y` | in | 1 |  |
| `f` | out | 1 | |
| `g` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
