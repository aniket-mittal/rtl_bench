# Fill in the masked region of `autovcoder_115066`

The file `autovcoder_115066.v` holds a Verilog design whose top module is `autovcoder_115066` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `autovcoder_115066`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_115066.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_115066` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_115066.v`. Only these files are graded.

## Interface of `autovcoder_115066`

| port | dir | width | note |
|---|---|---|---|
| `pcs_ctrl_in1` | in | 16 |  |
| `pcs_ctrl_in2` | in | 16 |  |
| `pcs_ctrl_in3` | in | 16 |  |
| `pcs_ctrl_in4` | in | 16 |  |
| `pcs_ctrl_in5` | in | 16 |  |
| `pcs_ctrl_in6` | in | 16 |  |
| `pcs_ctrl_in7` | in | 16 |  |
| `pcs_ctrl_in8` | in | 16 |  |
| `pcs_ctrl_in9` | in | 16 |  |
| `pcs_ctrl_in10` | in | 16 |  |
| `pcs_ctrl_in11` | in | 16 |  |
| `pcs_ctrl_in12` | in | 16 |  |
| `pcs_ctrl_in13` | in | 16 |  |
| `pcs_ctrl_in14` | in | 16 |  |
| `pcs_ctrl_in15` | in | 16 |  |
| `pcs_ctrl_in16` | in | 16 |  |
| `hw_address_ctrl_in1` | in | 16 |  |
| `hw_address_ctrl_in2` | in | 16 |  |
| `hw_address_ctrl_in3` | in | 16 |  |
| `hw_address_ctrl_in4` | in | 16 |  |
| `hw_address_ctrl_in5` | in | 16 |  |
| `hw_address_ctrl_in6` | in | 16 |  |
| `hw_address_ctrl_in7` | in | 16 |  |
| `hw_address_ctrl_in8` | in | 16 |  |
| `hw_address_ctrl_in9` | in | 16 |  |
| `hw_address_ctrl_in10` | in | 16 |  |
| `hw_address_ctrl_in11` | in | 16 |  |
| `hw_address_ctrl_in12` | in | 16 |  |
| `hw_address_ctrl_in13` | in | 16 |  |
| `hw_address_ctrl_in14` | in | 16 |  |
| `hw_address_ctrl_in15` | in | 16 |  |
| `hw_address_ctrl_in16` | in | 16 |  |
| `reg_addr` | in | 16 |  |
| `pcs_ctrl_out` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_115066.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
