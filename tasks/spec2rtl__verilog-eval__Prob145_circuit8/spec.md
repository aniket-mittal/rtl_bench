# Implement `TopModule` (verilog-eval: Prob145_circuit8)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  clock
 - input  a
 - output p
 - output q

The module should implement a sequential circuit. Read the simulation
waveforms to determine what the circuit does, then implement it.

  time   clock   a   p   q
  0ns    0       0   x   x
  5ns    0       0   x   x
  10ns   0       0   x   x
  15ns   0       0   x   x
  20ns   0       0   x   x
  25ns   1       0   0   x
  30ns   1       0   0   x
  35ns   1       0   0   x
  40ns   1       0   0   x
  45ns   1       0   0   x
  50ns   1       0   0   x
  55ns   0       0   0   0
  60ns   0       0   0   0
  65ns   0       0   0   0
  70ns   0       1   0   0
  75ns   0       0   0   0
  80ns   0       1   0   0
  85ns   1       0   0   0
  90ns   1       1   1   0
  95ns   1       0   0   0
  100ns  1       1   1   0
  105ns  1       0   0   0
  110ns  1       1   1   0
  115ns  0       0   1   1
  120ns  0       1   1   1
  125ns  0       0   1   1
  130ns  0       1   1   1
  135ns  0       0   1   1
  140ns  0       0   1   1
  145ns  1       0   0   1
  150ns  1       0   0   1
  155ns  1       0   0   1
  160ns  1       0   0   1
  165ns  1       1   1   1
  170ns  1       0   0   1
  175ns  0       1   0   0
  180ns  0       0   0   0
  185ns  0       1   0   0
  190ns  0       0   0   0

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `p` | out | 1 | |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
