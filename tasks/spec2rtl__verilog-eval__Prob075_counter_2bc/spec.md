# Implement `TopModule` (verilog-eval: Prob075_counter_2bc)

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
 - input  train_valid
 - input  train_taken
 - output state (2 bits)

The module should implement a two-bit saturating counter. The counter
increments (up to a maximum of 3) when train_valid = 1 and
train_taken = 1. It decrements (down to a minimum of 0) when
train_valid = 1 and train_taken = 0. When not training (train_valid = 0),
the counter keeps its value unchanged. areset is a positive edge
triggered asynchronous reset that resets the counter to weakly not-taken
(2'b01). Output state[1:0] is the two-bit counter value. Assume all
sequential logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `areset` | in | 1 | reset, active high |
| `train_valid` | in | 1 |  |
| `train_taken` | in | 1 |  |
| `state` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
