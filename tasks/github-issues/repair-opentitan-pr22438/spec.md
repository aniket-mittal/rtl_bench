# Fix GitHub issue #22437 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `2723ca659d32`), trimmed to the files needed to elaborate the module `usb_fs_nb_in_pe`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [usbdev] Timeout too long on host handshake response

**Description:**

### Description

The IN side logic must time out in the event of a missing handshake response from the host. It is permitted to time out/after 16 bit intervals measured at the device ports (SE0->J transition to to SOP transition J->K) but must time out before 18 bit intervals.

The comment and counter initialization value at the top of 'usb_fs_nb_in_pe.sv' claim to be targeting 17 bit intervals and that there is a 3 bit interval delay before the receipt of 'rx_pkt_start_i' after the SOP transition at the port pins. In fact rx_pkt_start_i is asserted 1.5 bit intervals after the SOP transition at the usbdev ports - 0.5 bit interval delay through the 2 synchronizer flops, and 1 bit interval of K signaling.

The value of (17 + 3) * 4 therefore results in a time out occurring after ca. 19 bit intervals at the ports, which is unlikely to cause problems, but could be improved.

(Background: observations in sim having deliberately modified the usbdpi model to drop the ACK following an IN DATA packet.)

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `usb_fs_nb_in_pe`.

- Do not change the ports of `usb_fs_nb_in_pe` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/usb_fs_nb_in_pe.v` | `hw/ip/usbdev/rtl/usb_fs_nb_in_pe.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `usb_fs_nb_in_pe` are the same as upstream.

## Grading

Your `usb_fs_nb_in_pe` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/usb_fs_nb_in_pe.v`. Only these files are graded.

## Interface of `usb_fs_nb_in_pe`

| port | dir | width | note |
|---|---|---|---|
| `clk_48mhz_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `link_reset_i` | in | 1 |  |
| `link_active_i` | in | 1 |  |
| `dev_addr_i` | in | 7 |  |
| `in_ep_enabled_i` | in | 12 |  |
| `in_ep_stall_i` | in | 12 |  |
| `in_ep_has_data_i` | in | 12 |  |
| `in_ep_data_i` | in | 8 |  |
| `in_ep_data_done_i` | in | 12 |  |
| `in_ep_iso_i` | in | 12 |  |
| `in_datatog_we_i` | in | 1 |  |
| `in_datatog_status_i` | in | 12 |  |
| `in_datatog_mask_i` | in | 12 |  |
| `rx_pkt_start_i` | in | 1 |  |
| `rx_pkt_end_i` | in | 1 |  |
| `rx_pkt_valid_i` | in | 1 |  |
| `rx_pid_i` | in | 4 |  |
| `rx_addr_i` | in | 7 |  |
| `rx_endp_i` | in | 4 |  |
| `tx_pkt_end_i` | in | 1 |  |
| `tx_data_get_i` | in | 1 |  |
| `in_xact_starting_o` | out | 1 | |
| `in_xact_start_ep_o` | out | 4 | |
| `in_ep_current_o` | out | 4 | |
| `in_ep_rollback_o` | out | 1 | |
| `in_ep_xact_end_o` | out | 1 | |
| `in_ep_get_addr_o` | out | 5 | |
| `in_ep_data_get_o` | out | 1 | |
| `in_ep_newpkt_o` | out | 1 | |
| `in_data_toggle_o` | out | 12 | |
| `tx_pkt_start_o` | out | 1 | |
| `tx_pid_o` | out | 4 | |
| `tx_data_avail_o` | out | 1 | |
| `tx_data_o` | out | 8 | |
| `event_timeout_in_o` | out | 1 | |
| `event_nak_in_o` | out | 1 | |
| `event_nodata_in_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/usb_fs_nb_in_pe.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
