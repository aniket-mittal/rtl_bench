# Implement `comparator_4bit` (RTLLM: comparator_4bit)

Create `comparator_4bit.v` containing a Verilog module named `comparator_4bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

Implement a module of a 4-bit comparator with multiple bit-level comparators in combinational logic.

Module name:  
    comparator_4bit               
Input ports:
    A [3:0]: First 4-bit input operand (binary number to compare).
    B [3:0]: Second 4-bit input operand (binary number to compare).
Output ports:
    A_greater: 1-bit output indicating if A is greater than B.
    A_equal: 1-bit output indicating if A is equal to B.
    A_less: 1-bit output indicating if A is less than B.

Implementation:
Comparison Logic: The module compares the two 4-bit binary numbers A and B using combinational logic.
- A subtraction operation is performed: A - B. The result of this subtraction helps determine whether A is greater than, equal to, or less than B.
- Carry Generation: If a borrow occurs during the subtraction, A is less than B (A_less).
- If no borrow occurs and the result of subtraction is non-zero, A is greater than B (A_greater).
- If A and B are equal, the result of subtraction is zero (A_equal).

Output Encoding: The outputs (A_greater, A_equal, A_less) are mutually exclusive, ensuring only one of the three outputs is high (1) at any given time.

Give me the complete code.

---

## Files

Edit: `comparator_4bit.v`. Only these files are graded.

## Interface of `comparator_4bit`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 4 |  |
| `B` | in | 4 |  |
| `A_greater` | out | 1 | |
| `A_equal` | out | 1 | |
| `A_less` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v comparator_4bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
