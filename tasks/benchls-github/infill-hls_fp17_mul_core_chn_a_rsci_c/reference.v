module HLS_fp17_mul_core_chn_a_rsci_chn_a_wait_ctrl (
  nvdla_core_clk, nvdla_core_rstn, chn_a_rsci_oswt, core_wen, chn_a_rsci_iswt0, chn_a_rsci_ld_core_psct,
      core_wten, chn_a_rsci_biwt, chn_a_rsci_bdwt, chn_a_rsci_ld_core_sct, chn_a_rsci_vd
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_a_rsci_oswt;
  input core_wen;
  input chn_a_rsci_iswt0;
  input chn_a_rsci_ld_core_psct;
  input core_wten;
  output chn_a_rsci_biwt;
  output chn_a_rsci_bdwt;
  output chn_a_rsci_ld_core_sct;
  input chn_a_rsci_vd;


  // Interconnect Declarations
  wire chn_a_rsci_ogwt;
  wire chn_a_rsci_pdswt0;
  reg chn_a_rsci_icwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_a_rsci_pdswt0 = (~ core_wten) & chn_a_rsci_iswt0;
  assign chn_a_rsci_biwt = chn_a_rsci_ogwt & chn_a_rsci_vd;
  assign chn_a_rsci_ogwt = chn_a_rsci_pdswt0 | chn_a_rsci_icwt;
  assign chn_a_rsci_bdwt = chn_a_rsci_oswt & core_wen;
  assign chn_a_rsci_ld_core_sct = chn_a_rsci_ld_core_psct & chn_a_rsci_ogwt;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_a_rsci_icwt <= 1'b0;
    end
    else begin
      chn_a_rsci_icwt <= ~((~(chn_a_rsci_icwt | chn_a_rsci_pdswt0)) | chn_a_rsci_biwt);
    end
  end
endmodule