# Implement `TopModule` (verilog-eval: Prob150_review2015_fsmonehot)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  d
 - input  done_counting
 - input  ack
 - input  state (10 bits)
 - output B3_next
 - output S_next
 - output S1_next
 - output Count_next
 - output Wait_next
 - output done
 - output counting
 - output shift_ena

The module should implement the following Moore state machine with 3
input (d, done_counting, ack) and 3 outputs (shift_ena, counting, done).
Unless otherwise stated in the diagram below, assume outputs are 0 and
inputs are don't cares.

state   (output)      --input--> next state
-------------------------------------------
  S     ()            --d=0--> S
  S     ()            --d=1--> S1
  S1    ()            --d=0--> S
  S1    ()            --d=1--> S11
  S11   ()            --d=0--> S110
  S11   ()            --d=1--> S11
  S110  ()            --d=0--> S
  S110  ()            --d=1--> B0
  B0    (shift_ena=1) --(always go to next cycle)--> B1
  B1    (shift_ena=1) --(always go to next cycle)--> B2
  B2    (shift_ena=1) --(always go to next cycle)--> B3
  B3    (shift_ena=1) --(always go to next cycle)--> Count
  Count (counting=1)  --done_counting=0--> Count
  Count (counting=1)  --done_counting=1--> Wait
  Wait  (done=1)      --ack=0--> Wait
  Wait  (done=1)      --ack=1--> S

At reset, the state machine starts in state "S". Derive next-state logic
equations and output logic equations by inspection assuming the following
one-hot encoding is used: (S, S1, S11, S110, B0, B1, B2, B3, Count, Wait)
= (10'b0000000001, 10'b0000000010, 10'b0000000100, ... , 10'b1000000000)

Derive state transition and output logic equations by inspection assuming
a one-hot encoding. Implement only the state transition logic and output
logic (the combinational logic portion) for this state machine.

Write code that generates the following signals:

 - B3_next -- Assert when next-state is B3 state
 - S_next -- Assert when next-state is S state
 - S1_next -- Assert when next-state is S1 state
 - Count_next -- Assert when next-state is Count state
 - Wait_next -- Assert when next-state is Wait state
 - done -- output logic
 - counting -- output logic
 - shift_ena -- output logic

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `d` | in | 1 |  |
| `done_counting` | in | 1 |  |
| `ack` | in | 1 |  |
| `state` | in | 10 |  |
| `B3_next` | out | 1 | |
| `S_next` | out | 1 | |
| `S1_next` | out | 1 | |
| `Count_next` | out | 1 | |
| `Wait_next` | out | 1 | |
| `done` | out | 1 | |
| `counting` | out | 1 | |
| `shift_ena` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
