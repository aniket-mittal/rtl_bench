# Fill in the masked region of `udp_ip_tx_64`

The file `udp_ip_tx_64.v` holds a Verilog design whose top module is `udp_ip_tx_64` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `udp_ip_tx_64`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-2.verilog-ethernet.

## Rules

- Edit only `udp_ip_tx_64.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `udp_ip_tx_64` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `udp_ip_tx_64.v`. Only these files are graded.

## Interface of `udp_ip_tx_64`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `s_udp_hdr_valid` | in | 1 |  |
| `s_eth_dest_mac` | in | 48 |  |
| `s_eth_src_mac` | in | 48 |  |
| `s_eth_type` | in | 16 |  |
| `s_ip_version` | in | 4 |  |
| `s_ip_ihl` | in | 4 |  |
| `s_ip_dscp` | in | 6 |  |
| `s_ip_ecn` | in | 2 |  |
| `s_ip_identification` | in | 16 |  |
| `s_ip_flags` | in | 3 |  |
| `s_ip_fragment_offset` | in | 13 |  |
| `s_ip_ttl` | in | 8 |  |
| `s_ip_protocol` | in | 8 |  |
| `s_ip_header_checksum` | in | 16 |  |
| `s_ip_source_ip` | in | 32 |  |
| `s_ip_dest_ip` | in | 32 |  |
| `s_udp_source_port` | in | 16 |  |
| `s_udp_dest_port` | in | 16 |  |
| `s_udp_length` | in | 16 |  |
| `s_udp_checksum` | in | 16 |  |
| `s_udp_payload_axis_tdata` | in | 64 |  |
| `s_udp_payload_axis_tkeep` | in | 8 |  |
| `s_udp_payload_axis_tvalid` | in | 1 |  |
| `s_udp_payload_axis_tlast` | in | 1 |  |
| `s_udp_payload_axis_tuser` | in | 1 |  |
| `m_ip_hdr_ready` | in | 1 |  |
| `m_ip_payload_axis_tready` | in | 1 |  |
| `s_udp_hdr_ready` | out | 1 | |
| `s_udp_payload_axis_tready` | out | 1 | |
| `m_ip_hdr_valid` | out | 1 | |
| `m_eth_dest_mac` | out | 48 | |
| `m_eth_src_mac` | out | 48 | |
| `m_eth_type` | out | 16 | |
| `m_ip_version` | out | 4 | |
| `m_ip_ihl` | out | 4 | |
| `m_ip_dscp` | out | 6 | |
| `m_ip_ecn` | out | 2 | |
| `m_ip_length` | out | 16 | |
| `m_ip_identification` | out | 16 | |
| `m_ip_flags` | out | 3 | |
| `m_ip_fragment_offset` | out | 13 | |
| `m_ip_ttl` | out | 8 | |
| `m_ip_protocol` | out | 8 | |
| `m_ip_header_checksum` | out | 16 | |
| `m_ip_source_ip` | out | 32 | |
| `m_ip_dest_ip` | out | 32 | |
| `m_ip_payload_axis_tdata` | out | 64 | |
| `m_ip_payload_axis_tkeep` | out | 8 | |
| `m_ip_payload_axis_tvalid` | out | 1 | |
| `m_ip_payload_axis_tlast` | out | 1 | |
| `m_ip_payload_axis_tuser` | out | 1 | |
| `busy` | out | 1 | |
| `error_payload_early_termination` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v udp_ip_tx_64.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
