# Implement `TopModule` (verilog-eval: Prob140_fsm_hdlc)

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
 - input  in
 - output disc
 - output flag
 - output err

Synchronous HDLC framing involves decoding a continuous bit stream of
data to look for bit patterns that indicate the beginning and end of
frames (packets). Seeing exactly 6 consecutive 1s (i.e., 01111110) is a
"flag" that indicate frame boundaries. To avoid the data stream from
accidentally containing "flags", the sender inserts a zero after every 5
consecutive 1s which the receiver must detect and discard. We also need
to signal an error if there are 7 or more consecutive 1s. Create a
Moore-type finite state machine to recognize these three sequences:

  (1) 0111110: Signal a bit needs to be discarded (disc).
  (2) 01111110: Flag the beginning/end of a frame (flag).
  (3) 01111111...: Error (7 or more 1s) (err).

When the FSM is reset, it should be in a state that behaves as though the
previous input were 0. The reset signal is active high synchronous. The
output signals should be asserted for a complete cycle beginning on the
clock cycle after the condition occurs. Assume all sequential
logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `in` | in | 1 |  |
| `disc` | out | 1 | |
| `flag` | out | 1 | |
| `err` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
