# Fill in the masked region of `origen_210351`

The file `origen_210351.v` holds a Verilog design whose top module is `origen_210351` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_210351`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_210351.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_210351` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_210351.v`. Only these files are graded.

## Interface of `origen_210351`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `idex_en` | in | 1 |  |
| `memtoreg` | in | 1 |  |
| `reg_write` | in | 1 |  |
| `mem_read` | in | 1 |  |
| `mem_write` | in | 1 |  |
| `reg_dst` | in | 1 |  |
| `alusrc_a` | in | 1 |  |
| `branch` | in | 1 |  |
| `jump` | in | 1 |  |
| `halt` | in | 1 |  |
| `word_en` | in | 1 |  |
| `ld_en` | in | 1 |  |
| `pc_plus2` | in | 16 |  |
| `read_data1` | in | 16 |  |
| `read_data2` | in | 16 |  |
| `sign_extend` | in | 16 |  |
| `instr_rt` | in | 3 |  |
| `instr_rd` | in | 3 |  |
| `rs` | in | 3 |  |
| `alusrc_b` | in | 1 |  |
| `aluop` | in | 2 |  |
| `branch_label` | in | 16 |  |
| `jump_addr` | in | 16 |  |
| `memtoreg_reg` | out | 1 | |
| `reg_write_reg` | out | 1 | |
| `mem_read_reg` | out | 1 | |
| `mem_write_reg` | out | 1 | |
| `reg_dst_reg` | out | 1 | |
| `alusrc_a_reg` | out | 1 | |
| `branch_reg` | out | 1 | |
| `jump_reg` | out | 1 | |
| `halt_reg` | out | 1 | |
| `word_en_reg` | out | 1 | |
| `ld_en_reg` | out | 1 | |
| `pc_plus2_reg` | out | 16 | |
| `read_data1_reg` | out | 16 | |
| `read_data2_reg` | out | 16 | |
| `sign_extend_reg` | out | 16 | |
| `instr_rt_reg` | out | 3 | |
| `instr_rd_reg` | out | 3 | |
| `rs_reg` | out | 3 | |
| `alusrc_b_reg` | out | 1 | |
| `aluop_reg` | out | 2 | |
| `branch_label_reg` | out | 16 | |
| `jump_addr_reg` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_210351.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
