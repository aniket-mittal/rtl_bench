# Implement `TopModule` (verilog-eval: Prob056_ece241_2013_q7)

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
 - input  j
 - input  k
 - output Q

The module should implement a JK flip-flop with the following truth
table. Note: Qold is the output of the flip-flop before the positive
clock edge.

  J | K | Q
  0 | 0 | Qold
  0 | 1 | 0
  1 | 0 | 1
  1 | 1 | ~Qold

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `j` | in | 1 |  |
| `k` | in | 1 |  |
| `Q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
