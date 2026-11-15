module SDP_X_X_alu_core_chn_alu_out_rsci_chn_alu_out_wait_ctrl (
  nvdla_core_clk, nvdla_core_rstn, chn_alu_out_rsci_oswt, core_wen, core_wten, chn_alu_out_rsci_iswt0,
      chn_alu_out_rsci_ld_core_psct, chn_alu_out_rsci_biwt, chn_alu_out_rsci_bdwt,
      chn_alu_out_rsci_ld_core_sct, chn_alu_out_rsci_vd
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_alu_out_rsci_oswt;
  input core_wen;
  input core_wten;
  input chn_alu_out_rsci_iswt0;
  input chn_alu_out_rsci_ld_core_psct;
  output chn_alu_out_rsci_biwt;
  output chn_alu_out_rsci_bdwt;
  output chn_alu_out_rsci_ld_core_sct;
  input chn_alu_out_rsci_vd;


  // Interconnect Declarations
  wire chn_alu_out_rsci_ogwt;
  wire chn_alu_out_rsci_pdswt0;
  reg chn_alu_out_rsci_icwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_alu_out_rsci_pdswt0 = (~ core_wten) & chn_alu_out_rsci_iswt0;
  assign chn_alu_out_rsci_biwt = chn_alu_out_rsci_ogwt & chn_alu_out_rsci_vd;
  assign chn_alu_out_rsci_ogwt = chn_alu_out_rsci_pdswt0 | chn_alu_out_rsci_icwt;
  assign chn_alu_out_rsci_bdwt = chn_alu_out_rsci_oswt & core_wen;
  assign chn_alu_out_rsci_ld_core_sct = chn_alu_out_rsci_ld_core_psct & chn_alu_out_rsci_ogwt;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_alu_out_rsci_icwt <= 1'b0;
    end
    else begin
      chn_alu_out_rsci_icwt <= ~((~(chn_alu_out_rsci_icwt | chn_alu_out_rsci_pdswt0))
          | chn_alu_out_rsci_biwt);
    end
  end
endmodule