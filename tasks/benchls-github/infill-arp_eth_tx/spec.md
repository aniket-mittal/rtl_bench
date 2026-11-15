# Fill in the masked region of `arp_eth_tx`

The file `arp_eth_tx.v` holds a Verilog design whose top module is `arp_eth_tx` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `arp_eth_tx`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-2.verilog-ethernet.

## Rules

- Edit only `arp_eth_tx.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `arp_eth_tx` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `arp_eth_tx.v`. Only these files are graded.

## Interface of `arp_eth_tx`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `s_frame_valid` | in | 1 |  |
| `s_eth_dest_mac` | in | 48 |  |
| `s_eth_src_mac` | in | 48 |  |
| `s_eth_type` | in | 16 |  |
| `s_arp_htype` | in | 16 |  |
| `s_arp_ptype` | in | 16 |  |
| `s_arp_oper` | in | 16 |  |
| `s_arp_sha` | in | 48 |  |
| `s_arp_spa` | in | 32 |  |
| `s_arp_tha` | in | 48 |  |
| `s_arp_tpa` | in | 32 |  |
| `m_eth_hdr_ready` | in | 1 |  |
| `m_eth_payload_axis_tready` | in | 1 |  |
| `s_frame_ready` | out | 1 | |
| `m_eth_hdr_valid` | out | 1 | |
| `m_eth_dest_mac` | out | 48 | |
| `m_eth_src_mac` | out | 48 | |
| `m_eth_type` | out | 16 | |
| `m_eth_payload_axis_tdata` | out | 8 | |
| `m_eth_payload_axis_tkeep` | out | 1 | |
| `m_eth_payload_axis_tvalid` | out | 1 | |
| `m_eth_payload_axis_tlast` | out | 1 | |
| `m_eth_payload_axis_tuser` | out | 1 | |
| `busy` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v arp_eth_tx.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
