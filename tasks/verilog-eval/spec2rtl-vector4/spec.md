# Implement `TopModule` (verilog-eval: Prob042_vector4)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  in  (8  bits)
 - output out (32 bits)

One common place to see a replication operator is when sign-extending a
smaller number to a larger one, while preserving its signed value. This
is done by replicating the sign bit (the most significant bit) of the
smaller number to the left. For example, sign-extending 4'b0101 (5) to 8
bits results in 8'b00000101 (5), while sign-extending 4'b1101 (-3) to 8
bits results in 8'b11111101 (-3). Implement a module that sign-extends an
8-bit number to 32 bits. This requires a concatenation of 24 copies of
the sign bit (i.e., replicate bit[7] 24 times) followed by the 8-bit
number itself.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 8 |  |
| `out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
