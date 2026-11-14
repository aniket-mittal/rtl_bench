# Implement `fixed_point_subtractor` (RTLLM: fixed_point_substractor)

Create `fixed_point_subtractor.v` containing a Verilog module named `fixed_point_subtractor` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

Implement a module of a fixed-point subtractor for precise arithmetic operations with fixed precision.

Module name:
    fixed_point_subtractor

Parameterized values:
    Q: Represents the number of fractional bits in the fixed-point representation.
    N: Represents the total number of bits (both integer and fractional) used for inputs and outputs.

Input ports:
    a [N-1:0]: First N-bit fixed-point input operand.
    b [N-1:0]: Second N-bit fixed-point input operand.

Output ports:

    c [N-1:0]: N-bit output representing the result of the fixed-point subtraction.
Internal registers:
    res [N-1:0]: N-bit register used to store the result of the subtraction operation.

Implementation:
    Same Sign Subtraction: When the signs of a and b are the same, their fractional and integer parts are subtracted. The sign of the result will be the same as the inputs.

Different Sign Subtraction:
    If a is positive and b is negative, the absolute values of a and b are added. The result will have a positive sign if a is greater than b, and a negative sign otherwise.
    If a is negative and b is positive, the same logic applies, with the result's sign depending on the relative sizes of a and b.

Handling Zero: 
    When the result is zero, the sign bit is explicitly set to 0 to handle this edge case.

Precision: 
    The fixed-point precision is defined by the parameters Q (fractional bits) and N (total bits). This ensures that the subtraction is performed accurately while maintaining the necessary precision for both integer and fractional parts.

Give me the complete code.

---

## Files

Edit: `fixed_point_subtractor.v`. Only these files are graded.

## Interface of `fixed_point_subtractor`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 32 |  |
| `b` | in | 32 |  |
| `c` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v fixed_point_subtractor.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
