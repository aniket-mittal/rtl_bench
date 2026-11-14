# Implement `fixed_point_adder` (RTLLM: fixed_point_adder)

Create `fixed_point_adder.v` containing a Verilog module named `fixed_point_adder` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

Implement a module of a parameterized fixed-point adder for arithmetic operations with fixed precision.

Module name:  
    fixed_point_adder               
Input parameters:
    Q: Number of fractional bits (precision).
    N: Total number of bits, including integer and fractional parts.
Input ports:
    a [N-1:0]: First N-bit fixed-point input operand.
    b [N-1:0]: Second N-bit fixed-point input operand.
Output ports:
    c [N-1:0]: N-bit output representing the result of the fixed-point addition.

Internal Registers:
    res [N-1:0]: N-bit register used to store the result of the addition or subtraction.

Implementation:
1. Absolute Value Addition:
    - If the most significant bits (MSBs) of `a` and `b` are the same (both positive or both negative), their absolute values are added.
    - The MSB of the result is set to match the MSBs of `a` and `b` (sign bit remains consistent).

2. Absolute Value Subtraction:
    - If the MSBs of `a` and `b` are different (one is positive, the other negative), the larger absolute value is determined.
    - If `a` is greater than `b`, the result is `a - b` and the MSB of the result is set to 0 (positive).
    - If `b` is greater than `a`, the result is `b - a`. The MSB of the result is set according to whether the result is zero or negative.

3. Precision:
    - The operands `a` and `b` consist of integer and fractional parts, with the fractional part determined by parameter `Q`.
    - The precision is consistent across both inputs and the output to ensure accurate fixed-point arithmetic.

4. Overflow Handling:
    - Overflow is managed internally by observing the MSB to ensure the result fits within the N-bit range.

Give me the complete code.

---

## Files

Edit: `fixed_point_adder.v`. Only these files are graded.

## Interface of `fixed_point_adder`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 32 |  |
| `b` | in | 32 |  |
| `c` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v fixed_point_adder.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
