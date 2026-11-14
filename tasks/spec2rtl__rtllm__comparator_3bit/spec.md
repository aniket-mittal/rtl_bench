# Implement `comparator_3bit` (RTLLM: comparator_3bit)

Create `comparator_3bit.v` containing a Verilog module named `comparator_3bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

Implement a module of a 3-bit comparator for comparing binary numbers.

Module name:  
    comparator_3bit               
Input ports:
    A [2:0]: First 3-bit input operand (the first binary number to compare).
    B [2:0]: Second 3-bit input operand (the second binary number to compare).
Output ports:
    A_greater: 1-bit output indicating if A is greater than B.
    A_equal: 1-bit output indicating if A is equal to B.
    A_less: 1-bit output indicating if A is less than B.

Implementation:
Comparison Logic: The module compares the two 3-bit binary numbers A and B using combinational logic.
- The outputs A_greater, A_equal, and A_less are determined based on the comparison of A and B.
- A_greater is set to 1 if A > B, A_equal is set to 1 if A == B, and A_less is set to 1 if A < B.

Output Encoding: The outputs are mutually exclusive, meaning only one of the three outputs will be high (1) at any given time, based on the comparison results.

Give me the complete code.

---

## Files

Edit: `comparator_3bit.v`. Only these files are graded.

## Interface of `comparator_3bit`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 3 |  |
| `B` | in | 3 |  |
| `A_greater` | out | 1 | |
| `A_equal` | out | 1 | |
| `A_less` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v comparator_3bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
