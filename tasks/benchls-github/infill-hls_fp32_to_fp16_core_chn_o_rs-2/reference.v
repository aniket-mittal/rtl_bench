module HLS_fp32_to_fp16_core_chn_o_rsci_chn_o_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, chn_o_rsci_oswt, chn_o_rsci_bawt, chn_o_rsci_wen_comp,
      chn_o_rsci_biwt, chn_o_rsci_bdwt
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_o_rsci_oswt;
  output chn_o_rsci_bawt;
  output chn_o_rsci_wen_comp;
  input chn_o_rsci_biwt;
  input chn_o_rsci_bdwt;


  // Interconnect Declarations
  reg chn_o_rsci_bcwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_o_rsci_bawt = chn_o_rsci_biwt | chn_o_rsci_bcwt;
  assign chn_o_rsci_wen_comp = (~ chn_o_rsci_oswt) | chn_o_rsci_bawt;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_o_rsci_bcwt <= 1'b0;
    end
    else begin
      chn_o_rsci_bcwt <= ~((~(chn_o_rsci_bcwt | chn_o_rsci_biwt)) | chn_o_rsci_bdwt);
    end
  end
endmodule