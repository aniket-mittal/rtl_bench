# Implement `TopModule` (verilog-eval: Prob124_rule110)

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
 - input  load
 - input  data (512 bits)
 - output q    (512 bits)

The module should implement Rule 110, a one-dimensional cellular
automaton with interesting properties (such as being Turing-complete).
There is a one-dimensional array of cells (on or off). At each time step,
the state of each cell changes. In Rule 110, the next state of each cell
depends only on itself and its two neighbours, according to the following
table:

  Left[i+1] | Center[i] | Right[i-1] | Center's next state 
  1         | 1         | 1          | 0
  1         | 1         | 0          | 1
  1         | 0         | 1          | 1
  1         | 0         | 0          | 0
  0         | 1         | 1          | 1
  0         | 1         | 0          | 1
  0         | 0         | 1          | 1
  0         | 0         | 0          | 0

In this circuit, create a 512-cell system (q[511:0]), and advance by one
time step each clock cycle. The synchronous active high load input
indicates the state of the system should be loaded with data[511:0].
Assume the boundaries (q[-1] and q[512], if they existed) are both zero
(off). Assume all sequential logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `data` | in | 512 |  |
| `q` | out | 512 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
