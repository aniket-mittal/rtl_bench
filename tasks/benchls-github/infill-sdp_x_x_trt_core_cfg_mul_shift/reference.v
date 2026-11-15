module SDP_X_X_trt_core_cfg_mul_shift_value_rsc_triosy_obj_cfg_mul_shift_value_rsc_triosy_wait_ctrl
    (
  cfg_mul_shift_value_rsc_triosy_obj_oswt, core_wen, core_wten, cfg_mul_shift_value_rsc_triosy_obj_iswt0,
      cfg_mul_shift_value_rsc_triosy_obj_biwt, cfg_mul_shift_value_rsc_triosy_obj_bdwt
);
  input cfg_mul_shift_value_rsc_triosy_obj_oswt;
  input core_wen;
  input core_wten;
  input cfg_mul_shift_value_rsc_triosy_obj_iswt0;
  output cfg_mul_shift_value_rsc_triosy_obj_biwt;
  output cfg_mul_shift_value_rsc_triosy_obj_bdwt;



  // Interconnect Declarations for Component Instantiations 
  assign cfg_mul_shift_value_rsc_triosy_obj_biwt = (~ core_wten) & cfg_mul_shift_value_rsc_triosy_obj_iswt0;
  assign cfg_mul_shift_value_rsc_triosy_obj_bdwt = cfg_mul_shift_value_rsc_triosy_obj_oswt
      & core_wen;
endmodule