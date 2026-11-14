# Implement `TopModule` (verilog-eval: Prob077_wire_decl)

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
 - input  c
 - input  d
 - output out
 - output out_n

The module should implement the following circuit. Create two
intermediate wires (named anything you want) to connect the AND and OR
gates together. Note that the wire that feeds the NOT gate is really wire
`out`, so you do not necessarily need to declare a third wire here.
Notice how wires are driven by exactly one source (output of a gate), but
can feed multiple inputs.

The circuit is composed of two layers. The first layer, counting from the
input, is two AND gates: one whose input is connected to a and b, and the
second is connected to c and d. The second layer there is an OR gate to
OR the two AND outputs, connected the output 'out'. Additionally, there
is an inverted output 'out_n'.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `out` | out | 1 | |
| `out_n` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
