# Implement `adder_32bit` (RTLLM: adder_32bit)

Create `adder_32bit.v` containing a Verilog module named `adder_32bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module of a carry-lookahead 32-bit adder that uses the Carry-Lookahead Adder (CLA) architecture.

Module name:  
    adder_32bit               
Input ports:
    A[32:1]: 32-bit input operand A.
    B[32:1]: 32-bit input operand B.
Output ports:
    S[32:1]: 32-bit output representing the sum of A and B.
    C32: Carry-out output.

Implementation:
The top module adder_32bit consists of several instances of the 16 bit CLA block you design.

Give me the complete code.

---

## Files

Edit: `adder_32bit.v`. Only these files are graded.

## Interface of `adder_32bit`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 32 |  |
| `B` | in | 32 |  |
| `S` | out | 32 | |
| `C32` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v adder_32bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
