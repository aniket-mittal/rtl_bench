# Implement `TopModule` (verilog-eval: Prob071_always_casez)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  in  (8 bits)
 - output pos (3 bits)

The module should implement a priority encoder for an 8-bit input. Given
an 8-bit vector, the output should report the first (least significant)
bit in the vector that is 1. Report zero if the input vector has no bits
that are high. For example, the input 8'b10010000 should output 3'd4,
because bit[4] is first bit that is high.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 8 |  |
| `pos` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
