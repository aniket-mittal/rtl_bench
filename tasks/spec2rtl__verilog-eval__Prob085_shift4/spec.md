# Implement `TopModule` (verilog-eval: Prob085_shift4)

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
 - input  areset
 - input  load
 - input  ena
 - input  data (4 bits)
 - output q (4 bits)

The module should implement a 4-bit shift register (right shift), with
asynchronous positive edge triggered areset, synchronous active high
signals load, and enable.

  (1) areset: Resets shift register to zero.

  (2) load: Loads shift register with data[3:0] instead of shifting.

  (3) ena: Shift right (q[3] becomes zero, q[0] is shifted out and
       disappears).

  (4) q: The contents of the shift register. If both the load and ena
       inputs are asserted (1), the load input has higher priority.

Assume all sequential logic is triggered on the positive edge of the
clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `areset` | in | 1 | reset, active high |
| `load` | in | 1 |  |
| `ena` | in | 1 |  |
| `data` | in | 4 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
