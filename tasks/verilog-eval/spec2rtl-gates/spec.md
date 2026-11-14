# Implement `TopModule` (verilog-eval: Prob087_gates)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  a
 - input  b
 - output out_and
 - output out_or
 - output out_xor
 - output out_nand
 - output out_nor
 - output out_xnor
 - output out_anotb

The module should implement a combinational circuit with two inputs, a
and b. There are 7 outputs, each with a logic gate driving it:

  (1) out_and: a and b
  (2) out_or: a or b
  (3) out_xor: a xor b
  (4) out_nand: a nand b
  (5) out_nor: a nor b
  (6) out_xnor: a xnor b
  (7) out_anotb: a and-not b

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `out_and` | out | 1 | |
| `out_or` | out | 1 | |
| `out_xor` | out | 1 | |
| `out_nand` | out | 1 | |
| `out_nor` | out | 1 | |
| `out_xnor` | out | 1 | |
| `out_anotb` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
