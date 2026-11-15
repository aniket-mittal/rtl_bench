# Fill in the masked region of `pcie_ptile_cfg`

The file `pcie_ptile_cfg.v` holds a Verilog design whose top module is `pcie_ptile_cfg` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `pcie_ptile_cfg`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-5.corundum.

## Rules

- Edit only `pcie_ptile_cfg.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `pcie_ptile_cfg` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `pcie_ptile_cfg.v`. Only these files are graded.

## Interface of `pcie_ptile_cfg`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `tl_cfg_ctl` | in | 16 |  |
| `tl_cfg_add` | in | 5 |  |
| `tl_cfg_func` | in | 3 |  |
| `cfg_memory_space_en` | out | 1 | |
| `cfg_ido_cpl_en` | out | 1 | |
| `cfg_perr_en` | out | 1 | |
| `cfg_serr_en` | out | 1 | |
| `cfg_fatal_err_rpt_en` | out | 1 | |
| `cfg_nonfatal_err_rpt_en` | out | 1 | |
| `cfg_corr_err_rpt_en` | out | 1 | |
| `cfg_unsupported_req_rpt_en` | out | 1 | |
| `cfg_bus_master_en` | out | 1 | |
| `cfg_ext_tag_en` | out | 1 | |
| `cfg_max_read_request_size` | out | 3 | |
| `cfg_max_payload_size` | out | 3 | |
| `cfg_ido_request_en` | out | 1 | |
| `cfg_no_snoop_en` | out | 1 | |
| `cfg_relaxed_ordering_en` | out | 1 | |
| `cfg_device_num` | out | 5 | |
| `cfg_bus_num` | out | 8 | |
| `cfg_pm_no_soft_rst` | out | 1 | |
| `cfg_rcb_ctrl` | out | 1 | |
| `cfg_irq_disable` | out | 1 | |
| `cfg_pcie_cap_irq_msg_num` | out | 5 | |
| `cfg_sys_pwr_ctrl` | out | 1 | |
| `cfg_sys_atten_ind_ctrl` | out | 2 | |
| `cfg_sys_pwr_ind_ctrl` | out | 2 | |
| `cfg_num_vf` | out | 16 | |
| `cfg_atomic_egress_block` | out | 1 | |
| `cfg_ats_stu` | out | 5 | |
| `cfg_ats_cache_en` | out | 1 | |
| `cfg_ari_forward_en` | out | 1 | |
| `cfg_atomic_request_en` | out | 1 | |
| `cfg_tph_st_mode` | out | 3 | |
| `cfg_tph_en` | out | 2 | |
| `cfg_vf_en` | out | 1 | |
| `cfg_an_link_speed` | out | 4 | |
| `cfg_start_vf_index` | out | 11 | |
| `cfg_msi_address` | out | 64 | |
| `cfg_msi_mask` | out | 32 | |
| `cfg_send_f_err` | out | 1 | |
| `cfg_send_nf_err` | out | 1 | |
| `cfg_send_cor_err` | out | 1 | |
| `cfg_aer_irq_msg_num` | out | 5 | |
| `cfg_msi_ext_data_en` | out | 1 | |
| `cfg_msix_func_mask` | out | 1 | |
| `cfg_msix_enable` | out | 1 | |
| `cfg_multiple_msi_enable` | out | 3 | |
| `cfg_64bit_msi` | out | 1 | |
| `cfg_msi_enable` | out | 1 | |
| `cfg_msi_data` | out | 32 | |
| `cfg_aer_uncor_err_mask` | out | 32 | |
| `cfg_aer_corr_err_mask` | out | 32 | |
| `cfg_aer_uncor_err_severity` | out | 32 | |
| `cfg_acs_egress_ctrl_vec` | out | 8 | |
| `cfg_acs_func_grp_en` | out | 1 | |
| `cfg_acs_p2p_direct_tranl_en` | out | 1 | |
| `cfg_acs_egress_ctrl_en` | out | 1 | |
| `cfg_acs_up_forward_en` | out | 1 | |
| `cfg_acs_p2p_compl_redirect_en` | out | 1 | |
| `cfg_acs_p2p_req_redirect_en` | out | 1 | |
| `cfg_acs_at_blocking_en` | out | 1 | |
| `cfg_acs_validation_en` | out | 1 | |
| `cfg_10b_tag_req_en` | out | 1 | |
| `cfg_vf_10b_tag_req_en` | out | 1 | |
| `cfg_prs_response_failure` | out | 1 | |
| `cfg_prs_uprgi` | out | 1 | |
| `cfg_prs_stopped` | out | 1 | |
| `cfg_prs_reset` | out | 1 | |
| `cfg_prs_enable` | out | 1 | |
| `cfg_ari_func_grp` | out | 3 | |
| `cfg_prs_outstanding_allocation` | out | 32 | |
| `cfg_disable_ltr_clr_msg` | out | 1 | |
| `cfg_ltr_m_en` | out | 1 | |
| `cfg_fc_ph_cdts_inf` | out | 1 | |
| `cfg_fc_pd_cdts_inf` | out | 1 | |
| `cfg_fc_ch_cdts_inf` | out | 1 | |
| `cfg_fc_cd_cdts_inf` | out | 1 | |
| `cfg_end2end_tlp_pfx_blck` | out | 1 | |
| `cfg_pf_pasid_en` | out | 1 | |
| `cfg_pf_pasid_execute_perm_en` | out | 1 | |
| `cfg_pf_pasid_priv_mode_en` | out | 1 | |
| `cfg_atten_button_pressed_en` | out | 1 | |
| `cfg_cfg_pwr_fault_det_en` | out | 1 | |
| `cfg_mrl_sensor_chged_en` | out | 1 | |
| `cfg_pre_det_chged_en` | out | 1 | |
| `cfg_hp_int_en` | out | 1 | |
| `cfg_cmd_cpled_int_en` | out | 1 | |
| `cfg_dll_state_change_en` | out | 1 | |
| `cfg_hp_slot_ctrl_access` | out | 1 | |
| `cfg_br_ctrl_serren` | out | 1 | |
| `cfg_ltr_max_latency` | out | 32 | |
| `cfg_tc_enable` | out | 8 | |
| `cfg_an_link_width` | out | 6 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v pcie_ptile_cfg.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
