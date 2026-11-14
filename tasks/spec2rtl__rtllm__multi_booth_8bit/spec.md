# Implement `multi_booth_8bit` (RTLLM: multi_booth_8bit)

Create `multi_booth_8bit.v` containing a Verilog module named `multi_booth_8bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement an 8-bit Radix-4 booth multiplier that performs the multiplication of two 8-bit inputs (a and b) using the Booth algorithm. It utilizes a clock signal (clk), and a reset signal (reset), and provides the product output (p) and a ready signal (rdy). The ready signal (rdy) is set to 1 to indicate the completion of the multiplication process.

Module name:  
   multi_booth_8bit  

Input ports:
   clk: Clock signal used for synchronous operation.
   reset: Reset signal used to initialize the multiplier module.
   a: 8-bit input representing the multiplicand.
   b: 8-bit input representing the multiplier.

Output ports:
   p: 16-bit output representing the product of the multiplication.
   rdy: Ready signal indicating the completion of the multiplication operation.

Implementation:
On the positive edge of the clock signal (clk) or the positive edge of the reset signal (reset), the module performs the multiplication process.
If the reset signal (reset) is high, two 16-bit registers multiplier <= {{8{a[7]}}, a} and multiplicand <= {{8{b[7]}}, b}. 
If the reset signal (reset) is low, indicating normal operation, the module checks if the counter (5bit ctr) is less than 16.
If the counter (ctr) is less than 16, the multiplicand register (multiplicand) is left-shifted by 1 to simulate the Booth algorithm's shifting operation.
If the current bit of the multiplier register (multiplier[ctr]) is 1, indicating a positive Booth encoding, the product register (p) accumulates the value of the multiplicand register (multiplicand).
The counter (ctr) is incremented by 1. Once the counter (ctr) reaches 16, indicating the completion of the multiplication process, the ready signal (rdy) is set to 1.

Give me the complete code.

---

## Files

Edit: `multi_booth_8bit.v`. Only these files are graded.

## Interface of `multi_booth_8bit`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `p` | out | 16 | |
| `rdy` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v multi_booth_8bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
