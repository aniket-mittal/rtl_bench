# Implement `TopModule` (verilog-eval: Prob114_bugs_case)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  code (8 bits)
 - output out  (4 bits)
 - output valid

The module should recognize 8-bit keyboard scancodes for keys 0 through
9. It should indicate whether one of the 10 cases were recognized
(valid), and if so, which key was detected. If the 8-bit input is 8'h45,
8'h16, 8'h1e, 8'h26, 8'h25, 8'h2e, 8'h36, 8'h3d, 8'h3e, or 8'h46, the
4-bit output will be set to 0, 1, 2, 3, 4, 5, 6, 7, 8, or 9 respectively,
the 1-bit valid would be set to 1. If the input does not match any of the
cases, both output signals would be set to 0.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `code` | in | 8 |  |
| `out` | out | 4 | |
| `valid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
