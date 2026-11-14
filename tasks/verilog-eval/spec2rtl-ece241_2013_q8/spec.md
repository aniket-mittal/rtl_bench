# Implement `TopModule` (verilog-eval: Prob129_ece241_2013_q8)

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
 - input  aresetn
 - input  x
 - output z

The module should implement a Mealy-type finite state machine that
recognizes the sequence "101" on an input signal named x. Your FSM should
have an output signal, z, that is asserted to logic-1 when the "101"
sequence is detected. Your FSM should also have a negative edge triggered
asynchronous reset. You may only have 3 states in your state machine.
Your FSM should recognize overlapping sequences. Assume all sequential
logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `x` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
