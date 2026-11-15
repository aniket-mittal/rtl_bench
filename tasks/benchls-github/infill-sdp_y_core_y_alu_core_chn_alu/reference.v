module SDP_Y_CORE_Y_alu_core_chn_alu_in_rsci_chn_alu_in_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, chn_alu_in_rsci_oswt, chn_alu_in_rsci_bawt, chn_alu_in_rsci_wen_comp,
      chn_alu_in_rsci_d_mxwt, chn_alu_in_rsci_biwt, chn_alu_in_rsci_bdwt, chn_alu_in_rsci_d
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_alu_in_rsci_oswt;
  output chn_alu_in_rsci_bawt;
  output chn_alu_in_rsci_wen_comp;
  output [127:0] chn_alu_in_rsci_d_mxwt;
  input chn_alu_in_rsci_biwt;
  input chn_alu_in_rsci_bdwt;
  input [127:0] chn_alu_in_rsci_d;


  // Interconnect Declarations
  reg chn_alu_in_rsci_bcwt;
  reg [127:0] chn_alu_in_rsci_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_alu_in_rsci_bawt = chn_alu_in_rsci_biwt | chn_alu_in_rsci_bcwt;
  assign chn_alu_in_rsci_wen_comp = (~ chn_alu_in_rsci_oswt) | chn_alu_in_rsci_bawt;
  assign chn_alu_in_rsci_d_mxwt = MUX_v_128_2_2(chn_alu_in_rsci_d, chn_alu_in_rsci_d_bfwt,
      chn_alu_in_rsci_bcwt);
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_alu_in_rsci_bcwt <= 1'b0;
      chn_alu_in_rsci_d_bfwt <= 128'b0;
    end
    else begin
      chn_alu_in_rsci_bcwt <= ~((~(chn_alu_in_rsci_bcwt | chn_alu_in_rsci_biwt))
          | chn_alu_in_rsci_bdwt);
      chn_alu_in_rsci_d_bfwt <= chn_alu_in_rsci_d_mxwt;
    end
  end

  function [127:0] MUX_v_128_2_2;
    input [127:0] input_0;
    input [127:0] input_1;
    input [0:0] sel;
    reg [127:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_128_2_2 = result;
  end
  endfunction

endmodule