module HLS_fp32_add_core_chn_b_rsci_chn_b_wait_ctrl (
  nvdla_core_clk, nvdla_core_rstn, chn_b_rsci_oswt, core_wen, core_wten, chn_b_rsci_iswt0,
      chn_b_rsci_ld_core_psct, chn_b_rsci_biwt, chn_b_rsci_bdwt, chn_b_rsci_ld_core_sct,
      chn_b_rsci_vd
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_b_rsci_oswt;
  input core_wen;
  input core_wten;
  input chn_b_rsci_iswt0;
  input chn_b_rsci_ld_core_psct;
  output chn_b_rsci_biwt;
  output chn_b_rsci_bdwt;
  output chn_b_rsci_ld_core_sct;
  input chn_b_rsci_vd;


  // Interconnect Declarations
  wire chn_b_rsci_ogwt;
  wire chn_b_rsci_pdswt0;
  reg chn_b_rsci_icwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_b_rsci_pdswt0 = (~ core_wten) & chn_b_rsci_iswt0;
  assign chn_b_rsci_biwt = chn_b_rsci_ogwt & chn_b_rsci_vd;
  assign chn_b_rsci_ogwt = chn_b_rsci_pdswt0 | chn_b_rsci_icwt;
  assign chn_b_rsci_bdwt = chn_b_rsci_oswt & core_wen;
  assign chn_b_rsci_ld_core_sct = chn_b_rsci_ld_core_psct & chn_b_rsci_ogwt;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_b_rsci_icwt <= 1'b0;
    end
    else begin
      chn_b_rsci_icwt <= ~((~(chn_b_rsci_icwt | chn_b_rsci_pdswt0)) | chn_b_rsci_biwt);
    end
  end
endmodule