# Fill in the masked region of `origen_166794`

The file `origen_166794.v` holds a Verilog design whose top module is `origen_166794` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_166794`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_166794.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_166794` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_166794.v`. Only these files are graded.

## Interface of `origen_166794`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `tb_startup` | in | 1 |  |
| `emif_sdch_rd` | in | 1 |  |
| `p_q_swi` | in | 1 |  |
| `p_sdch_dout` | in | 16 |  |
| `p_sdch_dout_vld` | in | 1 |  |
| `q_sdch_dout` | in | 16 |  |
| `q_sdch_dout_vld` | in | 1 |  |
| `source_valid` | in | 1 |  |
| `source_sop` | in | 1 |  |
| `source_eop` | in | 1 |  |
| `source_data_s` | in | 16 |  |
| `p_enable` | out | 1 | |
| `q_enable` | out | 1 | |
| `p_tb_startup` | out | 1 | |
| `q_tb_startup` | out | 1 | |
| `p_emif_sdch_rd` | out | 1 | |
| `q_emif_sdch_rd` | out | 1 | |
| `p_source_valid` | out | 1 | |
| `p_source_sop` | out | 1 | |
| `p_source_eop` | out | 1 | |
| `p_source_data_s` | out | 16 | |
| `q_source_valid` | out | 1 | |
| `q_source_sop` | out | 1 | |
| `q_source_eop` | out | 1 | |
| `q_source_data_s` | out | 16 | |
| `sdch_dout` | out | 16 | |
| `sdch_dout_vld` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_166794.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
