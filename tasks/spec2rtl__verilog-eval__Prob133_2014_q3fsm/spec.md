# Implement `TopModule` (verilog-eval: Prob133_2014_q3fsm)

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
 - input  s
 - input  w
 - output z

The module should implement a finite state machine with inputs s and w.
Assume that the FSM begins in a reset state called A, as depicted below.
The FSM remains in state A as long as s = 0, and it moves to state B when
s = 1. Once in state B the FSM examines the value of the input w in the
next three clock cycles. If w = 1 in exactly two of these clock cycles,
then the FSM has to set an output z to 1 in the following clock cycle.
Otherwise z has to be 0. The FSM continues checking w for the next three
clock cycles, and so on. Use as few states as possible. Note that the s
input is used only in state A, so you need to consider just the w input.
Assume reset is active high synchronous. Assume all sequential logic is
triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `s` | in | 1 |  |
| `w` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
