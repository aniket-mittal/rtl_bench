module CDP_ICVT_leading_sign_10_0 (
  mantissa, rtn
);
  input [9:0] mantissa;
  output [3:0] rtn;


  // Interconnect Declarations
  wire IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_6_2_sdt_2;
  wire IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_18_3_sdt_3;
  wire IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_6_2_sdt_1;
  wire IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_14_2_sdt_1;
  wire c_h_1_2;
  wire c_h_1_3;
  wire IntLeadZero_10U_leading_sign_10_0_rtn_and_35_ssc;

  wire[0:0] IntLeadZero_10U_leading_sign_10_0_rtn_and_31_nl;
  wire[0:0] IntLeadZero_10U_leading_sign_10_0_rtn_IntLeadZero_10U_leading_sign_10_0_rtn_or_nl;
  wire[0:0] IntLeadZero_10U_leading_sign_10_0_rtn_IntLeadZero_10U_leading_sign_10_0_rtn_nor_6_nl;

  // Interconnect Declarations for Component Instantiations 
  assign IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_6_2_sdt_2 = ~((mantissa[7:6]!=2'b00));
  assign IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_6_2_sdt_1 = ~((mantissa[9:8]!=2'b00));
  assign IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_14_2_sdt_1 = ~((mantissa[5:4]!=2'b00));
  assign c_h_1_2 = IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_6_2_sdt_1 & IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_6_2_sdt_2;
  assign IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_18_3_sdt_3 = (mantissa[3:2]==2'b00)
      & IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_14_2_sdt_1;
  assign c_h_1_3 = c_h_1_2 & IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_18_3_sdt_3;
  assign IntLeadZero_10U_leading_sign_10_0_rtn_and_35_ssc = (mantissa[1:0]==2'b00)
      & c_h_1_3;
  assign IntLeadZero_10U_leading_sign_10_0_rtn_and_31_nl = c_h_1_2 & (~ IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_18_3_sdt_3);
  assign IntLeadZero_10U_leading_sign_10_0_rtn_IntLeadZero_10U_leading_sign_10_0_rtn_or_nl
      = (IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_6_2_sdt_1 & (IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_14_2_sdt_1
      | (~ IntLeadZero_10U_leading_sign_10_0_rtn_wrs_c_6_2_sdt_2)) & (~ c_h_1_3))
      | IntLeadZero_10U_leading_sign_10_0_rtn_and_35_ssc;
  assign IntLeadZero_10U_leading_sign_10_0_rtn_IntLeadZero_10U_leading_sign_10_0_rtn_nor_6_nl
      = ~((mantissa[9]) | (~((mantissa[8:7]!=2'b01))) | (((mantissa[5]) | (~((mantissa[4:3]!=2'b01))))
      & c_h_1_2) | ((mantissa[1]) & c_h_1_3) | IntLeadZero_10U_leading_sign_10_0_rtn_and_35_ssc);
  assign rtn = {c_h_1_3 , (IntLeadZero_10U_leading_sign_10_0_rtn_and_31_nl) , (IntLeadZero_10U_leading_sign_10_0_rtn_IntLeadZero_10U_leading_sign_10_0_rtn_or_nl)
      , (IntLeadZero_10U_leading_sign_10_0_rtn_IntLeadZero_10U_leading_sign_10_0_rtn_nor_6_nl)};
endmodule