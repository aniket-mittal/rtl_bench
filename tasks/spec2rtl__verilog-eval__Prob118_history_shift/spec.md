# Implement `TopModule` (verilog-eval: Prob118_history_shift)

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
 - input  predict_valid
 - input  predict_taken
 - input  train_mispredicted
 - input  train_taken
 - input  train_history   (32 bits)
 - output predict_history (32 bits)

The module should implement a 32-bit global history shift register,
including support for rolling back state in response to a pipeline flush
caused by a branch misprediction. When a branch prediction is made
(predict_valid = 1), shift in predict_taken from the LSB side to update
the branch history for the predicted branch. (predict_history[0] is the
direction of the youngest branch.) When a branch misprediction occurs
(train_mispredicted = 1), load the branch history register with the
history after the completion of the mispredicted branch. This is the
history before the mispredicted branch (train_history) concatenated with
the actual result of the branch (train_taken). If both a prediction and
misprediction occur at the same time, the misprediction takes precedence,
because the pipeline flush will also flush out the branch that is
currently making a prediction. predict_history is the value of the branch
history register. areset is a positive edge triggered asynchronous reset
that resets the history counter to zero. Assume all sequential logic is
triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `areset` | in | 1 | reset, active high |
| `predict_valid` | in | 1 |  |
| `predict_taken` | in | 1 |  |
| `train_mispredicted` | in | 1 |  |
| `train_taken` | in | 1 |  |
| `train_history` | in | 32 |  |
| `predict_history` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
