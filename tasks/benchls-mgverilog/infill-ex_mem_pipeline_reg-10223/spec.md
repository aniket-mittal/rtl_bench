# Fill in the masked region of `mg_10223`

The file `mg_10223.v` holds a Verilog design whose top module is `mg_10223` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_10223`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_10223.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_10223` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_10223.v`. Only these files are graded.

## Interface of `mg_10223`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `branch` | in | 1 |  |
| `mem_read` | in | 1 |  |
| `mem_write` | in | 1 |  |
| `ll_mem` | in | 1 |  |
| `sc_mem` | in | 1 |  |
| `reg_write` | in | 1 |  |
| `memtoreg` | in | 1 |  |
| `alu_zero` | in | 1 |  |
| `alu_result` | in | 32 |  |
| `reg_read2` | in | 32 |  |
| `dest_reg` | in | 5 |  |
| `mem_branch` | out | 1 | |
| `mem_mem_read` | out | 1 | |
| `mem_mem_write` | out | 1 | |
| `mem_ll_mem` | out | 1 | |
| `mem_sc_mem` | out | 1 | |
| `mem_reg_write` | out | 1 | |
| `mem_memtoreg` | out | 1 | |
| `mem_alu_zero` | out | 1 | |
| `mem_alu_result` | out | 32 | |
| `mem_reg_read2` | out | 32 | |
| `mem_dest_reg` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_10223.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
