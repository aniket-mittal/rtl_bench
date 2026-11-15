module SDP_X_X_relu_core_cfg_relu_bypass_rsc_triosy_obj_cfg_relu_bypass_rsc_triosy_wait_ctrl
    (
  cfg_relu_bypass_rsc_triosy_obj_oswt, core_wen, core_wten, cfg_relu_bypass_rsc_triosy_obj_iswt0,
      cfg_relu_bypass_rsc_triosy_obj_biwt, cfg_relu_bypass_rsc_triosy_obj_bdwt
);
  input cfg_relu_bypass_rsc_triosy_obj_oswt;
  input core_wen;
  input core_wten;
  input cfg_relu_bypass_rsc_triosy_obj_iswt0;
  output cfg_relu_bypass_rsc_triosy_obj_biwt;
  output cfg_relu_bypass_rsc_triosy_obj_bdwt;



  // Interconnect Declarations for Component Instantiations 
  assign cfg_relu_bypass_rsc_triosy_obj_biwt = (~ core_wten) & cfg_relu_bypass_rsc_triosy_obj_iswt0;
  assign cfg_relu_bypass_rsc_triosy_obj_bdwt = cfg_relu_bypass_rsc_triosy_obj_oswt
      & core_wen;
endmodule