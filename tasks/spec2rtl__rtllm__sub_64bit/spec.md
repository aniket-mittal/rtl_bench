# Implement `sub_64bit` (RTLLM: sub_64bit)

Create `sub_64bit.v` containing a Verilog module named `sub_64bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

Implement a module of a 64-bit subtractor with overflow checking for high-precision arithmetic operations. 

Module name:  
    sub_64bit               
Input ports:
    A [63:0]: First 64-bit input operand (representing a large signed integer).
    B [63:0]: Second 64-bit input operand (representing a large signed integer to be subtracted from A).
Output ports:
    result [63:0]: 64-bit output representing the difference of the two operands (A - B).
    overflow: 1-bit output indicating whether an overflow occurred during the subtraction operation.

Implementation:
Subtraction: The module performs binary subtraction of A and B to obtain the result.
Overflow Detection: The module checks for overflow conditions by examining the sign bits of A, B, and the result. 
- Positive overflow occurs when a positive number (A) is subtracted by a negative number (B) and the result is negative.
- Negative overflow occurs when a negative number (A) is subtracted by a positive number (B) and the result is positive.

The overflow flag is set to 1 if an overflow condition is detected; otherwise, it is set to 0.

Give me the complete code.

---

## Files

Edit: `sub_64bit.v`. Only these files are graded.

## Interface of `sub_64bit`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 64 |  |
| `B` | in | 64 |  |
| `result` | out | 64 | |
| `overflow` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v sub_64bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
