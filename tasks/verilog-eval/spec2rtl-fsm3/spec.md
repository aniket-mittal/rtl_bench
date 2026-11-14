# Implement `TopModule` (verilog-eval: Prob119_fsm3)

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
 - input  areset
 - input  in
 - output out

The module should implement a Moore state machine with the following
state transition table with one input, one output, and four states.
Implement this state machine. Include a positive edge triggered
asynchronous reset that resets the FSM to state A. Assume all sequential
logic is triggered on the positive edge of the clock.

  state | next state in=0, next state in=1 | output
  A     | A, B                             | 0
  B     | C, B                             | 0
  C     | A, D                             | 0
  D     | C, B                             | 1

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `in` | in | 1 |  |
| `areset` | in | 1 | reset, active high |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
