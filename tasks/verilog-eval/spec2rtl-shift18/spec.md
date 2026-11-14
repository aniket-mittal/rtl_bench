# Implement `TopModule` (verilog-eval: Prob115_shift18)

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
 - input  load
 - input  ena
 - input  amount (2 bits)
 - input  data (64 bits)
 - output q (64 bits)

The module should implement a 64-bit arithmetic shift register, with
synchronous load. The shifter can shift both left and right, and by 1 or
8 bit positions, selected by "amount." Assume the right shit is an
arithmetic right shift.

Signals are defined as below:

  (1) load: Loads shift register with data[63:0] instead of shifting.
       Active high.
  (2) ena: Chooses whether to shift. Active high.
  (3) amount: Chooses which direction and how much to shift.
      (a) 2'b00: shift left by 1 bit.
      (b) 2'b01: shift left by 8 bits.
      (c) 2'b10: shift right by 1 bit.
      (d) 2'b11: shift right by 8 bits.
  (4) q: The contents of the shifter.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `ena` | in | 1 |  |
| `amount` | in | 2 |  |
| `data` | in | 64 |  |
| `q` | out | 64 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
