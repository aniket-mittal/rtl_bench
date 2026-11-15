module NV_NVDLA_SDP_CORE_Y_inp_core_chn_inp_out_rsci_chn_inp_out_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, chn_inp_out_rsci_oswt, chn_inp_out_rsci_bawt,
      chn_inp_out_rsci_wen_comp, chn_inp_out_rsci_biwt, chn_inp_out_rsci_bdwt
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_inp_out_rsci_oswt;
  output chn_inp_out_rsci_bawt;
  output chn_inp_out_rsci_wen_comp;
  input chn_inp_out_rsci_biwt;
  input chn_inp_out_rsci_bdwt;


  // Interconnect Declarations
  reg chn_inp_out_rsci_bcwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_inp_out_rsci_bawt = chn_inp_out_rsci_biwt | chn_inp_out_rsci_bcwt;
  assign chn_inp_out_rsci_wen_comp = (~ chn_inp_out_rsci_oswt) | chn_inp_out_rsci_bawt;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_inp_out_rsci_bcwt <= 1'b0;
    end
    else begin
      chn_inp_out_rsci_bcwt <= ~((~(chn_inp_out_rsci_bcwt | chn_inp_out_rsci_biwt))
          | chn_inp_out_rsci_bdwt);
    end
  end
endmodule