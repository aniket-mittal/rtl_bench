# Implement `TopModule` (verilog-eval: Prob080_timer)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  clk,
 - input  load,
 - input  data (10 bits)
 - output tc

The module should implement a timer that counts down for a given number
of clock cycles, then asserts a signal to indicate that the given
duration has elapsed. A good way to implement this is with a down-counter
that asserts an output signal when the count becomes 0. At each clock
cycle:

  (1) If load = 1, load the internal counter with the 10-bit data, the
  number of clock cycles the timer should count before timing out. The
  counter can be loaded at any time, including when it is still counting
  and has not yet reached 0.

  (2) If load = 0, the internal counter should decrement by 1. The output
  signal tc ("terminal count") indicates whether the internal counter has
  reached 0. Once the internal counter has reached 0, it should stay 0
  (stop counting) until the counter is loaded again.

The module should implement a single D flip-flop. Assume all sequential
logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `data` | in | 10 |  |
| `tc` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
