# Implement `TopModule` (verilog-eval: Prob098_circuit7)

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
 - input  a
 - output q

This is a sequential circuit. Read the simulation waveforms to determine
what the circuit does, then implement it.

  time  clk a   q
  0ns   0   x   x
  5ns   1   0   x
  10ns  0   0   x
  15ns  1   0   1
  20ns  0   0   1
  25ns  1   0   1
  30ns  0   0   1
  35ns  1   1   1
  40ns  0   1   1
  45ns  1   1   0
  50ns  0   1   0
  55ns  1   1   0
  60ns  0   1   0
  65ns  1   1   0
  70ns  0   1   0
  75ns  1   1   0
  80ns  0   1   0
  85ns  1   1   0
  90ns  0   1   0

Assume all sequential logic is triggered on the positive edge of the
clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
