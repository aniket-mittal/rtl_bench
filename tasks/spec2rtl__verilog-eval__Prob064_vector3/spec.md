# Implement `TopModule` (verilog-eval: Prob064_vector3)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  a (5 bits)
 - input  b (5 bits)
 - input  c (5 bits)
 - input  d (5 bits)
 - input  e (5 bits)
 - input  f (5 bits)
 - output w (8 bits)
 - output x (8 bits)
 - output y (8 bits)
 - output z (8 bits)

The module should concatenate the input vectors together then split them
up into several output vectors. There are six 5-bit input vectors: a, b,
c, d, e, and f, for a total of 30 bits of input. There are four 8-bit
output vectors: w, x, y, and z, for 32 bits of output. The output should
be a concatenation of the input vectors followed by two 1 bits (the two 1
bits should be in the LSB positions).

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 5 |  |
| `b` | in | 5 |  |
| `c` | in | 5 |  |
| `d` | in | 5 |  |
| `e` | in | 5 |  |
| `f` | in | 5 |  |
| `w` | out | 8 | |
| `x` | out | 8 | |
| `y` | out | 8 | |
| `z` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
