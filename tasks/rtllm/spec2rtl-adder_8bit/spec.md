# Implement `adder_8bit` (RTLLM: adder_8bit)

Create `adder_8bit.v` containing a Verilog module named `adder_8bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module of an 8-bit adder with multiple bit-level adders in combinational logic. 

Module name:  
    adder_8bit               
Input ports:
    a[7:0]: 8-bit input operand A.
    b[7:0]: 8-bit input operand B.
    cin: Carry-in input.
Output ports:
    sum[7:0]: 8-bit output representing the sum of A and B.
    cout: Carry-out output.

Implementation:
The module utilizes a series of bit-level adders (full adders) to perform the addition operation.

Give me the complete code.

---

## Files

Edit: `adder_8bit.v`. Only these files are graded.

## Interface of `adder_8bit`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `cin` | in | 1 |  |
| `sum` | out | 8 | |
| `cout` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v adder_8bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
