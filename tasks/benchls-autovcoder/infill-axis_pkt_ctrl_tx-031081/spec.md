# Fill in the masked region of `autovcoder_031081`

The file `autovcoder_031081.v` holds a Verilog design whose top module is `autovcoder_031081` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_031081`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_031081.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_031081` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_031081.v`. Only these files are graded.

## Interface of `autovcoder_031081`

| port | dir | width | note |
|---|---|---|---|
| `m_axis_txc_aclk` | in | 1 | clock, rising edge |
| `m_axis_txd_tvalid` | in | 1 |  |
| `m_axis_txd_tlast` | in | 1 |  |
| `m_axis_txd_tready` | in | 1 |  |
| `tx_pkt_byte_cnt` | in | 12 |  |
| `tx_pkt_byte_cnt_vld` | in | 1 |  |
| `s_axis_rxs_aclk` | in | 1 |  |
| `s_axis_rxs_aresetn` | in | 1 | reset, active low |
| `s_axis_rxs_tdata` | in | 32 |  |
| `s_axis_rxs_tkeep` | in | 4 |  |
| `s_axis_rxs_tlast` | in | 1 |  |
| `s_axis_rxs_tvalid` | in | 1 |  |
| `m_axis_txc_aresetn` | in | 1 |  |
| `m_axis_txc_tready` | in | 1 |  |
| `s_axis_rxs_tready` | out | 1 | |
| `m_axis_txc_tvalid` | out | 1 | |
| `m_axis_txc_tdata` | out | 32 | |
| `m_axis_txc_tkeep` | out | 4 | |
| `m_axis_txc_tlast` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_031081.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
