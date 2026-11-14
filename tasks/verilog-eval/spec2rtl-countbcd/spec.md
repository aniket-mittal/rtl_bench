# Implement `TopModule` (verilog-eval: Prob068_countbcd)

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
 - output ena (3 bits)
 - output q   (16 bits)

The module should implement a 4-digit BCD (binary-coded decimal) counter.
Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit,
q[7:4] is the tens digit, etc. For digits [3:1], also output an enable
signal indicating when each of the upper three digits should be
incremented. Include a synchronous active-high reset. Assume all
sequential logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `ena` | out | 3 | |
| `q` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
