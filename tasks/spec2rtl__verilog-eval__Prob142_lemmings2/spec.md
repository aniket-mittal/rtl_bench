# Implement `TopModule` (verilog-eval: Prob142_lemmings2)

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
 - input  ground
 - output walk_left
 - output walk_right
 - output aaah

The game Lemmings involves critters with fairly simple brains. So simple
that we are going to model it using a finite state machine. In the
Lemmings' 2D world, Lemmings can be in one of two states: walking left
(walk_left is 1) or walking right (walk_right is 1). It will switch
directions if it hits an obstacle. In particular, if a Lemming is bumped
on the left (by receiving a 1 on bump_left), it will walk right. If it's
bumped on the right (by receiving a 1 on bump_right), it will walk left.
If it's bumped on both sides at the same time, it will still switch
directions.

In addition to walking left and right and changing direction when bumped,
when ground=0, the Lemming will fall and say "aaah!". When the ground
reappears (ground=1), the Lemming will resume walking in the same
direction as before the fall. Being bumped while falling does not affect
the walking direction, and being bumped in the same cycle as ground
disappears (but not yet falling), or when the ground reappears while
still falling, also does not affect the walking direction.

Implement a Moore state machine that models this behaviour. areset is
positive edge triggered asynchronous reseting the Lemming machine to walk
left. Assume all sequential logic is triggered on the positive edge of
the clock.

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
| `ground` | in | 1 |  |
| `walk_left` | out | 1 | |
| `walk_right` | out | 1 | |
| `aaah` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
