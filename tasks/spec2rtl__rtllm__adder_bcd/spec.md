# Implement `adder_bcd` (RTLLM: adder_bcd)

Create `adder_bcd.v` containing a Verilog module named `adder_bcd` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module of a 4-bit BCD adder for decimal arithmetic operations. 

Module name:  
    adder_bcd               
Input ports:
    A [3:0]: First BCD input (4-bit, representing a decimal digit from 0 to 9).
    B [3:0]: Second BCD input (4-bit, representing a decimal digit from 0 to 9).
    Cin: Carry-in input (1-bit).
Output ports:
    Sum [3:0]: 4-bit output representing the sum of the two BCD inputs, corrected to be a valid BCD digit (0–9).
    Cout: Carry-out output (1-bit), used when the sum exceeds the decimal value of 9.

Implementation:
Addition: The module performs binary addition of A, B, and Cin.
BCD Correction: If the sum exceeds 9 (binary 1001), a correction of 6 (binary 0110) is added to the sum. This correction ensures that the result is within the BCD range.
Carry Generation: If the result of the addition exceeds 9, a carry-out (Cout) is generated, signaling that the BCD sum exceeds a single decimal digit.

Give me the complete code.

---

## Files

Edit: `adder_bcd.v`. Only these files are graded.

## Interface of `adder_bcd`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 4 |  |
| `B` | in | 4 |  |
| `Cin` | in | 1 |  |
| `Sum` | out | 4 | |
| `Cout` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v adder_bcd.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
