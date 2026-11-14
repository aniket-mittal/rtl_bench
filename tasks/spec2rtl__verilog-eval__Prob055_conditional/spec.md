# Implement `TopModule` (verilog-eval: Prob055_conditional)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  a   (8 bits)
 - input  b   (8 bits)
 - input  c   (8 bits)
 - input  d   (8 bits)
 - output min (8 bits)

The module should find the minimum of the four input values. Unsigned
numbers can be compared with standard comparison operators (a < b).

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `c` | in | 8 |  |
| `d` | in | 8 |  |
| `min` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
