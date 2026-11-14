# Implement `TopModule` (verilog-eval: Prob076_always_case)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  sel   (3 bits)
 - input  data0 (4 bits)
 - input  data1 (4 bits)
 - input  data2 (4 bits)
 - input  data3 (4 bits)
 - input  data4 (4 bits)
 - input  data5 (4 bits)
 - output out   (4 bits)
);

The module should implement a 6-to-1 multiplexer. When sel is between 0
and 5, choose the corresponding data input. Otherwise, output 0. The data
inputs and outputs are all 4 bits wide.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `sel` | in | 3 |  |
| `data0` | in | 4 |  |
| `data1` | in | 4 |  |
| `data2` | in | 4 |  |
| `data3` | in | 4 |  |
| `data4` | in | 4 |  |
| `data5` | in | 4 |  |
| `out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
