# Implement `TopModule` (verilog-eval: Prob045_edgedetect2)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input clk
 - input in       (8 bits)
 - output anyedge (8 bits)

Implement a module that for each bit in an 8-bit input vector, detect
when the input signal changes from one clock cycle to the next (detect
any edge). The output bit of anyedge should be set to 1 the cycle 
after the input bit has 0 to 1 or 1 to 0 transition occurs. Assume all 
sequential logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `in` | in | 8 |  |
| `anyedge` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
