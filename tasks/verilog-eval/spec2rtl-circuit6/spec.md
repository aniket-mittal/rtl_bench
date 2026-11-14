# Implement `TopModule` (verilog-eval: Prob126_circuit6)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  a ( 3 bits)
 - output q (16 bits)

The module should implement a combinational circuit. Read the simulation
waveforms to determine what the circuit does, then implement it.

  time  a     q
  0ns   x     x
  5ns   x     x
  10ns  x     x
  15ns  0  1232
  20ns  1  aee0
  25ns  2  27d4
  30ns  3  5a0e
  35ns  4  2066
  40ns  5  64ce
  45ns  6  c526
  50ns  7  2f19
  55ns  0  1232
  60ns  1  aee0
  65ns  2  27d4
  70ns  4  2066
  75ns  1  aee0
  80ns  1  aee0
  85ns  3  5a0e
  90ns  5  64ce

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 3 |  |
| `q` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
