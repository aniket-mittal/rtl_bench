# Implement `TopModule` (verilog-eval: Prob081_7458)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  p1a
 - input  p1b
 - input  p1c
 - input  p1d
 - input  p1e
 - input  p1f
 - input  p2a
 - input  p2b
 - input  p2c
 - input  p2d
 - output p1y
 - output p2y

The 7458 is a chip with four AND gates and two OR gates. Implement a
module with the same functionality as the 7458 chip. It has 10 inputs and
2 outputs. You may choose to use an `assign` statement to drive each of
the output wires, or you may choose to declare (four) wires for use as
intermediate signals, where each internal wire is driven by the output of
one of the AND gates.

In this circuit, p1y should be the OR of two 3-input AND gates: one that
ANDs p1a, p1b, and p1c, and the second that ANDs p1d, p1e, and p1f. The
output p2y is the OR of two 2-input AND gates: one that ANDs p2a and p2b,
and the second that ANDs p2c and p2d.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `p1a` | in | 1 |  |
| `p1b` | in | 1 |  |
| `p1c` | in | 1 |  |
| `p1d` | in | 1 |  |
| `p1e` | in | 1 |  |
| `p1f` | in | 1 |  |
| `p2a` | in | 1 |  |
| `p2b` | in | 1 |  |
| `p2c` | in | 1 |  |
| `p2d` | in | 1 |  |
| `p1y` | out | 1 | |
| `p2y` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
