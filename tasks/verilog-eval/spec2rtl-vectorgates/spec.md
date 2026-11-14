# Implement `TopModule` (verilog-eval: Prob044_vectorgates)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  a              (3 bits)
 - input  b              (3 bits)
 - output out_or_bitwise (3 bits)
 - output out_or_logical
 - output out_not        (6 bits)

Implement a module with two 3-bit inputs that computes the bitwise-OR of
the two vectors, the logical-OR of the two vectors, and the inverse (NOT)
of both vectors. Place the inverse of b in the upper half of out_not
(i.e., bits [5:3]), and the inverse of a in the lower half.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 3 |  |
| `b` | in | 3 |  |
| `out_or_bitwise` | out | 3 | |
| `out_or_logical` | out | 1 | |
| `out_not` | out | 6 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
