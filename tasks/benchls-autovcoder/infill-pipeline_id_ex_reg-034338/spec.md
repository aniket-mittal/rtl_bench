# Fill in the masked region of `autovcoder_034338`

The file `autovcoder_034338.v` holds a Verilog design whose top module is `autovcoder_034338` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_034338`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_034338.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_034338` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_034338.v`. Only these files are graded.

## Interface of `autovcoder_034338`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `clr` | in | 1 |  |
| `reg_write_d` | in | 1 |  |
| `mem2reg_d` | in | 1 |  |
| `mem_wr_d` | in | 1 |  |
| `alu_control_d` | in | 3 |  |
| `alu_src_d` | in | 1 |  |
| `reg_dst_d` | in | 1 |  |
| `rd1_d` | in | 32 |  |
| `rd2_d` | in | 32 |  |
| `rsd_d` | in | 5 |  |
| `rtd_d` | in | 5 |  |
| `rde_d` | in | 5 |  |
| `sign_extend_d` | in | 32 |  |
| `reg_write` | out | 1 | |
| `mem2reg` | out | 1 | |
| `mem_wr` | out | 1 | |
| `alu_control` | out | 3 | |
| `alu_src` | out | 1 | |
| `reg_dst` | out | 1 | |
| `rd1_e` | out | 32 | |
| `rd2_e` | out | 32 | |
| `rse` | out | 5 | |
| `rte` | out | 5 | |
| `rdE` | out | 5 | |
| `sign_extend` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_034338.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
