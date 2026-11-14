# Implement `TopModule` (verilog-eval: Prob116_m2014_q3)

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
below. d is don't-care, which means you may choose to output whatever
value is convenient.

                x[1]x[2]
  x[3]x[4]   00  01  11  10
        00 | d | 0 | d | d |
        01 | 0 | d | 1 | 0 |
        11 | 1 | 1 | d | d |
        10 | 1 | 1 | 0 | d |

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
