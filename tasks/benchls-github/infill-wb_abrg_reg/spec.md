# Fill in the masked region of `wb_abrg_reg`

The file `wb_abrg_reg.v` holds a Verilog design whose top module is `wb_abrg_reg` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `wb_abrg_reg`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-15.zet.

## Rules

- Edit only `wb_abrg_reg.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `wb_abrg_reg` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `wb_abrg_reg.v`. Only these files are graded.

## Interface of `wb_abrg_reg`

| port | dir | width | note |
|---|---|---|---|
| `wbs_clk_i` | in | 1 | clock, rising edge |
| `sys_rst` | in | 1 | reset, active high |
| `wbs_adr_i` | in | 19 |  |
| `wbs_dat_i` | in | 16 |  |
| `wbs_sel_i` | in | 2 |  |
| `wbs_tga_i` | in | 1 |  |
| `wbs_stb_i` | in | 1 |  |
| `wbs_cyc_i` | in | 1 |  |
| `wbs_we_i` | in | 1 |  |
| `wbm_clk_i` | in | 1 |  |
| `wbm_dat_i` | in | 16 |  |
| `wbm_ack_i` | in | 1 |  |
| `wbs_dat_o` | out | 16 | |
| `wbs_ack_o` | out | 1 | |
| `wbm_adr_o` | out | 19 | |
| `wbm_dat_o` | out | 16 | |
| `wbm_sel_o` | out | 2 | |
| `wbm_tga_o` | out | 1 | |
| `wbm_stb_o` | out | 1 | |
| `wbm_cyc_o` | out | 1 | |
| `wbm_we_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v wb_abrg_reg.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
