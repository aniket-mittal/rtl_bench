module SDP_X_X_mul_core_chn_mul_in_rsci_chn_mul_in_wait_ctrl (
  nvdla_core_clk, nvdla_core_rstn, chn_mul_in_rsci_oswt, core_wen, chn_mul_in_rsci_iswt0,
      chn_mul_in_rsci_ld_core_psct, core_wten, chn_mul_in_rsci_biwt, chn_mul_in_rsci_bdwt,
      chn_mul_in_rsci_ld_core_sct, chn_mul_in_rsci_vd
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_mul_in_rsci_oswt;
  input core_wen;
  input chn_mul_in_rsci_iswt0;
  input chn_mul_in_rsci_ld_core_psct;
  input core_wten;
  output chn_mul_in_rsci_biwt;
  output chn_mul_in_rsci_bdwt;
  output chn_mul_in_rsci_ld_core_sct;
  input chn_mul_in_rsci_vd;


  // Interconnect Declarations
  wire chn_mul_in_rsci_ogwt;
  wire chn_mul_in_rsci_pdswt0;
  reg chn_mul_in_rsci_icwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_mul_in_rsci_pdswt0 = (~ core_wten) & chn_mul_in_rsci_iswt0;
  assign chn_mul_in_rsci_biwt = chn_mul_in_rsci_ogwt & chn_mul_in_rsci_vd;
  assign chn_mul_in_rsci_ogwt = chn_mul_in_rsci_pdswt0 | chn_mul_in_rsci_icwt;
  assign chn_mul_in_rsci_bdwt = chn_mul_in_rsci_oswt & core_wen;
  assign chn_mul_in_rsci_ld_core_sct = chn_mul_in_rsci_ld_core_psct & chn_mul_in_rsci_ogwt;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_mul_in_rsci_icwt <= 1'b0;
    end
    else begin
      chn_mul_in_rsci_icwt <= ~((~(chn_mul_in_rsci_icwt | chn_mul_in_rsci_pdswt0))
          | chn_mul_in_rsci_biwt);
    end
  end
endmodule