module NV_NVDLA_SDP_CORE_Y_idx_core_chn_lut_out_rsci_chn_lut_out_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, chn_lut_out_rsci_oswt, chn_lut_out_rsci_bawt,
      chn_lut_out_rsci_wen_comp, chn_lut_out_rsci_biwt, chn_lut_out_rsci_bdwt
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_lut_out_rsci_oswt;
  output chn_lut_out_rsci_bawt;
  output chn_lut_out_rsci_wen_comp;
  input chn_lut_out_rsci_biwt;
  input chn_lut_out_rsci_bdwt;


  // Interconnect Declarations
  reg chn_lut_out_rsci_bcwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_lut_out_rsci_bawt = chn_lut_out_rsci_biwt | chn_lut_out_rsci_bcwt;
  assign chn_lut_out_rsci_wen_comp = (~ chn_lut_out_rsci_oswt) | chn_lut_out_rsci_bawt;
  [MASKED]
endmodule