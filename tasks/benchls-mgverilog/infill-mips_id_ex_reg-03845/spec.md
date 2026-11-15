# Fill in the masked region of `mg_03845`

The file `mg_03845.v` holds a Verilog design whose top module is `mg_03845` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_03845`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03845.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03845` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03845.v`. Only these files are graded.

## Interface of `mg_03845`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `wb_reg_write` | in | 1 |  |
| `wb_memtoreg` | in | 1 |  |
| `mem_memread` | in | 1 |  |
| `mem_memwrite` | in | 1 |  |
| `mem_ll_mem` | in | 1 |  |
| `mem_sc_mem` | in | 1 |  |
| `regdst` | in | 1 |  |
| `aluop` | in | 2 |  |
| `alusrc` | in | 1 |  |
| `regread1` | in | 32 |  |
| `regread2` | in | 32 |  |
| `sign_extend` | in | 32 |  |
| `reg_rs` | in | 5 |  |
| `reg_rt` | in | 5 |  |
| `reg_rd` | in | 5 |  |
| `ex_wb_reg_write` | out | 1 | |
| `ex_wb_memtoreg` | out | 1 | |
| `ex_mem_memread` | out | 1 | |
| `ex_mem_memwrite` | out | 1 | |
| `ex_mem_ll_mem` | out | 1 | |
| `ex_mem_sc_mem` | out | 1 | |
| `ex_regdst` | out | 1 | |
| `ex_aluop` | out | 2 | |
| `ex_alusrc` | out | 1 | |
| `ex_regread1` | out | 32 | |
| `ex_regread2` | out | 32 | |
| `ex_sign_extend` | out | 32 | |
| `ex_reg_rs` | out | 5 | |
| `ex_reg_rt` | out | 5 | |
| `ex_reg_rd` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03845.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
