# Implement `TopModule` (verilog-eval: Prob101_circuit4)

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
 - output q

The module should implement a combinational circuit. Read the simulation
waveforms to determine what the circuit does, then implement it.

  time  a  b  c  d  q
  0ns   0  0  0  0  0
  5ns   0  0  0  0  0
  10ns  0  0  0  0  0
  15ns  0  0  0  0  0
  20ns  0  0  0  1  0
  25ns  0  0  1  0  1
  30ns  0  0  1  1  1
  35ns  0  1  0  0  1
  40ns  0  1  0  1  1
  45ns  0  1  1  0  1
  50ns  0  1  1  1  1
  55ns  1  0  0  0  0
  60ns  1  0  0  1  0
  65ns  1  0  1  0  1
  70ns  1  0  1  1  1
  75ns  1  1  0  0  1
  80ns  1  1  0  1  1
  85ns  1  1  1  0  1
  90ns  1  1  1  1  1

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
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
