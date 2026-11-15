# Fill in the masked region of `rtlpp_00255`

The file `rtlpp_00255.v` holds a Verilog design whose top module is `rtlpp_00255` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_00255`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_00255.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_00255` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_00255.v`. Only these files are graded.

## Interface of `rtlpp_00255`

| port | dir | width | note |
|---|---|---|---|
| `cmp_gclk` | in | 1 | clock, rising edge |
| `io_pwron_rst_l` | in | 1 |  |
| `ctu_ddr0_dram_cken_dl` | in | 1 |  |
| `ctu_ddr1_dram_cken_dl` | in | 1 |  |
| `ctu_ddr2_dram_cken_dl` | in | 1 |  |
| `ctu_ddr3_dram_cken_dl` | in | 1 |  |
| `ctu_dram02_dram_cken_dl` | in | 1 |  |
| `ctu_dram13_dram_cken_dl` | in | 1 |  |
| `start_clk_dl` | in | 1 |  |
| `a_grst_dl` | in | 1 | reset, active high |
| `a_dbginit_dl` | in | 1 |  |
| `de_grst_dsync_edge_dl` | in | 1 |  |
| `de_dbginit_dsync_edge_dl` | in | 1 |  |
| `start_clk_dg` | out | 1 | |
| `ctu_ddr0_dram_cken_dg` | out | 1 | |
| `ctu_ddr1_dram_cken_dg` | out | 1 | |
| `ctu_ddr2_dram_cken_dg` | out | 1 | |
| `ctu_ddr3_dram_cken_dg` | out | 1 | |
| `ctu_dram02_dram_cken_dg` | out | 1 | |
| `ctu_dram13_dram_cken_dg` | out | 1 | |
| `a_grst_dg` | out | 1 | |
| `a_dbginit_dg` | out | 1 | |
| `de_grst_dsync_edge_dg` | out | 1 | |
| `de_dbginit_dsync_edge_dg` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_00255.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
