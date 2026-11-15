module autovcoder_022032 (
    input clk,
    input [7:0] I_0_0,
    input [7:0] I_0_1,
    input [7:0] I_0_2,
    input [7:0] I_10_0,
    input [7:0] I_10_1,
    input [7:0] I_10_2,
    input [7:0] I_11_0,
    input [7:0] I_11_1,
    input [7:0] I_11_2,
    input [7:0] I_12_0,
    input [7:0] I_12_1,
    input [7:0] I_12_2,
    input [7:0] I_13_0,
    input [7:0] I_13_1,
    input [7:0] I_13_2,
    input [7:0] I_14_0,
    input [7:0] I_14_1,
    input [7:0] I_14_2,
    input [7:0] I_15_0,
    input [7:0] I_15_1,
    input [7:0] I_15_2,
    input [7:0] I_1_0,
    input [7:0] I_1_1,
    input [7:0] I_1_2,
    input [7:0] I_2_0,
    input [7:0] I_2_1,
    input [7:0] I_2_2,
    input [7:0] I_3_0,
    input [7:0] I_3_1,
    input [7:0] I_3_2,
    input [7:0] I_4_0,
    input [7:0] I_4_1,
    input [7:0] I_4_2,
    input [7:0] I_5_0,
    input [7:0] I_5_1,
    input [7:0] I_5_2,
    input [7:0] I_6_0,
    input [7:0] I_6_1,
    input [7:0] I_6_2,
    input [7:0] I_7_0,
    input [7:0] I_7_1,
    input [7:0] I_7_2,
    input [7:0] I_8_0,
    input [7:0] I_8_1,
    input [7:0] I_8_2,
    input [7:0] I_9_0,
    input [7:0] I_9_1,
    input [7:0] I_9_2,
    output [7:0] O_0_0_0,
    output [7:0] O_0_0_1,
    output [7:0] O_0_0_2,
    output [7:0] O_10_0_0,
    output [7:0] O_10_0_1,
    output [7:0] O_10_0_2,
    output [7:0] O_11_0_0,
    output [7:0] O_11_0_1,
    output [7:0] O_11_0_2,
    output [7:0] O_12_0_0,
    output [7:0] O_12_0_1,
    output [7:0] O_12_0_2,
    output [7:0] O_13_0_0,
    output [7:0] O_13_0_1,
    output [7:0] O_13_0_2,
    output [7:0] O_14_0_0,
    output [7:0] O_14_0_1,
    output [7:0] O_14_0_2,
    output [7:0] O_15_0_0,
    output [7:0] O_15_0_1,
    output [7:0] O_15_0_2,
    output [7:0] O_1_0_0,
    output [7:0] O_1_0_1,
    output [7:0] O_1_0_2,
    output [7:0] O_2_0_0,
    output [7:0] O_2_0_1,
    output [7:0] O_2_0_2,
    output [7:0] O_3_0_0,
    output [7:0] O_3_0_1,
    output [7:0] O_3_0_2,
    output [7:0] O_4_0_0,
    output [7:0] O_4_0_1,
    output [7:0] O_4_0_2,
    output [7:0] O_5_0_0,
    output [7:0] O_5_0_1,
    output [7:0] O_5_0_2,
    output [7:0] O_6_0_0,
    output [7:0] O_6_0_1,
    output [7:0] O_6_0_2,
    output [7:0] O_7_0_0,
    output [7:0] O_7_0_1,
    output [7:0] O_7_0_2,
    output [7:0] O_8_0_0,
    output [7:0] O_8_0_1,
    output [7:0] O_8_0_2,
    output [7:0] O_9_0_0,
    output [7:0] O_9_0_1,
    output [7:0] O_9_0_2,
    output valid_down,
    input valid_up
);
  assign O_0_0_0 = I_0_0;
  assign O_0_0_1 = I_0_1;
  assign O_0_0_2 = I_0_2;
  assign O_10_0_0 = I_10_0;
  assign O_10_0_1 = I_10_1;
  assign O_10_0_2 = I_10_2;
  assign O_11_0_0 = I_11_0;
  assign O_11_0_1 = I_11_1;
  assign O_11_0_2 = I_11_2;
  assign O_12_0_0 = I_12_0;
  assign O_12_0_1 = I_12_1;
  assign O_12_0_2 = I_12_2;
  assign O_13_0_0 = I_13_0;
  assign O_13_0_1 = I_13_1;
  assign O_13_0_2 = I_13_2;
  assign O_14_0_0 = I_14_0;
  assign O_14_0_1 = I_14_1;
  assign O_14_0_2 = I_14_2;
  assign O_15_0_0 = I_15_0;
  assign O_15_0_1 = I_15_1;
  assign O_15_0_2 = I_15_2;
  assign O_1_0_0 = I_1_0;
  assign O_1_0_1 = I_1_1;
  assign O_1_0_2 = I_1_2;
  assign O_2_0_0 = I_2_0;
  assign O_2_0_1 = I_2_1;
  assign O_2_0_2 = I_2_2;
  assign O_3_0_0 = I_3_0;
  assign O_3_0_1 = I_3_1;
  assign O_3_0_2 = I_3_2;
  assign O_4_0_0 = I_4_0;
  assign O_4_0_1 = I_4_1;
  assign O_4_0_2 = I_4_2;
  assign O_5_0_0 = I_5_0;
  assign O_5_0_1 = I_5_1;
  assign O_5_0_2 = I_5_2;
  assign O_6_0_0 = I_6_0;
  assign O_6_0_1 = I_6_1;
  assign O_6_0_2 = I_6_2;
  assign O_7_0_0 = I_7_0;
  assign O_7_0_1 = I_7_1;
  assign O_7_0_2 = I_7_2;
  assign O_8_0_0 = I_8_0;
  assign O_8_0_1 = I_8_1;
  assign O_8_0_2 = I_8_2;
  assign O_9_0_0 = I_9_0;
  assign O_9_0_1 = I_9_1;
  assign O_9_0_2 = I_9_2;
  assign valid_down = valid_up;
endmodule

