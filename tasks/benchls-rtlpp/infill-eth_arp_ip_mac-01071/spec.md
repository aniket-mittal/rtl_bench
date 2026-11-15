# Fill in the masked region of `rtlpp_01071`

The file `rtlpp_01071.v` holds a Verilog design whose top module is `rtlpp_01071` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_01071`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01071.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01071` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01071.v`. Only these files are graded.

## Interface of `rtlpp_01071`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `s_eth_hdr_valid` | in | 1 |  |
| `s_eth_dest_mac` | in | 48 |  |
| `s_eth_src_mac` | in | 48 |  |
| `s_eth_type` | in | 16 |  |
| `s_eth_payload_axis_tdata` | in | 8 |  |
| `s_eth_payload_axis_tvalid` | in | 1 |  |
| `s_eth_payload_axis_tlast` | in | 1 |  |
| `s_eth_payload_axis_tuser` | in | 1 |  |
| `m_eth_hdr_ready` | in | 1 |  |
| `m_eth_payload_axis_tready` | in | 1 |  |
| `arp_request_ready` | in | 1 |  |
| `arp_response_valid` | in | 1 |  |
| `arp_response_error` | in | 1 |  |
| `arp_response_mac` | in | 48 |  |
| `s_ip_hdr_valid` | in | 1 |  |
| `s_ip_dscp` | in | 6 |  |
| `s_ip_ecn` | in | 2 |  |
| `s_ip_length` | in | 16 |  |
| `s_ip_ttl` | in | 8 |  |
| `s_ip_protocol` | in | 8 |  |
| `s_ip_source_ip` | in | 32 |  |
| `s_ip_dest_ip` | in | 32 |  |
| `s_ip_payload_axis_tdata` | in | 8 |  |
| `s_ip_payload_axis_tvalid` | in | 1 |  |
| `s_ip_payload_axis_tlast` | in | 1 |  |
| `s_ip_payload_axis_tuser` | in | 1 |  |
| `m_ip_hdr_ready` | in | 1 |  |
| `m_ip_payload_axis_tready` | in | 1 |  |
| `local_mac` | in | 48 |  |
| `local_ip` | in | 32 |  |
| `s_eth_hdr_ready` | out | 1 | |
| `s_eth_payload_axis_tready` | out | 1 | |
| `m_eth_hdr_valid` | out | 1 | |
| `m_eth_dest_mac` | out | 48 | |
| `m_eth_src_mac` | out | 48 | |
| `m_eth_type` | out | 16 | |
| `m_eth_payload_axis_tdata` | out | 8 | |
| `m_eth_payload_axis_tvalid` | out | 1 | |
| `m_eth_payload_axis_tlast` | out | 1 | |
| `m_eth_payload_axis_tuser` | out | 1 | |
| `arp_request_valid` | out | 1 | |
| `arp_request_ip` | out | 32 | |
| `arp_response_ready` | out | 1 | |
| `s_ip_hdr_ready` | out | 1 | |
| `s_ip_payload_axis_tready` | out | 1 | |
| `m_ip_hdr_valid` | out | 1 | |
| `m_ip_eth_dest_mac` | out | 48 | |
| `m_ip_eth_src_mac` | out | 48 | |
| `m_ip_eth_type` | out | 16 | |
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
| `m_ip_payload_axis_tdata` | out | 8 | |
| `m_ip_payload_axis_tvalid` | out | 1 | |
| `m_ip_payload_axis_tlast` | out | 1 | |
| `m_ip_payload_axis_tuser` | out | 1 | |
| `rx_busy` | out | 1 | |
| `tx_busy` | out | 1 | |
| `rx_error_header_early_termination` | out | 1 | |
| `rx_error_payload_early_termination` | out | 1 | |
| `rx_error_invalid_header` | out | 1 | |
| `rx_error_invalid_checksum` | out | 1 | |
| `tx_error_payload_early_termination` | out | 1 | |
| `tx_error_arp_failed` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01071.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
