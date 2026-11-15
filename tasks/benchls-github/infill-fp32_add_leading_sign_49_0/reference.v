module FP32_ADD_leading_sign_49_0 (
  mantissa, rtn
);
  input [48:0] mantissa;
  output [5:0] rtn;


  // Interconnect Declarations
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_6_2_sdt_2;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_18_3_sdt_3;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_26_2_sdt_2;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_42_4_sdt_4;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_50_2_sdt_2;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_62_3_sdt_3;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_70_2_sdt_2;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_90_5_sdt_5;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_98_2_sdt_2;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_110_3_sdt_3;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_118_2_sdt_2;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_134_4_sdt_4;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_6_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_14_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_26_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_34_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_50_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_58_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_70_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_78_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_98_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_106_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_118_2_sdt_1;
  wire IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_126_2_sdt_1;
  wire c_h_1_2;
  wire c_h_1_5;
  wire c_h_1_6;
  wire c_h_1_9;
  wire c_h_1_12;
  wire c_h_1_13;
  wire c_h_1_14;
  wire c_h_1_17;
  wire c_h_1_20;
  wire c_h_1_21;
  wire c_h_1_22;
  wire c_h_1_23;

  wire[0:0] IntLeadZero_49U_leading_sign_49_0_rtn_and_189_nl;
  wire[0:0] IntLeadZero_49U_leading_sign_49_0_rtn_and_187_nl;
  wire[0:0] IntLeadZero_49U_leading_sign_49_0_rtn_and_194_nl;
  wire[0:0] IntLeadZero_49U_leading_sign_49_0_rtn_and_195_nl;
  wire[0:0] IntLeadZero_49U_leading_sign_49_0_rtn_IntLeadZero_49U_leading_sign_49_0_rtn_or_1_nl;

  // Interconnect Declarations for Component Instantiations 
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_6_2_sdt_2 = ~((mantissa[46:45]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_6_2_sdt_1 = ~((mantissa[48:47]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_14_2_sdt_1 = ~((mantissa[44:43]!=2'b00));
  assign c_h_1_2 = IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_6_2_sdt_1 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_6_2_sdt_2;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_18_3_sdt_3 = (mantissa[42:41]==2'b00)
      & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_14_2_sdt_1;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_26_2_sdt_2 = ~((mantissa[38:37]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_26_2_sdt_1 = ~((mantissa[40:39]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_34_2_sdt_1 = ~((mantissa[36:35]!=2'b00));
  assign c_h_1_5 = IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_26_2_sdt_1 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_26_2_sdt_2;
  assign c_h_1_6 = c_h_1_2 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_18_3_sdt_3;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_42_4_sdt_4 = (mantissa[34:33]==2'b00)
      & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_34_2_sdt_1 & c_h_1_5;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_50_2_sdt_2 = ~((mantissa[30:29]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_50_2_sdt_1 = ~((mantissa[32:31]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_58_2_sdt_1 = ~((mantissa[28:27]!=2'b00));
  assign c_h_1_9 = IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_50_2_sdt_1 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_50_2_sdt_2;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_62_3_sdt_3 = (mantissa[26:25]==2'b00)
      & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_58_2_sdt_1;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_70_2_sdt_2 = ~((mantissa[22:21]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_70_2_sdt_1 = ~((mantissa[24:23]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_78_2_sdt_1 = ~((mantissa[20:19]!=2'b00));
  assign c_h_1_12 = IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_70_2_sdt_1 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_70_2_sdt_2;
  assign c_h_1_13 = c_h_1_9 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_62_3_sdt_3;
  assign c_h_1_14 = c_h_1_6 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_42_4_sdt_4;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_90_5_sdt_5 = (mantissa[18:17]==2'b00)
      & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_78_2_sdt_1 & c_h_1_12 & c_h_1_13;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_98_2_sdt_2 = ~((mantissa[14:13]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_98_2_sdt_1 = ~((mantissa[16:15]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_106_2_sdt_1 = ~((mantissa[12:11]!=2'b00));
  assign c_h_1_17 = IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_98_2_sdt_1 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_98_2_sdt_2;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_110_3_sdt_3 = (mantissa[10:9]==2'b00)
      & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_106_2_sdt_1;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_118_2_sdt_2 = ~((mantissa[6:5]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_118_2_sdt_1 = ~((mantissa[8:7]!=2'b00));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_126_2_sdt_1 = ~((mantissa[4:3]!=2'b00));
  assign c_h_1_20 = IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_118_2_sdt_1 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_118_2_sdt_2;
  assign c_h_1_21 = c_h_1_17 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_110_3_sdt_3;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_134_4_sdt_4 = (mantissa[2:1]==2'b00)
      & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_126_2_sdt_1 & c_h_1_20;
  assign c_h_1_22 = c_h_1_21 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_134_4_sdt_4;
  assign c_h_1_23 = c_h_1_14 & IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_90_5_sdt_5;
  assign IntLeadZero_49U_leading_sign_49_0_rtn_and_189_nl = c_h_1_14 & (c_h_1_22
      | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_90_5_sdt_5));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_and_187_nl = c_h_1_6 & (c_h_1_13 |
      (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_42_4_sdt_4)) & (~((~(c_h_1_21
      & (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_134_4_sdt_4))) & c_h_1_23));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_and_194_nl = c_h_1_2 & (c_h_1_5 |
      (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_18_3_sdt_3)) & (~((~(c_h_1_9
      & (c_h_1_12 | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_62_3_sdt_3))))
      & c_h_1_14)) & (~(((~(c_h_1_17 & (c_h_1_20 | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_110_3_sdt_3))))
      | c_h_1_22) & c_h_1_23));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_and_195_nl = IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_6_2_sdt_1
      & (IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_14_2_sdt_1 | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_6_2_sdt_2))
      & (~((~(IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_26_2_sdt_1 & (IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_34_2_sdt_1
      | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_26_2_sdt_2)))) & c_h_1_6))
      & (~((~(IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_50_2_sdt_1 & (IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_58_2_sdt_1
      | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_50_2_sdt_2)) & (~((~(IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_70_2_sdt_1
      & (IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_78_2_sdt_1 | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_70_2_sdt_2))))
      & c_h_1_13)))) & c_h_1_14)) & (~(((~(IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_98_2_sdt_1
      & (IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_106_2_sdt_1 | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_98_2_sdt_2))
      & (~((~(IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_118_2_sdt_1 & (IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_126_2_sdt_1
      | (~ IntLeadZero_49U_leading_sign_49_0_rtn_wrs_c_118_2_sdt_2)))) & c_h_1_21))))
      | c_h_1_22) & c_h_1_23));
  assign IntLeadZero_49U_leading_sign_49_0_rtn_IntLeadZero_49U_leading_sign_49_0_rtn_or_1_nl
      = ((~((mantissa[48]) | (~((mantissa[47:46]!=2'b01))))) & (~(((mantissa[44])
      | (~((mantissa[43:42]!=2'b01)))) & c_h_1_2)) & (~((~((~((mantissa[40]) | (~((mantissa[39:38]!=2'b01)))))
      & (~(((mantissa[36]) | (~((mantissa[35:34]!=2'b01)))) & c_h_1_5)))) & c_h_1_6))
      & (~((~((~((mantissa[32]) | (~((mantissa[31:30]!=2'b01))))) & (~(((mantissa[28])
      | (~((mantissa[27:26]!=2'b01)))) & c_h_1_9)) & (~((~((~((mantissa[24]) | (~((mantissa[23:22]!=2'b01)))))
      & (~(((mantissa[20]) | (~((mantissa[19:18]!=2'b01)))) & c_h_1_12)))) & c_h_1_13))))
      & c_h_1_14)) & (~(((~((~((mantissa[16]) | (~((mantissa[15:14]!=2'b01))))) &
      (~(((mantissa[12]) | (~((mantissa[11:10]!=2'b01)))) & c_h_1_17)) & (~((~((~((mantissa[8])
      | (~((mantissa[7:6]!=2'b01))))) & (~(((mantissa[4]) | (~((mantissa[3:2]!=2'b01))))
      & c_h_1_20)))) & c_h_1_21)))) | c_h_1_22) & c_h_1_23))) | ((~ (mantissa[0]))
      & c_h_1_22 & c_h_1_23);
  assign rtn = {c_h_1_23 , (IntLeadZero_49U_leading_sign_49_0_rtn_and_189_nl) , (IntLeadZero_49U_leading_sign_49_0_rtn_and_187_nl)
      , (IntLeadZero_49U_leading_sign_49_0_rtn_and_194_nl) , (IntLeadZero_49U_leading_sign_49_0_rtn_and_195_nl)
      , (IntLeadZero_49U_leading_sign_49_0_rtn_IntLeadZero_49U_leading_sign_49_0_rtn_or_1_nl)};
endmodule