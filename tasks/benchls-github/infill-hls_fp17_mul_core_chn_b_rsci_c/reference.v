module HLS_fp17_mul_core_chn_b_rsci_chn_b_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, chn_b_rsci_oswt, chn_b_rsci_bawt, chn_b_rsci_wen_comp,
      chn_b_rsci_d_mxwt, chn_b_rsci_biwt, chn_b_rsci_bdwt, chn_b_rsci_d
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_b_rsci_oswt;
  output chn_b_rsci_bawt;
  output chn_b_rsci_wen_comp;
  output [16:0] chn_b_rsci_d_mxwt;
  input chn_b_rsci_biwt;
  input chn_b_rsci_bdwt;
  input [16:0] chn_b_rsci_d;


  // Interconnect Declarations
  reg chn_b_rsci_bcwt;
  reg [16:0] chn_b_rsci_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_b_rsci_bawt = chn_b_rsci_biwt | chn_b_rsci_bcwt;
  assign chn_b_rsci_wen_comp = (~ chn_b_rsci_oswt) | chn_b_rsci_bawt;
  assign chn_b_rsci_d_mxwt = MUX_v_17_2_2(chn_b_rsci_d, chn_b_rsci_d_bfwt, chn_b_rsci_bcwt);
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_b_rsci_bcwt <= 1'b0;
      chn_b_rsci_d_bfwt <= 17'b0;
    end
    else begin
      chn_b_rsci_bcwt <= ~((~(chn_b_rsci_bcwt | chn_b_rsci_biwt)) | chn_b_rsci_bdwt);
      chn_b_rsci_d_bfwt <= chn_b_rsci_d_mxwt;
    end
  end

  function [16:0] MUX_v_17_2_2;
    input [16:0] input_0;
    input [16:0] input_1;
    input [0:0] sel;
    reg [16:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_17_2_2 = result;
  end
  endfunction

endmodule