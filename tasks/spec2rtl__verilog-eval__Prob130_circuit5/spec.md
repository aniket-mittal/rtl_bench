# Implement `TopModule` (verilog-eval: Prob130_circuit5)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  a (4 bits)
 - input  b (4 bits)
 - input  c (4 bits)
 - input  d (4 bits)
 - input  e (4 bits)
 - output q (4 bits)

The module should implement a combinational circuit. Read the simulation
waveforms to determine what the circuit does, then implement it.

  time  a  b  c  d  e  q
  0ns   x  x  x  x  x  x
  5ns   x  x  x  x  x  x
  10ns  x  x  x  x  x  x
  15ns  a  b  0  d  e  b
  20ns  a  b  1  d  e  e
  25ns  a  b  2  d  e  a
  30ns  a  b  3  d  e  d
  35ns  a  b  4  d  e  f
  40ns  a  b  5  d  e  f
  45ns  a  b  6  d  e  f
  50ns  a  b  7  d  e  f
  55ns  a  b  8  d  e  f
  60ns  a  b  9  d  e  f
  65ns  a  b  a  d  e  f
  70ns  a  b  b  d  e  f
  75ns  a  b  c  d  e  f
  80ns  a  b  d  d  e  f
  85ns  a  b  e  d  e  f
  90ns  a  b  f  d  e  f

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 4 |  |
| `b` | in | 4 |  |
| `c` | in | 4 |  |
| `d` | in | 4 |  |
| `e` | in | 4 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
