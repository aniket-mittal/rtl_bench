# Implement `TopModule` (verilog-eval: Prob153_gshare)

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

 - input  predict_valid,
 - input  predict_pc (7 bits)
 - output predict_taken
 - output predict_history (7 bits)

 - input  train_valid
 - input  train_taken
 - input  train_mispredicted
 - input  train_history (7 bits)
 - input  train_pc (7 bits)

The module should implement a gshare branch predictor with 7-bit pc and
7-bit global history, hashed (using xor) into a 7-bit index. This index
accesses a 128-entry table of two-bit saturating counters. The branch
predictor should contain a 7-bit global branch history register. The
branch predictor has two sets of interfaces: One for doing predictions
and one for doing training. The prediction interface is used in the
processor's Fetch stage to ask the branch predictor for branch direction
predictions for the instructions being fetched. Once these branches
proceed down the pipeline and are executed, the true outcomes of the
branches become known. The branch predictor is then trained using the
actual branch direction outcomes.

When a branch prediction is requested (predict_valid = 1) for a given pc,
the branch predictor produces the predicted branch direction and state of
the branch history register used to make the prediction. The branch
history register is then updated (at the next positive clock edge) for
the predicted branch.

When training for a branch is requested (train_valid = 1), the branch
predictor is told the pc and branch history register value for the branch
that is being trained, as well as the actual branch outcome and whether
the branch was a misprediction (needing a pipeline flush). Update the
pattern history table (PHT) to train the branch predictor to predict this
branch more accurately next time. In addition, if the branch being
trained is mispredicted, also recover the branch history register to the
state immediately after the mispredicting branch completes execution.

If training for a misprediction and a prediction (for a different,
younger instruction) occurs in the same cycle, both operations will want
to modify the branch history register. When this happens, training takes
precedence, because the branch being predicted will be discarded anyway.
If training and prediction of the same PHT entry happen at the same time,
the prediction sees the PHT state before training because training only
modifies the PHT at the next positive clock edge. The following timing
diagram shows the timing when training and predicting PHT entry 0 at the
same time. The training request at cycle 4 changes the PHT entry state in
cycle 5, but the prediction request in cycle 4 outputs the PHT state at
cycle 4, without considering the effect of the training request in cycle
4. Reset is asynchronous active-high.

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
| `predict_valid` | in | 1 |  |
| `predict_pc` | in | 7 |  |
| `train_valid` | in | 1 |  |
| `train_taken` | in | 1 |  |
| `train_mispredicted` | in | 1 |  |
| `train_history` | in | 7 |  |
| `train_pc` | in | 7 |  |
| `predict_taken` | out | 1 | |
| `predict_history` | out | 7 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
