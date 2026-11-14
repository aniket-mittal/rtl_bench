# Implement `div_16bit` (RTLLM: div_16bit)

Create `div_16bit.v` containing a Verilog module named `div_16bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a 16-bit divider module, the dividend is 16-bit and the divider is 8-bit in combinational logic. Extract the higher bits of the dividend, matching the bit width of the divisor. Compare these bits with the divisor: if the dividend bits are greater, set the quotient to 1, otherwise set it to 0, and use the difference as the remainder. Concatenate the remainder with the highest remaining 1-bit of the dividend, and repeat the process until all dividend bits are processed.

Module name:
    div_16bit

Input ports:
    A: 16-bit dividend.
    B: 8-bit divisor.

Output ports:
    result: 16-bit quotient.
    odd: 16-bit remainder.

Implementation:
The module uses two always blocks to perform the division operation.
The first always block is a combinational block triggered by any change in the input values A and B. It updates the values of two registers, a_reg and b_reg, with the values of A and B, respectively.
The second always block is also a combinational block triggered by any change in the input values A and B.

Give me the complete code.

---

## Files

Edit: `div_16bit.v`. Only these files are graded.

## Interface of `div_16bit`

| port | dir | width | note |
|---|---|---|---|
| `A` | in | 16 |  |
| `B` | in | 8 |  |
| `result` | out | 16 | |
| `odd` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v div_16bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
