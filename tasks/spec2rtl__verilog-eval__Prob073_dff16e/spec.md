# Implement `TopModule` (verilog-eval: Prob073_dff16e)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  clk
 - input  resetn
 - input  byteena ( 2 bits)
 - input  d       (16 bits)
 - output q       (16 bits)

The module should include 16 D flip-flops. It's sometimes useful to only
modify parts of a group of flip-flops. The byte-enable inputs control
whether each byte of the 16 registers should be written to on that cycle.
byteena[1] controls the upper byte d[15:8], while byteena[0] controls the
lower byte d[7:0]. resetn is a synchronous, active-low reset. All DFFs
should be triggered by the positive edge of clk.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `resetn` | in | 1 | reset, active low |
| `byteena` | in | 2 |  |
| `d` | in | 16 |  |
| `q` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
