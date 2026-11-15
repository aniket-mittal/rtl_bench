module SDP_Y_CORE_Y_mul_core_cfg_mul_prelu_rsc_triosy_obj_cfg_mul_prelu_rsc_triosy_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, cfg_mul_prelu_rsc_triosy_obj_bawt, cfg_mul_prelu_rsc_triosy_obj_biwt,
      cfg_mul_prelu_rsc_triosy_obj_bdwt
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  output cfg_mul_prelu_rsc_triosy_obj_bawt;
  input cfg_mul_prelu_rsc_triosy_obj_biwt;
  input cfg_mul_prelu_rsc_triosy_obj_bdwt;


  // Interconnect Declarations
  reg cfg_mul_prelu_rsc_triosy_obj_bcwt;


  // Interconnect Declarations for Component Instantiations 
  assign cfg_mul_prelu_rsc_triosy_obj_bawt = cfg_mul_prelu_rsc_triosy_obj_biwt |
      cfg_mul_prelu_rsc_triosy_obj_bcwt;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      cfg_mul_prelu_rsc_triosy_obj_bcwt <= 1'b0;
    end
    else begin
      cfg_mul_prelu_rsc_triosy_obj_bcwt <= ~((~(cfg_mul_prelu_rsc_triosy_obj_bcwt
          | cfg_mul_prelu_rsc_triosy_obj_biwt)) | cfg_mul_prelu_rsc_triosy_obj_bdwt);
    end
  end
endmodule