# Fill in the masked region of `rtlpp_03744`

The file `rtlpp_03744.v` holds a Verilog design whose top module is `rtlpp_03744` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_03744`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_03744.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_03744` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_03744.v`. Only these files are graded.

## Interface of `rtlpp_03744`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `s_eth_hdr_valid` | in | 1 |  |
| `s_eth_dest_mac` | in | 48 |  |
| `s_eth_src_mac` | in | 48 |  |
| `s_eth_type` | in | 16 |  |
| `s_eth_payload_axis_tdata` | in | 64 |  |
| `s_eth_payload_axis_tkeep` | in | 8 |  |
| `s_eth_payload_axis_tvalid` | in | 1 |  |
| `s_eth_payload_axis_tlast` | in | 1 |  |
| `s_eth_payload_axis_tuser` | in | 1 |  |
| `m_frame_ready` | in | 1 |  |
| `s_eth_hdr_ready` | out | 1 | |
| `s_eth_payload_axis_tready` | out | 1 | |
| `m_frame_valid` | out | 1 | |
| `m_eth_dest_mac` | out | 48 | |
| `m_eth_src_mac` | out | 48 | |
| `m_eth_type` | out | 16 | |
| `m_arp_htype` | out | 16 | |
| `m_arp_ptype` | out | 16 | |
| `m_arp_hlen` | out | 8 | |
| `m_arp_plen` | out | 8 | |
| `m_arp_oper` | out | 16 | |
| `m_arp_sha` | out | 48 | |
| `m_arp_spa` | out | 32 | |
| `m_arp_tha` | out | 48 | |
| `m_arp_tpa` | out | 32 | |
| `busy` | out | 1 | |
| `error_header_early_termination` | out | 1 | |
| `error_invalid_header` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_03744.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
