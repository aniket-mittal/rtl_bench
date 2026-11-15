module SDP_Y_INP_leading_sign_23_0 (
  mantissa, rtn
);
  input [22:0] mantissa;
  output [4:0] rtn;


  // Interconnect Declarations
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_6_2_sdt_2;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_18_3_sdt_3;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_26_2_sdt_2;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_42_4_sdt_4;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_50_2_sdt_2;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_6_2_sdt_1;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_14_2_sdt_1;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_26_2_sdt_1;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_34_2_sdt_1;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_50_2_sdt_1;
  wire IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_56_2_sdt_1;
  wire c_h_1_2;
  wire c_h_1_5;
  wire c_h_1_6;
  wire c_h_1_9;
  wire c_h_1_10;

  wire[0:0] IntLeadZero_23U_leading_sign_23_0_rtn_and_85_nl;
  wire[0:0] IntLeadZero_23U_leading_sign_23_0_rtn_and_83_nl;
  wire[0:0] IntLeadZero_23U_leading_sign_23_0_rtn_and_90_nl;
  wire[0:0] IntLeadZero_23U_leading_sign_23_0_rtn_IntLeadZero_23U_leading_sign_23_0_rtn_or_2_nl;

  // Interconnect Declarations for Component Instantiations 
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_6_2_sdt_2 = ~((mantissa[20:19]!=2'b00));
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_6_2_sdt_1 = ~((mantissa[22:21]!=2'b00));
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_14_2_sdt_1 = ~((mantissa[18:17]!=2'b00));
  assign c_h_1_2 = IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_6_2_sdt_1 & IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_6_2_sdt_2;
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_18_3_sdt_3 = (mantissa[16:15]==2'b00)
      & IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_14_2_sdt_1;
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_26_2_sdt_2 = ~((mantissa[12:11]!=2'b00));
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_26_2_sdt_1 = ~((mantissa[14:13]!=2'b00));
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_34_2_sdt_1 = ~((mantissa[10:9]!=2'b00));
  assign c_h_1_5 = IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_26_2_sdt_1 & IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_26_2_sdt_2;
  assign c_h_1_6 = c_h_1_2 & IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_18_3_sdt_3;
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_42_4_sdt_4 = (mantissa[8:7]==2'b00)
      & IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_34_2_sdt_1 & c_h_1_5;
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_50_2_sdt_2 = ~((mantissa[4:3]!=2'b00));
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_50_2_sdt_1 = ~((mantissa[6:5]!=2'b00));
  assign IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_56_2_sdt_1 = ~((mantissa[2:1]!=2'b00));
  assign c_h_1_9 = IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_50_2_sdt_1 & IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_50_2_sdt_2;
  assign c_h_1_10 = c_h_1_6 & IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_42_4_sdt_4;
  assign IntLeadZero_23U_leading_sign_23_0_rtn_and_85_nl = c_h_1_6 & (~ IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_42_4_sdt_4);
  assign IntLeadZero_23U_leading_sign_23_0_rtn_and_83_nl = c_h_1_2 & (c_h_1_5 | (~
      IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_18_3_sdt_3)) & (c_h_1_9 | (~ c_h_1_10));
  assign IntLeadZero_23U_leading_sign_23_0_rtn_and_90_nl = IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_6_2_sdt_1
      & (IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_14_2_sdt_1 | (~ IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_6_2_sdt_2))
      & (~((~(IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_26_2_sdt_1 & (IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_34_2_sdt_1
      | (~ IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_26_2_sdt_2)))) & c_h_1_6))
      & (~((~(IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_50_2_sdt_1 & (IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_56_2_sdt_1
      | (~ IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_50_2_sdt_2)))) & c_h_1_10));
  assign IntLeadZero_23U_leading_sign_23_0_rtn_IntLeadZero_23U_leading_sign_23_0_rtn_or_2_nl
      = ((~((mantissa[22]) | (~((mantissa[21:20]!=2'b01))))) & (~(((mantissa[18])
      | (~((mantissa[17:16]!=2'b01)))) & c_h_1_2)) & (~((~((~((mantissa[14]) | (~((mantissa[13:12]!=2'b01)))))
      & (~(((mantissa[10]) | (~((mantissa[9:8]!=2'b01)))) & c_h_1_5)))) & c_h_1_6))
      & (~((~((~((mantissa[6]) | (~((mantissa[5:4]!=2'b01))))) & (~((~((mantissa[2:1]==2'b01)))
      & c_h_1_9)))) & c_h_1_10))) | ((~ (mantissa[0])) & IntLeadZero_23U_leading_sign_23_0_rtn_wrs_c_56_2_sdt_1
      & c_h_1_9 & c_h_1_10);
  assign rtn = {c_h_1_10 , (IntLeadZero_23U_leading_sign_23_0_rtn_and_85_nl) , (IntLeadZero_23U_leading_sign_23_0_rtn_and_83_nl)
      , (IntLeadZero_23U_leading_sign_23_0_rtn_and_90_nl) , (IntLeadZero_23U_leading_sign_23_0_rtn_IntLeadZero_23U_leading_sign_23_0_rtn_or_2_nl)};
endmodule