module SDP_Y_CORE_Y_mul_core_cfg_mul_op_rsc_triosy_obj_cfg_mul_op_rsc_triosy_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, cfg_mul_op_rsc_triosy_obj_bawt, cfg_mul_op_rsc_triosy_obj_biwt,
      cfg_mul_op_rsc_triosy_obj_bdwt
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  output cfg_mul_op_rsc_triosy_obj_bawt;
  input cfg_mul_op_rsc_triosy_obj_biwt;
  input cfg_mul_op_rsc_triosy_obj_bdwt;


  // Interconnect Declarations
  reg cfg_mul_op_rsc_triosy_obj_bcwt;


  // Interconnect Declarations for Component Instantiations 
  assign cfg_mul_op_rsc_triosy_obj_bawt = cfg_mul_op_rsc_triosy_obj_biwt | cfg_mul_op_rsc_triosy_obj_bcwt;
  [MASKED]
endmodule