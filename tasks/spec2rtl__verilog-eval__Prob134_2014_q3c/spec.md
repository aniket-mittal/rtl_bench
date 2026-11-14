# Implement `TopModule` (verilog-eval: Prob134_2014_q3c)

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
 - input  x
 - input  y (3 bits)
 - output Y0
 - output z

The module should implement the output logic and next state logic for an
FSM using the table shown below. Note that the output Y0 is Y[0] of the
next state signal.

   Present state input y[2:0] | Next state Y[2:0] when x=0, Next state Y[2:0] when x=1 | Output z
   000 | 000, 001 | 0
   001 | 001, 100 | 0
   010 | 010, 001 | 0
   011 | 001, 010 | 1
   100 | 011, 100 | 1

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `x` | in | 1 |  |
| `y` | in | 3 |  |
| `Y0` | out | 1 | |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
