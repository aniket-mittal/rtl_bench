# Fill in the masked region of `stats_pcie_tlp`

The file `stats_pcie_tlp.v` holds a Verilog design whose top module is `stats_pcie_tlp` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `stats_pcie_tlp`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-5.corundum.

## Rules

- Edit only `stats_pcie_tlp.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `stats_pcie_tlp` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `stats_pcie_tlp.v`. Only these files are graded.

## Interface of `stats_pcie_tlp`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `tlp_hdr` | in | 128 |  |
| `tlp_valid` | in | 1 |  |
| `tlp_sop` | in | 1 |  |
| `tlp_eop` | in | 1 |  |
| `stat_tlp_mem_rd` | out | 1 | |
| `stat_tlp_mem_wr` | out | 1 | |
| `stat_tlp_io` | out | 1 | |
| `stat_tlp_cfg` | out | 1 | |
| `stat_tlp_msg` | out | 1 | |
| `stat_tlp_cpl` | out | 1 | |
| `stat_tlp_cpl_ur` | out | 1 | |
| `stat_tlp_cpl_ca` | out | 1 | |
| `stat_tlp_atomic` | out | 1 | |
| `stat_tlp_ep` | out | 1 | |
| `stat_tlp_hdr_dw` | out | 3 | |
| `stat_tlp_req_dw` | out | 11 | |
| `stat_tlp_payload_dw` | out | 11 | |
| `stat_tlp_cpl_dw` | out | 11 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v stats_pcie_tlp.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
