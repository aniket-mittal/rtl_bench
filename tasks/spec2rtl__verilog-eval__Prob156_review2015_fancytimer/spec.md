# Implement `TopModule` (verilog-eval: Prob156_review2015_fancytimer)

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
 - output count (4 bits)
 - output counting
 - output done
 - input  ack

The module should implement a timer with one input that:

  (1) is started when a particular input pattern (1101) is detected,
  (2) shifts in 4 more bits to determine the duration to delay,
  (3) waits for the counters to finish counting, and
  (4) notifies the user and waits for the user to acknowledge the timer.

The serial data is available on the data input pin. When the pattern 1101
is received, the circuit must then shift in the next 4 bits,
most-significant-bit first. These 4 bits determine the duration of the
timer delay, referred to as delay[3:0]. After that, the state machine
asserts its counting output to indicate it is counting. Once the 1101 and
delay[3:0] have been read, the circuit no longer looks at the data input
until it resumes searching after everything else is done.

The state machine must count for exactly (delay[3:0] + 1) * 1000 clock
cycles. e.g., delay=0 means count 1000 cycles, and delay=5 means count
6000 cycles. Also output the current remaining time. This should be equal
to delay for 1000 cycles, then delay-1 for 1000 cycles, and so on until
it is 0 for 1000 cycles.

When the circuit isn't counting, the count[3:0] output is don't-care
(whatever value is convenient for you to implement). At that point, the
circuit must assert done to notify the user the timer has timed out, and
waits until input ack is 1 before being reset to look for the next
occurrence of the start sequence (1101).

The circuit should reset into a state where it begins searching for the
input sequence 1101. The reset signal is active high synchronous. Assume
all sequential logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `data` | in | 1 |  |
| `ack` | in | 1 |  |
| `count` | out | 4 | |
| `counting` | out | 1 | |
| `done` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
