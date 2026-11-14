# Implement `TopModule` (verilog-eval: Prob021_mux256to1v)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  in  (1024 bits)
 - input  sel (   8 bits)
 - output out (   4 bits)

The module should implement a 4-bit wide, 256-to-1 multiplexer. The 256
4-bit inputs are all packed into a single 1024-bit input vector. sel=0
should select bits in[3:0], sel=1 selects bits in[7:4], sel=2 selects
bits in[11:8], etc.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1024 |  |
| `sel` | in | 8 |  |
| `out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
