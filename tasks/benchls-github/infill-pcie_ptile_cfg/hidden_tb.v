// Hidden tests: 5000 cycles of seeded random inputs (seed 2037136810); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 454;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [4:0] i_2;
  reg [2:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  pcie_ptile_cfg dut (
    .clk(clk),
    .rst(i_0),
    .tl_cfg_ctl(i_1),
    .tl_cfg_add(i_2),
    .tl_cfg_func(i_3),
    .cfg_memory_space_en(out_dut[453:453]),
    .cfg_ido_cpl_en(out_dut[452:452]),
    .cfg_perr_en(out_dut[451:451]),
    .cfg_serr_en(out_dut[450:450]),
    .cfg_fatal_err_rpt_en(out_dut[449:449]),
    .cfg_nonfatal_err_rpt_en(out_dut[448:448]),
    .cfg_corr_err_rpt_en(out_dut[447:447]),
    .cfg_unsupported_req_rpt_en(out_dut[446:446]),
    .cfg_bus_master_en(out_dut[445:445]),
    .cfg_ext_tag_en(out_dut[444:444]),
    .cfg_max_read_request_size(out_dut[443:441]),
    .cfg_max_payload_size(out_dut[440:438]),
    .cfg_ido_request_en(out_dut[437:437]),
    .cfg_no_snoop_en(out_dut[436:436]),
    .cfg_relaxed_ordering_en(out_dut[435:435]),
    .cfg_device_num(out_dut[434:430]),
    .cfg_bus_num(out_dut[429:422]),
    .cfg_pm_no_soft_rst(out_dut[421:421]),
    .cfg_rcb_ctrl(out_dut[420:420]),
    .cfg_irq_disable(out_dut[419:419]),
    .cfg_pcie_cap_irq_msg_num(out_dut[418:414]),
    .cfg_sys_pwr_ctrl(out_dut[413:413]),
    .cfg_sys_atten_ind_ctrl(out_dut[412:411]),
    .cfg_sys_pwr_ind_ctrl(out_dut[410:409]),
    .cfg_num_vf(out_dut[408:393]),
    .cfg_atomic_egress_block(out_dut[392:392]),
    .cfg_ats_stu(out_dut[391:387]),
    .cfg_ats_cache_en(out_dut[386:386]),
    .cfg_ari_forward_en(out_dut[385:385]),
    .cfg_atomic_request_en(out_dut[384:384]),
    .cfg_tph_st_mode(out_dut[383:381]),
    .cfg_tph_en(out_dut[380:379]),
    .cfg_vf_en(out_dut[378:378]),
    .cfg_an_link_speed(out_dut[377:374]),
    .cfg_start_vf_index(out_dut[373:363]),
    .cfg_msi_address(out_dut[362:299]),
    .cfg_msi_mask(out_dut[298:267]),
    .cfg_send_f_err(out_dut[266:266]),
    .cfg_send_nf_err(out_dut[265:265]),
    .cfg_send_cor_err(out_dut[264:264]),
    .cfg_aer_irq_msg_num(out_dut[263:259]),
    .cfg_msi_ext_data_en(out_dut[258:258]),
    .cfg_msix_func_mask(out_dut[257:257]),
    .cfg_msix_enable(out_dut[256:256]),
    .cfg_multiple_msi_enable(out_dut[255:253]),
    .cfg_64bit_msi(out_dut[252:252]),
    .cfg_msi_enable(out_dut[251:251]),
    .cfg_msi_data(out_dut[250:219]),
    .cfg_aer_uncor_err_mask(out_dut[218:187]),
    .cfg_aer_corr_err_mask(out_dut[186:155]),
    .cfg_aer_uncor_err_severity(out_dut[154:123]),
    .cfg_acs_egress_ctrl_vec(out_dut[122:115]),
    .cfg_acs_func_grp_en(out_dut[114:114]),
    .cfg_acs_p2p_direct_tranl_en(out_dut[113:113]),
    .cfg_acs_egress_ctrl_en(out_dut[112:112]),
    .cfg_acs_up_forward_en(out_dut[111:111]),
    .cfg_acs_p2p_compl_redirect_en(out_dut[110:110]),
    .cfg_acs_p2p_req_redirect_en(out_dut[109:109]),
    .cfg_acs_at_blocking_en(out_dut[108:108]),
    .cfg_acs_validation_en(out_dut[107:107]),
    .cfg_10b_tag_req_en(out_dut[106:106]),
    .cfg_vf_10b_tag_req_en(out_dut[105:105]),
    .cfg_prs_response_failure(out_dut[104:104]),
    .cfg_prs_uprgi(out_dut[103:103]),
    .cfg_prs_stopped(out_dut[102:102]),
    .cfg_prs_reset(out_dut[101:101]),
    .cfg_prs_enable(out_dut[100:100]),
    .cfg_ari_func_grp(out_dut[99:97]),
    .cfg_prs_outstanding_allocation(out_dut[96:65]),
    .cfg_disable_ltr_clr_msg(out_dut[64:64]),
    .cfg_ltr_m_en(out_dut[63:63]),
    .cfg_fc_ph_cdts_inf(out_dut[62:62]),
    .cfg_fc_pd_cdts_inf(out_dut[61:61]),
    .cfg_fc_ch_cdts_inf(out_dut[60:60]),
    .cfg_fc_cd_cdts_inf(out_dut[59:59]),
    .cfg_end2end_tlp_pfx_blck(out_dut[58:58]),
    .cfg_pf_pasid_en(out_dut[57:57]),
    .cfg_pf_pasid_execute_perm_en(out_dut[56:56]),
    .cfg_pf_pasid_priv_mode_en(out_dut[55:55]),
    .cfg_atten_button_pressed_en(out_dut[54:54]),
    .cfg_cfg_pwr_fault_det_en(out_dut[53:53]),
    .cfg_mrl_sensor_chged_en(out_dut[52:52]),
    .cfg_pre_det_chged_en(out_dut[51:51]),
    .cfg_hp_int_en(out_dut[50:50]),
    .cfg_cmd_cpled_int_en(out_dut[49:49]),
    .cfg_dll_state_change_en(out_dut[48:48]),
    .cfg_hp_slot_ctrl_access(out_dut[47:47]),
    .cfg_br_ctrl_serren(out_dut[46:46]),
    .cfg_ltr_max_latency(out_dut[45:14]),
    .cfg_tc_enable(out_dut[13:6]),
    .cfg_an_link_width(out_dut[5:0])
  );
  pcie_ptile_cfg__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .tl_cfg_ctl(i_1),
    .tl_cfg_add(i_2),
    .tl_cfg_func(i_3),
    .cfg_memory_space_en(out_ref[453:453]),
    .cfg_ido_cpl_en(out_ref[452:452]),
    .cfg_perr_en(out_ref[451:451]),
    .cfg_serr_en(out_ref[450:450]),
    .cfg_fatal_err_rpt_en(out_ref[449:449]),
    .cfg_nonfatal_err_rpt_en(out_ref[448:448]),
    .cfg_corr_err_rpt_en(out_ref[447:447]),
    .cfg_unsupported_req_rpt_en(out_ref[446:446]),
    .cfg_bus_master_en(out_ref[445:445]),
    .cfg_ext_tag_en(out_ref[444:444]),
    .cfg_max_read_request_size(out_ref[443:441]),
    .cfg_max_payload_size(out_ref[440:438]),
    .cfg_ido_request_en(out_ref[437:437]),
    .cfg_no_snoop_en(out_ref[436:436]),
    .cfg_relaxed_ordering_en(out_ref[435:435]),
    .cfg_device_num(out_ref[434:430]),
    .cfg_bus_num(out_ref[429:422]),
    .cfg_pm_no_soft_rst(out_ref[421:421]),
    .cfg_rcb_ctrl(out_ref[420:420]),
    .cfg_irq_disable(out_ref[419:419]),
    .cfg_pcie_cap_irq_msg_num(out_ref[418:414]),
    .cfg_sys_pwr_ctrl(out_ref[413:413]),
    .cfg_sys_atten_ind_ctrl(out_ref[412:411]),
    .cfg_sys_pwr_ind_ctrl(out_ref[410:409]),
    .cfg_num_vf(out_ref[408:393]),
    .cfg_atomic_egress_block(out_ref[392:392]),
    .cfg_ats_stu(out_ref[391:387]),
    .cfg_ats_cache_en(out_ref[386:386]),
    .cfg_ari_forward_en(out_ref[385:385]),
    .cfg_atomic_request_en(out_ref[384:384]),
    .cfg_tph_st_mode(out_ref[383:381]),
    .cfg_tph_en(out_ref[380:379]),
    .cfg_vf_en(out_ref[378:378]),
    .cfg_an_link_speed(out_ref[377:374]),
    .cfg_start_vf_index(out_ref[373:363]),
    .cfg_msi_address(out_ref[362:299]),
    .cfg_msi_mask(out_ref[298:267]),
    .cfg_send_f_err(out_ref[266:266]),
    .cfg_send_nf_err(out_ref[265:265]),
    .cfg_send_cor_err(out_ref[264:264]),
    .cfg_aer_irq_msg_num(out_ref[263:259]),
    .cfg_msi_ext_data_en(out_ref[258:258]),
    .cfg_msix_func_mask(out_ref[257:257]),
    .cfg_msix_enable(out_ref[256:256]),
    .cfg_multiple_msi_enable(out_ref[255:253]),
    .cfg_64bit_msi(out_ref[252:252]),
    .cfg_msi_enable(out_ref[251:251]),
    .cfg_msi_data(out_ref[250:219]),
    .cfg_aer_uncor_err_mask(out_ref[218:187]),
    .cfg_aer_corr_err_mask(out_ref[186:155]),
    .cfg_aer_uncor_err_severity(out_ref[154:123]),
    .cfg_acs_egress_ctrl_vec(out_ref[122:115]),
    .cfg_acs_func_grp_en(out_ref[114:114]),
    .cfg_acs_p2p_direct_tranl_en(out_ref[113:113]),
    .cfg_acs_egress_ctrl_en(out_ref[112:112]),
    .cfg_acs_up_forward_en(out_ref[111:111]),
    .cfg_acs_p2p_compl_redirect_en(out_ref[110:110]),
    .cfg_acs_p2p_req_redirect_en(out_ref[109:109]),
    .cfg_acs_at_blocking_en(out_ref[108:108]),
    .cfg_acs_validation_en(out_ref[107:107]),
    .cfg_10b_tag_req_en(out_ref[106:106]),
    .cfg_vf_10b_tag_req_en(out_ref[105:105]),
    .cfg_prs_response_failure(out_ref[104:104]),
    .cfg_prs_uprgi(out_ref[103:103]),
    .cfg_prs_stopped(out_ref[102:102]),
    .cfg_prs_reset(out_ref[101:101]),
    .cfg_prs_enable(out_ref[100:100]),
    .cfg_ari_func_grp(out_ref[99:97]),
    .cfg_prs_outstanding_allocation(out_ref[96:65]),
    .cfg_disable_ltr_clr_msg(out_ref[64:64]),
    .cfg_ltr_m_en(out_ref[63:63]),
    .cfg_fc_ph_cdts_inf(out_ref[62:62]),
    .cfg_fc_pd_cdts_inf(out_ref[61:61]),
    .cfg_fc_ch_cdts_inf(out_ref[60:60]),
    .cfg_fc_cd_cdts_inf(out_ref[59:59]),
    .cfg_end2end_tlp_pfx_blck(out_ref[58:58]),
    .cfg_pf_pasid_en(out_ref[57:57]),
    .cfg_pf_pasid_execute_perm_en(out_ref[56:56]),
    .cfg_pf_pasid_priv_mode_en(out_ref[55:55]),
    .cfg_atten_button_pressed_en(out_ref[54:54]),
    .cfg_cfg_pwr_fault_det_en(out_ref[53:53]),
    .cfg_mrl_sensor_chged_en(out_ref[52:52]),
    .cfg_pre_det_chged_en(out_ref[51:51]),
    .cfg_hp_int_en(out_ref[50:50]),
    .cfg_cmd_cpled_int_en(out_ref[49:49]),
    .cfg_dll_state_change_en(out_ref[48:48]),
    .cfg_hp_slot_ctrl_access(out_ref[47:47]),
    .cfg_br_ctrl_serren(out_ref[46:46]),
    .cfg_ltr_max_latency(out_ref[45:14]),
    .cfg_tc_enable(out_ref[13:6]),
    .cfg_an_link_width(out_ref[5:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 2037136810;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
