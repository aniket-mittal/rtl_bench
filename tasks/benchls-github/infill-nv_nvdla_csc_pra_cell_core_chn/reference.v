module NV_NVDLA_CSC_pra_cell_core_chn_data_in_rsci_chn_data_in_wait_dp (
  nvdla_core_clk, nvdla_core_rstn, chn_data_in_rsci_oswt, chn_data_in_rsci_bawt,
      chn_data_in_rsci_wen_comp, chn_data_in_rsci_d_mxwt, chn_data_in_rsci_biwt,
      chn_data_in_rsci_bdwt, chn_data_in_rsci_d
);
  input nvdla_core_clk;
  input nvdla_core_rstn;
  input chn_data_in_rsci_oswt;
  output chn_data_in_rsci_bawt;
  output chn_data_in_rsci_wen_comp;
  output [255:0] chn_data_in_rsci_d_mxwt;
  input chn_data_in_rsci_biwt;
  input chn_data_in_rsci_bdwt;
  input [255:0] chn_data_in_rsci_d;


  // Interconnect Declarations
  reg chn_data_in_rsci_bcwt;
  reg [255:0] chn_data_in_rsci_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign chn_data_in_rsci_bawt = chn_data_in_rsci_biwt | chn_data_in_rsci_bcwt;
  assign chn_data_in_rsci_wen_comp = (~ chn_data_in_rsci_oswt) | chn_data_in_rsci_bawt;
  assign chn_data_in_rsci_d_mxwt = MUX_v_256_2_2(chn_data_in_rsci_d, chn_data_in_rsci_d_bfwt,
      chn_data_in_rsci_bcwt);
  always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if ( ~ nvdla_core_rstn ) begin
      chn_data_in_rsci_bcwt <= 1'b0;
      chn_data_in_rsci_d_bfwt <= 256'b0;
    end
    else begin
      chn_data_in_rsci_bcwt <= ~((~(chn_data_in_rsci_bcwt | chn_data_in_rsci_biwt))
          | chn_data_in_rsci_bdwt);
      chn_data_in_rsci_d_bfwt <= chn_data_in_rsci_d_mxwt;
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