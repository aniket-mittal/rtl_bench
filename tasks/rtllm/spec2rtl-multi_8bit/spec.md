# Implement `multi_8bit` (RTLLM: multi_8bit)

Create `multi_8bit.v` containing a Verilog module named `multi_8bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

Implement a module of an 8-bit multiplier based on shifting and adding operations.

Module name:  
    multi_8bit               
Input ports:
    A [7:0]: First 8-bit input operand (representing a multiplicand).
    B [7:0]: Second 8-bit input operand (representing a multiplier).
Output ports:
    product [15:0]: 16-bit output representing the product of the two 8-bit inputs (A * B).

Implementation:
Multiplication: The module performs multiplication of A and B using the shift-and-add method.
- The algorithm iterates through each bit of the multiplier (B). For each bit that is set (1), the multiplicand (A) is added to the product at the corresponding shifted position.
- The process continues until all bits of the multiplier have been processed.

Shifting: After each addition, the multiplicand is logically shifted left by one bit to prepare for the next addition, simulating the traditional multiplication process.

The final product is stored in the output port, which is 16 bits wide to accommodate the maximum possible product of two 8-bit numbers.

Give me the complete code.

---

## Files

Edit: `multi_8bit.v`. Only these files are graded.

## Interface of `multi_8bit`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 8 |  |
| `B` | in | 8 |  |
| `product` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v multi_8bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
