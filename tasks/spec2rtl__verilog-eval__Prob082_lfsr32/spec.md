# Implement `TopModule` (verilog-eval: Prob082_lfsr32)

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
 - input  reset
 - output q (32 bits)

A linear feedback shift register is a shift register usually with a few
XOR gates to produce the next state of the shift register. A Galois LFSR
is one particular arrangement that shifts right, where a bit position with
a "tap" is XORed with the LSB output bit (q[0]) to produce its next value,
while bit positions without a tap shift right unchanged. 

The module should implement a 32-bit Galois LFSR with taps at bit
positions 32, 22, 2, and 1. Reset should be active high synchronous, and
should reset the output q to 32'h1. Assume all sequential logic is
triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `q` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
