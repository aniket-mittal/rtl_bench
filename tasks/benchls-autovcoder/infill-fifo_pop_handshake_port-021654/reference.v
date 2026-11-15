module autovcoder_021654 (
    clk,
    rst,
    input_port_PopNB_mioi_idat_mxwt,
    input_port_PopNB_mioi_ivld_mxwt,
    input_port_PopNB_mioi_biwt,
    input_port_PopNB_mioi_bdwt,
    input_port_PopNB_mioi_idat,
    input_port_PopNB_mioi_ivld
);
  input clk;
  input rst;
  output [136:0] input_port_PopNB_mioi_idat_mxwt;
  output input_port_PopNB_mioi_ivld_mxwt;
  input input_port_PopNB_mioi_biwt;
  input input_port_PopNB_mioi_bdwt;
  input [137:0] input_port_PopNB_mioi_idat;
  input input_port_PopNB_mioi_ivld;


  // Interconnect Declarations
  reg input_port_PopNB_mioi_bcwt;
  reg [137:0] input_port_PopNB_mioi_idat_bfwt;
  reg input_port_PopNB_mioi_ivld_bfwt;
  wire [137:0] input_port_PopNB_mioi_idat_mxwt_pconst;


  // Interconnect Declarations for Component Instantiations 
  assign input_port_PopNB_mioi_idat_mxwt_pconst = MUX_v_138_2_2(
      input_port_PopNB_mioi_idat, input_port_PopNB_mioi_idat_bfwt, input_port_PopNB_mioi_bcwt
  );
  assign input_port_PopNB_mioi_ivld_mxwt = MUX_s_1_2_2(
      input_port_PopNB_mioi_ivld, input_port_PopNB_mioi_ivld_bfwt, input_port_PopNB_mioi_bcwt
  );
  assign input_port_PopNB_mioi_idat_mxwt = {
    (input_port_PopNB_mioi_idat_mxwt_pconst[137:130])
    , (input_port_PopNB_mioi_idat_mxwt_pconst[128:0])
  };
  always @(posedge clk) begin
    if (~rst) begin
      input_port_PopNB_mioi_bcwt <= 1'b0;
    end else begin
      input_port_PopNB_mioi_bcwt <= ~((~(input_port_PopNB_mioi_bcwt | input_port_PopNB_mioi_biwt))
          | input_port_PopNB_mioi_bdwt);
    end
  end
  always @(posedge clk) begin
    if (~rst) begin
      input_port_PopNB_mioi_idat_bfwt <= 138'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      input_port_PopNB_mioi_ivld_bfwt <= 1'b0;
    end else if (input_port_PopNB_mioi_biwt) begin
      input_port_PopNB_mioi_idat_bfwt <= input_port_PopNB_mioi_idat;
      input_port_PopNB_mioi_ivld_bfwt <= input_port_PopNB_mioi_ivld;
    end
  end

  function automatic MUX_s_1_2_2;
    input input_0;
    input input_1;
    input sel;
    reg result;
    begin
      case (sel)
        1'b0: begin
          result = input_0;
        end
        default: begin
          result = input_1;
        end
      endcase
      MUX_s_1_2_2 = result;
    end
  endfunction


  function automatic [137:0] MUX_v_138_2_2;
    input [137:0] input_0;
    input [137:0] input_1;
    input sel;
    reg [137:0] result;
    begin
      case (sel)
        1'b0: begin
          result = input_0;
        end
        default: begin
          result = input_1;
        end
      endcase
      MUX_v_138_2_2 = result;
    end
  endfunction

endmodule

