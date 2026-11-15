# Fill in the masked region of `origen_125469`

The file `origen_125469.v` holds a Verilog design whose top module is `origen_125469` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_125469`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_125469.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_125469` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_125469.v`. Only these files are graded.

## Interface of `origen_125469`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `wbs_data_i` | in | 32 |  |
| `wb_addr_i` | in | 32 |  |
| `wb_sel_i` | in | 4 |  |
| `wb_we_i` | in | 1 |  |
| `wb_cyc_i` | in | 1 |  |
| `wb_stb_i` | in | 1 |  |
| `wbm_data_i` | in | 32 |  |
| `wb_ack_i` | in | 1 |  |
| `wb_err_i` | in | 1 |  |
| `wb_rty_i` | in | 1 |  |
| `mast_go` | in | 1 |  |
| `mast_we` | in | 1 |  |
| `mast_adr` | in | 32 |  |
| `mast_sel` | in | 4 |  |
| `mast_din` | in | 32 |  |
| `pt_sel_i` | in | 1 |  |
| `mast_pt_in` | in | 71 |  |
| `slv_dout` | in | 32 |  |
| `slv_pt_in` | in | 71 |  |
| `wbs_data_o` | out | 32 | |
| `wb_ack_o` | out | 1 | |
| `wb_err_o` | out | 1 | |
| `wb_rty_o` | out | 1 | |
| `wbm_data_o` | out | 32 | |
| `wb_addr_o` | out | 32 | |
| `wb_sel_o` | out | 4 | |
| `wb_we_o` | out | 1 | |
| `wb_cyc_o` | out | 1 | |
| `wb_stb_o` | out | 1 | |
| `mast_dout` | out | 32 | |
| `mast_err` | out | 1 | |
| `mast_drdy` | out | 1 | |
| `mast_wait` | out | 1 | |
| `mast_pt_out` | out | 37 | |
| `slv_adr` | out | 32 | |
| `slv_din` | out | 32 | |
| `slv_re` | out | 1 | |
| `slv_we` | out | 1 | |
| `pt_sel_o` | out | 1 | |
| `slv_pt_out` | out | 37 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_125469.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
