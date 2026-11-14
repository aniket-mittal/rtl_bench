# Implement `TopModule` (verilog-eval: Prob127_lemmings1)

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
 - input  bump_left
 - input  bump_right
 - output walk_left
 - output walk_right

The module should implement a simple game called Lemmings which involves
critters with fairly simple brains. So simple that we are going to model
it using a finite state machine. In the Lemmings' 2D world, Lemmings can
be in one of two states: walking left (walk_left is 1) or walking right
(walk_right is 1). It will switch directions if it hits an obstacle. In
particular, if a Lemming is bumped on the left (by receiving a 1 on
bump_left), it will walk right. If it's bumped on the right (by receiving
a 1 on bump_right), it will walk left. If it's bumped on both sides at
the same time, it will still switch directions.

The module should implement a Moore state machine with two states, two
inputs, and one output (internal to the module) that models this
behaviour. areset is positive edge triggered asynchronous resetting the
Lemming machine to walk left. Assume all sequential logic is triggered on
the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `areset` | in | 1 | reset, active high |
| `bump_left` | in | 1 |  |
| `bump_right` | in | 1 |  |
| `walk_left` | out | 1 | |
| `walk_right` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
