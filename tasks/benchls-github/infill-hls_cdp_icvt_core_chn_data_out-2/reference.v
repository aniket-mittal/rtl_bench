module HLS_cdp_icvt_core_chn_data_out_rsci_chn_data_out_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, chn_data_out_rsci_oswt, chn_data_out_rsci_bawt,
      chn_data_out_rsci_wen_comp, chn_data_out_rsci_biwt, chn_data_out_rsci_bdwt
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_data_out_rsci_oswt;
  output chn_data_out_rsci_bawt;
  output chn_data_out_rsci_wen_comp;
  input chn_data_out_rsci_biwt;
  input chn_data_out_rsci_bdwt;


  // Interconnect Declarations
  reg chn_data_out_rsci_bcwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_data_out_rsci_bawt = chn_data_out_rsci_biwt | chn_data_out_rsci_bcwt;
  assign chn_data_out_rsci_wen_comp = (~ chn_data_out_rsci_oswt) | chn_data_out_rsci_bawt;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_data_out_rsci_bcwt <= 1'b0;
    end
    else begin
      chn_data_out_rsci_bcwt <= ~((~(chn_data_out_rsci_bcwt | chn_data_out_rsci_biwt))
          | chn_data_out_rsci_bdwt);
    end
  end
endmodule