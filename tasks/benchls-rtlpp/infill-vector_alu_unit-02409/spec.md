# Fill in the masked region of `rtlpp_02409`

The file `rtlpp_02409.v` holds a Verilog design whose top module is `rtlpp_02409` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02409`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02409.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02409` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02409.v`. Only these files are graded.

## Interface of `rtlpp_02409`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `vl` | in | 9 |  |
| `vcsr_quant` | in | 2 |  |
| `I_clear` | in | 1 |  |
| `I_id` | in | 3 |  |
| `proc_addr` | in | 32 |  |
| `proc_din` | in | 32 |  |
| `proc_we` | in | 1 |  |
| `I_start` | in | 1 |  |
| `I_vs1` | in | 5 |  |
| `I_vs2` | in | 5 |  |
| `I_vd` | in | 5 |  |
| `I_RS1` | in | 32 |  |
| `I_RS2` | in | 32 |  |
| `I_uimm5` | in | 5 |  |
| `I_funct` | in | 8 |  |
| `I_permute` | in | 2 |  |
| `I_mask_en` | in | 1 |  |
| `I_ALUSrc` | in | 2 |  |
| `I_dmr` | in | 1 |  |
| `I_dmw` | in | 1 |  |
| `I_reg_we` | in | 1 |  |
| `I_mem_reg` | in | 1 |  |
| `I_Xout` | in | 1 |  |
| `I_mode_lsu` | in | 2 |  |
| `ALU_mon` | out | 1 | |
| `stall` | out | 1 | |
| `DONE` | out | 1 | |
| `proc_dout` | out | 32 | |
| `XRF_ADDR` | out | 5 | |
| `XRF_DATAWR` | out | 32 | |
| `XRF_WE` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02409.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
