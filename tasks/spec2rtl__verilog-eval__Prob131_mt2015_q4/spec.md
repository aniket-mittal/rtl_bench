# Implement `TopModule` (verilog-eval: Prob131_mt2015_q4)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

Module A implements the boolean function z = (x^y) & x.

Module B can be described by the following simulation waveform:

  time  x  y  z
  0ns   0  0  1
  5ns   0  0  1
  10ns  0  0  1
  15ns  0  0  1
  20ns  0  0  1
  25ns  1  0  0
  30ns  1  0  0
  35ns  0  1  0
  40ns  0  1  0
  45ns  1  1  1
  50ns  1  1  1
  55ns  0  0  1
  60ns  0  1  0
  65ns  0  1  0
  70ns  1  1  1
  75ns  0  1  0
  80ns  0  1  0
  85ns  0  1  0
  90ns  1  0  0

Now consider a top-level module with the following interface:

 - input  x
 - input  y
 - output z

The module is implemented with two A submodules and two B submodules. The
first input of all four submodules is connect to input 'x', and the
second input of all four submodules is connected to 'y'. The output of
the first A submodule is connected to a two-input OR, along with the
output of the first B submodule. The second pair of A and B submodules is
similarly connected to an AND gate. The output of the OR and the AND is
connected to an XOR, whose output is 'z'.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `x` | in | 1 |  |
| `y` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
