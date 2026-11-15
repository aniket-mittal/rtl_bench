module rtlpp_00894(InPut_9, 
                S_2, 
                S_4, 
                S_8, 
                OutPut_15);

    input [8:0] InPut_9;
    input S_2;
    input S_4;
    input S_8;
    output [15:0] OutPut_15;
   
    wire [9:0] XLXN_6;
    wire [11:0] XLXN_7;
    wire XLXN_1_2, XLXN_30_4;
    wire S0_8, XLXN_1_8, XLXN_50_8;
   
    // Multiplier_2_MUSER_Multiplier logic
    assign XLXN_1_2 = 1'b0;
    assign XLXN_6[0] = S_2 ? InPut_9[0] : InPut_9[0];
    assign XLXN_6[1] = S_2 ? InPut_9[1] : InPut_9[0];
    assign XLXN_6[2] = S_2 ? InPut_9[2] : InPut_9[1];
    assign XLXN_6[3] = S_2 ? InPut_9[3] : InPut_9[2];
    assign XLXN_6[4] = S_2 ? InPut_9[4] : InPut_9[3];
    assign XLXN_6[5] = S_2 ? InPut_9[5] : InPut_9[4];
    assign XLXN_6[6] = S_2 ? InPut_9[6] : InPut_9[5];
    assign XLXN_6[7] = S_2 ? InPut_9[7] : InPut_9[6];
    assign XLXN_6[8] = S_2 ? InPut_9[8] : InPut_9[7];
    assign XLXN_6[9] = InPut_9[8];
   
    // Multiplier_4_MUSER_Multiplier logic
    assign XLXN_1_4 = 1'b0;
    assign XLXN_30_4 = 1'b0;
    assign XLXN_7[0] = S_4 ? XLXN_6[0] : XLXN_6[0];
    assign XLXN_7[1] = S_4 ? XLXN_6[1] : XLXN_6[1];
    assign XLXN_7[2] = S_4 ? XLXN_6[2] : XLXN_6[2];
    assign XLXN_7[3] = S_4 ? XLXN_6[3] : XLXN_6[3];
    assign XLXN_7[4] = S_4 ? XLXN_6[4] : XLXN_6[4];
    assign XLXN_7[5] = S_4 ? XLXN_6[5] : XLXN_6[5];
    assign XLXN_7[6] = S_4 ? XLXN_6[6] : XLXN_6[6];
    assign XLXN_7[7] = S_4 ? XLXN_6[7] : XLXN_6[7];
    assign XLXN_7[8] = S_4 ? XLXN_6[8] : XLXN_6[8];
    assign XLXN_7[9] = S_4 ? XLXN_6[9] : XLXN_6[9];
    assign XLXN_7[10] = S_4 ? XLXN_6[9] : XLXN_7[9];
    assign XLXN_7[11] = XLXN_6[9];
  
    // Multiplier_8_MUSER_Multiplier logic
    assign S0_8 = 1'b0;
    assign XLXN_1_8 = 1'b0;
    assign XLXN_50_8 = 1'b0;
    assign OutPut_15[0] = S_8 ? XLXN_7[0] : XLXN_7[0];
    assign OutPut_15[1] = S_8 ? XLXN_7[1] : XLXN_7[1];
    assign OutPut_15[2] = S_8 ? XLXN_7[2] : XLXN_50_8;
    assign OutPut_15[3] = S_8 ? XLXN_7[3] : XLXN_7[0];
    assign OutPut_15[4] = S_8 ? XLXN_7[4] : XLXN_7[1];
    assign OutPut_15[5] = S_8 ? XLXN_7[5] : XLXN_7[2];
    assign OutPut_15[6] = S_8 ? XLXN_7[6] : XLXN_7[3];
    assign OutPut_15[7] = S_8 ? XLXN_7[7] : XLXN_7[4];
    assign OutPut_15[8] = S_8 ? XLXN_7[8] : XLXN_7[5];
    assign OutPut_15[9] = S_8 ? XLXN_7[9] : XLXN_7[6];
    assign OutPut_15[10] = S_8 ? XLXN_7[10] : XLXN_7[7];
    assign OutPut_15[11] = S_8 ? XLXN_7[11] : XLXN_7[8];
    assign OutPut_15[12] = S_8 ? XLXN_7[11] : XLXN_7[9];
    assign OutPut_15[13] = S_8 ? XLXN_7[11] : XLXN_7[10];
    assign OutPut_15[14] = S_8 ? XLXN_7[11] : XLXN_7[11];
    assign OutPut_15[15] = XLXN_7[11];
   
endmodule