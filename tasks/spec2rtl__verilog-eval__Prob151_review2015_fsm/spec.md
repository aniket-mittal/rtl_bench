# Implement `TopModule` (verilog-eval: Prob151_review2015_fsm)

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
 - input  reset
 - input  data
 - input  done_counting
 - input  ack
 - output shift_ena
 - output counting
 - output done

The module should implement a timer that:

  (1) is started when a particular pattern (1101) is detected,
  (2) shifts in 4 more bits to determine the duration to delay,
  (3) waits for the counters to finish counting, and
  (4) notifies the user and waits for the user to acknowledge the timer.

In this problem, implement just the finite-state machine that controls
the timer. The data path (counters and some comparators) are not included
here.

The serial data is available on the data input pin. When the pattern 1101
is received, the state machine must then assert output shift_ena for
exactly 4 clock cycles. After that, the state machine asserts its
counting output to indicate it is waiting for the counters, and waits
until input done_counting is high.At that point, the state machine must
assert done to notify the user the timer has timed out, and waits until
input ack is 1 before being reset to look for the next occurrence of the
start sequence (1101). The state machine should have a active high
synchronous reset, setting the state to where it begins searching for the
input sequence 1101. Assume all sequential logic is triggered on the
positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `data` | in | 1 |  |
| `done_counting` | in | 1 |  |
| `ack` | in | 1 |  |
| `shift_ena` | out | 1 | |
| `counting` | out | 1 | |
| `done` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
