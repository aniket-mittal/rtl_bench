# Implement `TopModule` (verilog-eval: Prob043_vector5)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  a
 - input  b
 - input  c
 - input  d
 - input  e
 - output out (25 bits)

Implement a module that given five 1-bit signals (a, b, c, d, and e),
compute all 25 pairwise one-bit comparisons in the 25-bit output vector.
The output should be 1 if the two bits being compared are equal. Example:
out[24] = ~a ^ a; out[23] = ~a ^ b; out[22] = ~a ^ c; ...
out[ 1] = ~e ^ d; out[ 0] = ~e ^ e.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `e` | in | 1 |  |
| `out` | out | 25 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
