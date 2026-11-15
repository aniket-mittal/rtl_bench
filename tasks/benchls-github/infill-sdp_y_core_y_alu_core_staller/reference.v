module SDP_Y_CORE_Y_alu_core_staller (
  nvdla_core_clk, nvdla_core_rstn, core_wen, chn_alu_in_rsci_wen_comp, core_wten,
      chn_alu_op_rsci_wen_comp, chn_alu_out_rsci_wen_comp
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  output core_wen;
  input chn_alu_in_rsci_wen_comp;
  output core_wten;
  reg core_wten;
  input chn_alu_op_rsci_wen_comp;
  input chn_alu_out_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign core_wen = chn_alu_in_rsci_wen_comp & chn_alu_op_rsci_wen_comp & chn_alu_out_rsci_wen_comp;
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      core_wten <= 1'b0;
    end
    else begin
      core_wten <= ~ core_wen;
    end
  end
endmodule