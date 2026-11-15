module UINT16_TO_FP17_leading_sign_16_0 (
  mantissa, rtn
);
  input [15:0] mantissa;
  output [4:0] rtn;


  // Interconnect Declarations
  wire IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_6_2_sdt_2;
  wire IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_18_3_sdt_3;
  wire IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_26_2_sdt_2;
  wire IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_44_4_sdt_4;
  wire IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_6_2_sdt_1;
  wire IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_14_2_sdt_1;
  wire IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_26_2_sdt_1;
  wire IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_34_2_sdt_1;
  wire c_h_1_2;
  wire c_h_1_5;
  wire c_h_1_6;

  wire[3:0] IntLeadZero_16U_leading_sign_16_0_rtn_IntLeadZero_16U_leading_sign_16_0_rtn_and_nl;
  wire[0:0] IntLeadZero_16U_leading_sign_16_0_rtn_and_55_nl;
  wire[0:0] IntLeadZero_16U_leading_sign_16_0_rtn_and_53_nl;
  wire[0:0] IntLeadZero_16U_leading_sign_16_0_rtn_and_60_nl;
  wire[0:0] IntLeadZero_16U_leading_sign_16_0_rtn_not_nl;

  // Interconnect Declarations for Component Instantiations 
  assign IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_6_2_sdt_2 = ~((mantissa[13:12]!=2'b00));
  assign IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_6_2_sdt_1 = ~((mantissa[15:14]!=2'b00));
  assign IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_14_2_sdt_1 = ~((mantissa[11:10]!=2'b00));
  assign c_h_1_2 = IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_6_2_sdt_1 & IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_6_2_sdt_2;
  assign IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_18_3_sdt_3 = (mantissa[9:8]==2'b00)
      & IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_14_2_sdt_1;
  assign IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_26_2_sdt_2 = ~((mantissa[5:4]!=2'b00));
  assign IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_26_2_sdt_1 = ~((mantissa[7:6]!=2'b00));
  assign IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_34_2_sdt_1 = ~((mantissa[3:2]!=2'b00));
  assign c_h_1_5 = IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_26_2_sdt_1 & IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_26_2_sdt_2;
  assign c_h_1_6 = c_h_1_2 & IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_18_3_sdt_3;
  assign IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_44_4_sdt_4 = (mantissa[1:0]==2'b00)
      & IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_34_2_sdt_1 & c_h_1_5 & c_h_1_6;
  assign IntLeadZero_16U_leading_sign_16_0_rtn_and_55_nl = c_h_1_2 & (c_h_1_5 | (~
      IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_18_3_sdt_3));
  assign IntLeadZero_16U_leading_sign_16_0_rtn_and_53_nl = IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_6_2_sdt_1
      & (IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_14_2_sdt_1 | (~ IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_6_2_sdt_2))
      & (~((~(IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_26_2_sdt_1 & (IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_34_2_sdt_1
      | (~ IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_26_2_sdt_2)))) & c_h_1_6));
  assign IntLeadZero_16U_leading_sign_16_0_rtn_and_60_nl = (~((mantissa[15]) | (~((mantissa[14:13]!=2'b01)))))
      & (~(((mantissa[11]) | (~((mantissa[10:9]!=2'b01)))) & c_h_1_2)) & (~((~((~((mantissa[7])
      | (~((mantissa[6:5]!=2'b01))))) & (~(((mantissa[3]) | (~((mantissa[2:1]!=2'b01))))
      & c_h_1_5)))) & c_h_1_6));
  assign IntLeadZero_16U_leading_sign_16_0_rtn_not_nl = ~ IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_44_4_sdt_4;
  assign IntLeadZero_16U_leading_sign_16_0_rtn_IntLeadZero_16U_leading_sign_16_0_rtn_and_nl
      = MUX_v_4_2_2(4'b0000, ({c_h_1_6 , (IntLeadZero_16U_leading_sign_16_0_rtn_and_55_nl)
      , (IntLeadZero_16U_leading_sign_16_0_rtn_and_53_nl) , (IntLeadZero_16U_leading_sign_16_0_rtn_and_60_nl)}),
      (IntLeadZero_16U_leading_sign_16_0_rtn_not_nl));
  assign rtn = {IntLeadZero_16U_leading_sign_16_0_rtn_wrs_c_44_4_sdt_4 , (IntLeadZero_16U_leading_sign_16_0_rtn_IntLeadZero_16U_leading_sign_16_0_rtn_and_nl)};

  function [3:0] MUX_v_4_2_2;
    input [3:0] input_0;
    input [3:0] input_1;
    input [0:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_4_2_2 = result;
  end
  endfunction

endmodule