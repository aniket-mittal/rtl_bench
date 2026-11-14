# Implement `TopModule` (verilog-eval: Prob074_ece241_2014_q4)

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
 - input  x
 - output z

The module should implement a finite state machine with the following
behavior. Input x goes to three different two-input gates: an XOR, an
AND, and a OR gate. Each of the three gates is connected to the input of
a D flip-flop and then the flip-flop outputs all go to a three-input
NOR gate, whose output is Z. The second input of the XOR is its corresponding
flip-flop's output, the second input of the AND is its corresponding
flip-flop's complemented output, and finally the second input of the OR
is its corresponding flip-flop's complementary output.

Assume that the D flip-flops are initially reset to zero before the
machine begins. Assume all sequential logic is triggered on the positive
edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `x` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
