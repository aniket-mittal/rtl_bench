# Implement `pe` (RTLLM: pe)

Create `pe.v` containing a Verilog module named `pe` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a Multiplying Accumulator for 32bit integer. In the MAC_PE, there is a register that stores the partial sum (the intermediate accumulation result), and in each cycle, the result of “a multiplied by b” will be accumulated in this register, and the “c” shows the value of the register.

Module name:  
    pe   

Input ports:
    clk: Clock signal used for synchronous operations.
    rst: Reset signal. Defined as 1 for reset and 0 for reset signal inactive.
    a: 32-bit input operand A.
    b: 32-bit input operand B.

Output ports:
    c: 32-bit output representing the accumulated result.

Implementation:
The module implements a parallel multiplier and accumulator using registers and an always block. It multiplies the input operands and accumulates the result into an output register.
Accumulator Register:
The module includes a register, c, to store the accumulated result.
On the positive edge of the clock signal (clk) or the positive edge of the reset signal (rst), the module updates the register.
If the reset signal (rst) is high, indicating a reset condition, the register (c) is set to 0. If the reset signal (rst) is low, the register (c) is updated by adding the product of the input operands (a and b) to its current value.
Multiplication and Accumulation:
Inside the always block, the module performs the multiplication and accumulation operation. If the reset signal (rst) is high, the register (c) is set to 0. If the reset signal (rst) is low, the module adds the product of the input operands (a and b) to the register (c).

Give me the complete code.

---

## Files

Edit: `pe.v`. Only these files are graded.

## Interface of `pe`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `a` | in | 32 |  |
| `b` | in | 32 |  |
| `c` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v pe.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
