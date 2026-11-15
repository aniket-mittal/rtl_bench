module NV_NVDLA_SDP_CORE_Y_idx_core_chn_lut_out_rsci_chn_lut_out_wait_ctrl (
  nvdla_core_clk, nvdla_core_rstn, chn_lut_out_rsci_oswt, core_wen, core_wten, chn_lut_out_rsci_iswt0,
      chn_lut_out_rsci_ld_core_psct, chn_lut_out_rsci_biwt, chn_lut_out_rsci_bdwt,
      chn_lut_out_rsci_ld_core_sct, chn_lut_out_rsci_vd
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_lut_out_rsci_oswt;
  input core_wen;
  input core_wten;
  input chn_lut_out_rsci_iswt0;
  input chn_lut_out_rsci_ld_core_psct;
  output chn_lut_out_rsci_biwt;
  output chn_lut_out_rsci_bdwt;
  output chn_lut_out_rsci_ld_core_sct;
  input chn_lut_out_rsci_vd;


  // Interconnect Declarations
  wire chn_lut_out_rsci_ogwt;
  wire chn_lut_out_rsci_pdswt0;
  reg chn_lut_out_rsci_icwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_lut_out_rsci_pdswt0 = (~ core_wten) & chn_lut_out_rsci_iswt0;
  assign chn_lut_out_rsci_biwt = chn_lut_out_rsci_ogwt & chn_lut_out_rsci_vd;
  assign chn_lut_out_rsci_ogwt = chn_lut_out_rsci_pdswt0 | chn_lut_out_rsci_icwt;
  assign chn_lut_out_rsci_bdwt = chn_lut_out_rsci_oswt & core_wen;
  assign chn_lut_out_rsci_ld_core_sct = chn_lut_out_rsci_ld_core_psct & chn_lut_out_rsci_ogwt;
  [MASKED]
endmodule