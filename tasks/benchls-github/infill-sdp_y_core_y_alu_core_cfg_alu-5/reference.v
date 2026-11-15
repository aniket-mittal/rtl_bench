module SDP_Y_CORE_Y_alu_core_cfg_alu_src_rsc_triosy_obj_cfg_alu_src_rsc_triosy_wait_ctrl (
  cfg_alu_src_rsc_triosy_obj_oswt, core_wen, core_wten, cfg_alu_src_rsc_triosy_obj_iswt0,
      cfg_alu_src_rsc_triosy_obj_biwt, cfg_alu_src_rsc_triosy_obj_bdwt
);
  input cfg_alu_src_rsc_triosy_obj_oswt;
  input core_wen;
  input core_wten;
  input cfg_alu_src_rsc_triosy_obj_iswt0;
  output cfg_alu_src_rsc_triosy_obj_biwt;
  output cfg_alu_src_rsc_triosy_obj_bdwt;



  // Interconnect Declarations for Component Instantiations 
  assign cfg_alu_src_rsc_triosy_obj_biwt = (~ core_wten) & cfg_alu_src_rsc_triosy_obj_iswt0;
  assign cfg_alu_src_rsc_triosy_obj_bdwt = cfg_alu_src_rsc_triosy_obj_oswt & core_wen;
endmodule