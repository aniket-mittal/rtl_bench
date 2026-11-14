# Implement `TopModule` (verilog-eval: Prob032_vector0)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  vec  (3 bits)
 - output outv (3 bits)
 - output o2
 - output o1
 - output o0

The module has one 3-bit input, then outputs the same vector, and also
splits it into three separate 1-bit outputs. Connect output o0 to the
input vector's position 0, o1 to position 1, etc.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `vec` | in | 3 |  |
| `outv` | out | 3 | |
| `o2` | out | 1 | |
| `o1` | out | 1 | |
| `o0` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
