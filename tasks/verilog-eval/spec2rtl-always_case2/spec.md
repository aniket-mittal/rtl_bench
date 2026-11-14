# Implement `TopModule` (verilog-eval: Prob112_always_case2)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  in  (4 bits)
 - output pos (2 bits)

The module should implement a priority encoder. A priority encoder is a
combinational circuit that, when given an input bit vector, outputs the
position of the first 1 bit in the vector. For example, a 8-bit priority
encoder given the input 8'b10010000 would output 3'd4, because bit[4] is
first bit that is high. Build a 4-bit priority encoder. For this problem,
if none of the input bits are high (i.e., input is zero), output zero.
Note that a 4-bit number has 16 possible combinations.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 4 |  |
| `pos` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
