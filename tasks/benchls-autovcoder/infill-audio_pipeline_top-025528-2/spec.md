# Fill in the masked region of `autovcoder_025528`

The file `autovcoder_025528.v` holds a Verilog design whose top module is `autovcoder_025528` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `autovcoder_025528`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_025528.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_025528` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_025528.v`. Only these files are graded.

## Interface of `autovcoder_025528`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_n_i` | in | 1 | reset, active high |
| `la_data_in_i` | in | 128 |  |
| `la_oenb_i` | in | 128 |  |
| `ctl_pipeline_en_i` | in | 1 |  |
| `mic_pdm_data_i` | in | 1 |  |
| `dfe_data_i` | in | 8 |  |
| `dfe_valid_i` | in | 1 |  |
| `aco_data_i` | in | 104 |  |
| `aco_valid_i` | in | 1 |  |
| `aco_last_i` | in | 1 |  |
| `wrd_wake_i` | in | 1 |  |
| `wrd_wake_valid_i` | in | 1 |  |
| `la_data_out_o` | out | 128 | |
| `ctl_pipeline_en_o` | out | 1 | |
| `mic_pdm_data_o` | out | 1 | |
| `dfe_data_o` | out | 8 | |
| `dfe_valid_o` | out | 1 | |
| `aco_data_o` | out | 104 | |
| `aco_valid_o` | out | 1 | |
| `aco_last_o` | out | 1 | |
| `wrd_wake_o` | out | 1 | |
| `wrd_wake_valid_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_025528.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
