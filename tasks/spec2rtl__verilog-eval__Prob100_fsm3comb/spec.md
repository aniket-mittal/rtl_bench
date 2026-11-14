# Implement `TopModule` (verilog-eval: Prob100_fsm3comb)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  in
 - input  state (2 bits)
 - output next_state (2 bits)
 - output out

The module should implement the following is the state transition table
for a Moore state machine with one input, one output, and four states.
Use the following state encoding: A=2'b00, B=2'b01, C=2'b10,
D=2'b11.Implement only the state transition logic and output logic (the
combinational logic portion) for this state machine. Given the current
state (state), compute the next_state and output (out) based on the state
transition table.

  State | Next state in=0, Next state in=1 | Output
  A     | A, B                             | 0
  B     | C, B                             | 0
  C     | A, D                             | 0
  D     | C, B                             | 1

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1 |  |
| `state` | in | 2 |  |
| `next_state` | out | 2 | |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
