# Fix GitHub issue #23806 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `3fd3528c8c71`), trimmed to the files needed to elaborate the module `usb_fs_nb_out_pe`.

## Bug report

**Title:** [usbdev] OUT side STALL response can leave device unable to capture next SETUP/OUT packet

**Description:**

### Description

An OUT packet that elicits a 'STALL' response is neither acknowledged nor rolled back; in `usb_fs_nb_out_pe` neither 'out_ep_acked_o' nor  'rollback_data' (= `out_ep_rollback_o`) is asserted.

This means that if the packet is 62 or more bytes in length, the byte counting logic in `usbdev_usbif` is not reset in preparation for the next OUT/SETUP packet to be received and the packet size recorded into the RX FIFO is incorrect; the true size of the packet is unknowable.

The STALLing mechanism is used within current test software to declare 'protocol stall' in response to the DEVICE_QUALIFIER requests, but this does not break anything because only the IN side receives a STALL response for that Control Transfer, I think.

To reproduce, fetch draft PR sequence #23805 and run with the following seed:
```
util/dvsim/dvsim.py hw/ip/usbdev/dv/usbdev_sim_cfg.hjson -i usbdev_setup_priority_over_stall_response --fi 71923730856705723741826963384972440023047469689158980899448095559948831305837 --wa shm --tool xcelium -v m
```
If that somehow passes, try specifying '.randomize_length(0), .num_of_bytes(64)' to the task enable 'send_prnd_out_packet(..)'

This issues needs further consideration and clarification of what else may be impacted.
To be clear, this is with ES and prod RTL; it does not relate to the draft proposed changes.

@a-will, @vogelpi, @andreaskurth

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `usb_fs_nb_out_pe`.

- Do not change the ports of `usb_fs_nb_out_pe` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/usb_fs_nb_out_pe.sv` | `hw/ip/usbdev/rtl/usb_fs_nb_out_pe.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `pkg/00_usb_consts_pkg.sv` | `hw/ip/usbdev/rtl/usb_consts_pkg.sv` |
| `prim_assert.sv` | `hw/ip/prim/prim_assert.sv` |
| `prim_assert_dummy_macros.svh` | `hw/ip/prim/prim_assert_dummy_macros.svh` |
| `prim_assert_sec_cm.svh` | `hw/ip/prim/prim_assert_sec_cm.svh` |
| `prim_assert_standard_macros.svh` | `hw/ip/prim/prim_assert_standard_macros.svh` |
| `prim_assert_yosys_macros.svh` | `hw/ip/prim/prim_assert_yosys_macros.svh` |
| `prim_flop_macros.sv` | `hw/ip/prim/prim_flop_macros.sv` |
| `00_defines.v` | (added: defines SYNTHESIS) |

Packages are under `rtl/pkg/` with a numeric prefix so that they compile before the files that use them.
Module files are under `rtl/src/`.
Files that other files `include` sit at their include path under `rtl/`.
For tool compatibility the files were normalized mechanically, without changing behavior: `import` statements inside modules were moved to file scope just before the module; type names that came from a wildcard import are written as `pkg::type`; assertion macros are empty; `SYNTHESIS` is defined (in `00_defines.v`) so every tool compiles the synthesis view.

## Grading

Your `usb_fs_nb_out_pe` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/usb_fs_nb_out_pe.sv`. Only these files are graded.
Read-only (restored before grading): `00_defines.v`, `pkg/00_usb_consts_pkg.sv`, `prim_assert.sv`, `prim_assert_dummy_macros.svh`, `prim_assert_sec_cm.svh`, `prim_assert_standard_macros.svh`, `prim_assert_yosys_macros.svh`, `prim_flop_macros.sv`.

## Interface of `usb_fs_nb_out_pe`

| port | dir | width | note |
|---|---|---|---|
| `clk_48mhz_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `link_reset_i` | in | 1 |  |
| `dev_addr_i` | in | 7 |  |
| `out_ep_enabled_i` | in | 2 |  |
| `out_ep_control_i` | in | 2 |  |
| `out_ep_full_i` | in | 2 |  |
| `out_ep_stall_i` | in | 2 |  |
| `out_ep_iso_i` | in | 2 |  |
| `out_datatog_we_i` | in | 1 |  |
| `out_datatog_status_i` | in | 2 |  |
| `out_datatog_mask_i` | in | 2 |  |
| `rx_pkt_start_i` | in | 1 |  |
| `rx_pkt_end_i` | in | 1 |  |
| `rx_pkt_valid_i` | in | 1 |  |
| `rx_pid_i` | in | 4 |  |
| `rx_addr_i` | in | 7 |  |
| `rx_endp_i` | in | 4 |  |
| `rx_data_put_i` | in | 1 |  |
| `rx_data_i` | in | 8 |  |
| `tx_pkt_end_i` | in | 1 |  |
| `out_ep_current_o` | out | 4 | |
| `out_ep_data_put_o` | out | 1 | |
| `out_ep_put_addr_o` | out | 5 | |
| `out_ep_data_o` | out | 8 | |
| `out_ep_newpkt_o` | out | 1 | |
| `out_ep_acked_o` | out | 1 | |
| `out_ep_rollback_o` | out | 1 | |
| `out_ep_setup_o` | out | 2 | |
| `out_data_toggle_o` | out | 2 | |
| `tx_pkt_start_o` | out | 1 | |
| `tx_pid_o` | out | 4 | |
| `event_datatog_out_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/usb_fs_nb_out_pe.sv 00_defines.v pkg/00_usb_consts_pkg.sv prim_assert.sv prim_flop_macros.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
