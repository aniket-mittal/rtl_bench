module origen_029202(
    input [29:0] in,
    output [9:0] out
);

    wire origtmp1, origtmp2, origtmp3, origtmp4, origtmp5, origtmp6, origtmp7, origtmp8;
    wire origtmp9, origtmp10, origtmp11, origtmp12, origtmp13, origtmp14, origtmp15, origtmp16;
    wire origtmp17, origtmp18, origtmp19, origtmp20, origtmp21, origtmp22, origtmp23, origtmp24;
    wire origtmp25, origtmp26, origtmp27, origtmp28, origtmp29, origtmp30, origtmp31, origtmp32;
    wire origtmp33, origtmp34, origtmp35, origtmp36;

    assign origtmp1 = in[0] & in[1];
    assign origtmp2 = in[2] | in[3];
    assign origtmp3 = origtmp1 ^ origtmp2;
    assign origtmp4 = in[4] & in[5];
    assign origtmp5 = in[6] | in[7];
    assign origtmp6 = origtmp4 ^ origtmp5;
    assign origtmp7 = origtmp3 & origtmp6;
    assign origtmp8 = in[8] ^ in[9];
    assign origtmp9 = in[10] & in[11];
    assign origtmp10 = origtmp8 | origtmp9;
    assign origtmp11 = in[12] ^ in[13];
    assign origtmp12 = in[14] & in[15];
    assign origtmp13 = origtmp11 | origtmp12;
    assign origtmp14 = origtmp10 & origtmp13;
    assign origtmp15 = origtmp7 ^ origtmp14;
    assign origtmp16 = in[16] & in[17];
    assign origtmp17 = in[18] | in[19];
    assign origtmp18 = origtmp16 ^ origtmp17;
    assign origtmp19 = in[20] & in[21];
    assign origtmp20 = in[22] | in[23];
    assign origtmp21 = origtmp19 ^ origtmp20;
    assign origtmp22 = origtmp18 & origtmp21;
    assign origtmp23 = in[24] ^ in[25];
    assign origtmp24 = in[26] & in[27];
    assign origtmp25 = origtmp23 | origtmp24;
    assign origtmp26 = origtmp22 ^ origtmp25;
    assign origtmp27 = origtmp15 & origtmp26;
    assign out[0] = origtmp27;

    assign out[1] = 1'b0 ^ in[28];
    assign out[2] = 1'b0;
    assign out[3] = 1'b0;
    assign out[4] = 1'b0;
    assign out[5] = 1'b1;
    assign out[6] = 1'b1;
    assign out[7] = 1'b0;
    assign out[8] = 1'b0;
    assign out[9] = 1'b1 & (in[29] | 1'b0);

endmodule