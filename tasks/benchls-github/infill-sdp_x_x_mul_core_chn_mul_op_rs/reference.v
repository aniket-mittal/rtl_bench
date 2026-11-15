module SDP_X_X_mul_core_chn_mul_op_rsci_chn_mul_op_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, chn_mul_op_rsci_oswt, chn_mul_op_rsci_bawt, chn_mul_op_rsci_wen_comp,
      chn_mul_op_rsci_d_mxwt, chn_mul_op_rsci_biwt, chn_mul_op_rsci_bdwt, chn_mul_op_rsci_d
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_mul_op_rsci_oswt;
  output chn_mul_op_rsci_bawt;
  output chn_mul_op_rsci_wen_comp;
  output [255:0] chn_mul_op_rsci_d_mxwt;
  input chn_mul_op_rsci_biwt;
  input chn_mul_op_rsci_bdwt;
  input [255:0] chn_mul_op_rsci_d;


  // Interconnect Declarations
  reg chn_mul_op_rsci_bcwt;
  reg [255:0] chn_mul_op_rsci_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_mul_op_rsci_bawt = chn_mul_op_rsci_biwt | chn_mul_op_rsci_bcwt;
  assign chn_mul_op_rsci_wen_comp = (~ chn_mul_op_rsci_oswt) | chn_mul_op_rsci_bawt;
  assign chn_mul_op_rsci_d_mxwt = MUX_v_256_2_2(chn_mul_op_rsci_d, chn_mul_op_rsci_d_bfwt,
      chn_mul_op_rsci_bcwt);
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_mul_op_rsci_bcwt <= 1'b0;
      chn_mul_op_rsci_d_bfwt <= 256'b0;
    end
    else begin
      chn_mul_op_rsci_bcwt <= ~((~(chn_mul_op_rsci_bcwt | chn_mul_op_rsci_biwt))
          | chn_mul_op_rsci_bdwt);
      chn_mul_op_rsci_d_bfwt <= chn_mul_op_rsci_d_mxwt;
    end
  end

  function [255:0] MUX_v_256_2_2;
    input [255:0] input_0;
    input [255:0] input_1;
    input [0:0] sel;
    reg [255:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_256_2_2 = result;
  end
  endfunction

endmodule