# Fill in the masked region of `rtlpp_11631`

The file `rtlpp_11631.v` holds a Verilog design whose top module is `rtlpp_11631` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_11631`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_11631.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_11631` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_11631.v`. Only these files are graded.

## Interface of `rtlpp_11631`

| port | dir | width | note |
|---|---|---|---|
| `clk_in` | in | 1 | clock, rising edge |
| `rstn` | in | 1 | reset, active low |
| `sel_ep_reg` | in | 1 |  |
| `reg_wr_ena` | in | 1 |  |
| `reg_rd_ena` | in | 1 |  |
| `reg_rd_addr` | in | 8 |  |
| `reg_wr_addr` | in | 8 |  |
| `reg_wr_data` | in | 32 |  |
| `dma_rd_prg_rddata` | in | 32 |  |
| `dma_wr_prg_rddata` | in | 32 |  |
| `rx_ecrc_bad_cnt` | in | 16 |  |
| `read_dma_status` | in | 64 |  |
| `write_dma_status` | in | 64 |  |
| `reg_rd_data` | out | 32 | |
| `reg_rd_data_valid` | out | 1 | |
| `dma_prg_wrdata` | out | 32 | |
| `dma_prg_addr` | out | 4 | |
| `dma_rd_prg_wrena` | out | 1 | |
| `dma_wr_prg_wrena` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_11631.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
