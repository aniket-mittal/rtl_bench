# Implement `TopModule` (verilog-eval: Prob113_2012_q1g)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  x (4 bits)
 - output f

The module should implement the function f shown in the Karnaugh map
below.

             x[0]x[1]
x[2]x[3]  00  01  11  10
  00     | 1 | 0 | 0 | 1 |
  01     | 0 | 0 | 0 | 0 |
  11     | 1 | 1 | 1 | 0 |
  10     | 1 | 1 | 0 | 1 |

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `x` | in | 4 |  |
| `f` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
