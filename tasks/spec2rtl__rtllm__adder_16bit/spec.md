# Implement `adder_16bit` (RTLLM: adder_16bit)

Create `adder_16bit.v` containing a Verilog module named `adder_16bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module of a 8-bit full adder in combinational logic.

Module name:  
    adder_16bit               
Input ports:
    a[15:0]: 16-bit input operand A.
    b[15:0]: 16-bit input operand B.
    Cin: Carry-in input.
Output ports:
    y[15:0]: 16-bit output representing the sum of A and B.
    Co: Carry-out output.

Implementation:
In the adder_16bit module, you need to design a small bit-width adder(8-bit adder), which will be instantiated multiple times.

Give me the complete code.

---

## Files

Edit: `adder_16bit.v`. Only these files are graded.

## Interface of `adder_16bit`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 16 |  |
| `b` | in | 16 |  |
| `Cin` | in | 1 |  |
| `y` | out | 16 | |
| `Co` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v adder_16bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
