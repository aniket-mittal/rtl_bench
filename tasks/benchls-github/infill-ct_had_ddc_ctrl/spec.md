# Fill in the masked region of `ct_had_ddc_ctrl`

The file `ct_had_ddc_ctrl.v` holds a Verilog design whose top module is `ct_had_ddc_ctrl` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `ct_had_ddc_ctrl`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-32.openc910.

## Rules

- Edit only `ct_had_ddc_ctrl.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `ct_had_ddc_ctrl` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `ct_had_ddc_ctrl.v`. Only these files are graded.

## Interface of `ct_had_ddc_ctrl`

| port | dir | width | note |
|---|---|---|---|
| `cpuclk` | in | 1 | clock, rising edge |
| `cpurst_b` | in | 1 | reset, active low |
| `ir_xx_daddr_reg_sel` | in | 1 |  |
| `ir_xx_ddata_reg_sel` | in | 1 |  |
| `regs_xx_ddc_en` | in | 1 |  |
| `rtu_yy_xx_retire0_normal` | in | 1 |  |
| `x_sm_xx_update_dr_en` | in | 1 |  |
| `ddc_ctrl_dp_addr_gen` | out | 1 | |
| `ddc_ctrl_dp_addr_sel` | out | 1 | |
| `ddc_ctrl_dp_data_sel` | out | 1 | |
| `ddc_regs_update_csr` | out | 1 | |
| `ddc_regs_update_wbbr` | out | 1 | |
| `ddc_xx_update_ir` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v ct_had_ddc_ctrl.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
