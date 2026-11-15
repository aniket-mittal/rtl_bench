# Fill in the masked region of `mg_04653`

The file `mg_04653.v` holds a Verilog design whose top module is `mg_04653` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_04653`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_04653.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_04653` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_04653.v`. Only these files are graded.

## Interface of `mg_04653`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `s7_idex` | in | 1 |  |
| `dmem_wen_idex` | in | 1 |  |
| `rf_wen_idex` | in | 1 |  |
| `branch2_idex` | in | 1 |  |
| `mem2reg_idex` | in | 1 |  |
| `aluout` | in | 16 |  |
| `flag` | in | 3 |  |
| `extended_16_idex` | in | 16 |  |
| `rdata2_idex` | in | 16 |  |
| `rf_waddr` | in | 4 |  |
| `branch_target_final_muxout` | in | 16 |  |
| `nop_lw_idex` | in | 1 |  |
| `nop_sw_idex` | in | 1 |  |
| `pc_added_idex` | in | 16 |  |
| `jal_idex` | in | 1 |  |
| `dmem_wen_exmem` | out | 1 | |
| `rf_wen_exmem` | out | 1 | |
| `branch2_exmem` | out | 1 | |
| `mem2reg_exmem` | out | 1 | |
| `aluout_exmem` | out | 16 | |
| `flag_exmem` | out | 3 | |
| `rdata2_exmem` | out | 16 | |
| `rf_waddr_exmem` | out | 4 | |
| `extended_exmem` | out | 16 | |
| `s7_exmem` | out | 1 | |
| `branch_target_exmem` | out | 16 | |
| `nop_lw_exmem` | out | 1 | |
| `nop_sw_exmem` | out | 1 | |
| `pc_added_exmem` | out | 16 | |
| `jal_exmem` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_04653.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
