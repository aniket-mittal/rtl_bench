# Fill in the masked region of `mg_01505`

The file `mg_01505.v` holds a Verilog design whose top module is `mg_01505` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_01505`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_01505.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_01505` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_01505.v`. Only these files are graded.

## Interface of `mg_01505`

| port | dir | width | note |
|---|---|---|---|
| `dirrep_dir_wr_par_c4` | in | 1 |  |
| `dir_vld_c4_l` | in | 1 |  |
| `lkup_addr8_c4` | in | 1 |  |
| `tagdp_lkup_addr_c4` | in | 30 |  |
| `lkup_wr_data_up_buf` | out | 33 | |
| `lkup_wr_data_dn_buf` | out | 33 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_01505.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
