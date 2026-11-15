# Fill in the masked region of `origen_171252`

The file `origen_171252.v` holds a Verilog design whose top module is `origen_171252` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `origen_171252`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_171252.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_171252` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_171252.v`. Only these files are graded.

## Interface of `origen_171252`

| port | dir | width | note |
|---|---|---|---|
| `V_ex` | in | 1 |  |
| `eip_change` | in | 1 |  |
| `AF_needed` | in | 1 |  |
| `DF_needed` | in | 1 |  |
| `CF_needed` | in | 1 |  |
| `v_wb_ld_flag_AF` | in | 1 |  |
| `v_wb_ld_flag_DF` | in | 1 |  |
| `v_wb_ld_flag_CF` | in | 1 |  |
| `wb_mem_stall` | in | 1 |  |
| `ld_reg1` | in | 1 |  |
| `ld_reg2` | in | 1 |  |
| `ld_reg3` | in | 1 |  |
| `ld_flag_ZF` | in | 1 |  |
| `ld_seg` | in | 1 |  |
| `ld_mm` | in | 1 |  |
| `ld_mem` | in | 1 |  |
| `v_ro_ld_reg1` | out | 1 | |
| `v_ro_ld_reg2` | out | 1 | |
| `v_ro_ld_reg3` | out | 1 | |
| `v_ro_ld_flag_ZF` | out | 1 | |
| `v_ro_ld_seg` | out | 1 | |
| `v_ro_ld_mm` | out | 1 | |
| `v_ro_ld_mem` | out | 1 | |
| `dep_stall` | out | 1 | |
| `br_stall` | out | 1 | |
| `V_wb` | out | 1 | |
| `ld_wb` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_171252.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
