module HLS_cdp_icvt_core_staller (
  nvdla_core_clk, nvdla_core_rstn, core_wen, chn_data_in_rsci_wen_comp, core_wten,
      chn_data_out_rsci_wen_comp
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  output core_wen;
  input chn_data_in_rsci_wen_comp;
  output core_wten;
  reg core_wten;
  input chn_data_out_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign core_wen = chn_data_in_rsci_wen_comp & chn_data_out_rsci_wen_comp;
  [MASKED]
endmodule