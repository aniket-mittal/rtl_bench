# Implement `TopModule` (verilog-eval: Prob141_count_clock)

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
 - input  ena
 - output pm
 - output hh (8 bits)
 - output mm (8 bits)
 - output ss (8 bits)

Create a set of counters suitable for use as a 12-hour clock (with am/pm
indicator). Your counters are clocked by a fast-running clk, with a pulse
on ena whenever your clock should increment (i.e., once per second, while
"clk" is much faster than once per second). The signal "pm" is asserted
if the clock is PM, or is otherwise AM. hh, mm, and ss are two BCD
(Binary- Coded Decimal) digits each for hours (01-12), minutes (00-59),
and seconds (00-59). Reset is the active high synchronous signal that
resets the clock to "12:00 AM." Reset has higher priority than enable and
can occur even when not enabled. Assume all sequential logic is triggered
on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `ena` | in | 1 |  |
| `pm` | out | 1 | |
| `hh` | out | 8 | |
| `mm` | out | 8 | |
| `ss` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
