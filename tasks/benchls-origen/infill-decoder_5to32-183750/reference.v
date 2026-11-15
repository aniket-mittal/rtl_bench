module origen_183750(
    input [4:0] in,
    output [31:0] out
);

wire in_0, in_1, in_2, in_3, in_4;
wire not_in_0, not_in_1, not_in_2, not_in_3, not_in_4;

assign in_0 = in[0];
assign in_1 = in[1];
assign in_2 = in[2];
assign in_3 = in[3];
assign in_4 = in[4];

assign not_in_0 = ~in_0;
assign not_in_1 = ~in_1;
assign not_in_2 = ~in_2;
assign not_in_3 = ~in_3;
assign not_in_4 = ~in_4;

assign out[0] = not_in_4 & not_in_3 & not_in_2 & not_in_1 & not_in_0;
assign out[1] = not_in_4 & not_in_3 & not_in_2 & not_in_1 & in_0;
assign out[2] = not_in_4 & not_in_3 & not_in_2 & in_1 & not_in_0;
assign out[3] = not_in_4 & not_in_3 & not_in_2 & in_1 & in_0;
assign out[4] = not_in_4 & not_in_3 & in_2 & not_in_1 & not_in_0;
assign out[5] = not_in_4 & not_in_3 & in_2 & not_in_1 & in_0;
assign out[6] = not_in_4 & not_in_3 & in_2 & in_1 & not_in_0;
assign out[7] = not_in_4 & not_in_3 & in_2 & in_1 & in_0;
assign out[8] = not_in_4 & in_3 & not_in_2 & not_in_1 & not_in_0;
assign out[9] = not_in_4 & in_3 & not_in_2 & not_in_1 & in_0;
assign out[10] = not_in_4 & in_3 & not_in_2 & in_1 & not_in_0;
assign out[11] = not_in_4 & in_3 & not_in_2 & in_1 & in_0;
assign out[12] = not_in_4 & in_3 & in_2 & not_in_1 & not_in_0;
assign out[13] = not_in_4 & in_3 & in_2 & not_in_1 & in_0;
assign out[14] = not_in_4 & in_3 & in_2 & in_1 & not_in_0;
assign out[15] = not_in_4 & in_3 & in_2 & in_1 & in_0;
assign out[16] = in_4 & not_in_3 & not_in_2 & not_in_1 & not_in_0;
assign out[17] = in_4 & not_in_3 & not_in_2 & not_in_1 & in_0;
assign out[18] = in_4 & not_in_3 & not_in_2 & in_1 & not_in_0;
assign out[19] = in_4 & not_in_3 & not_in_2 & in_1 & in_0;
assign out[20] = in_4 & not_in_3 & in_2 & not_in_1 & not_in_0;
assign out[21] = in_4 & not_in_3 & in_2 & not_in_1 & in_0;
assign out[22] = in_4 & not_in_3 & in_2 & in_1 & not_in_0;
assign out[23] = in_4 & not_in_3 & in_2 & in_1 & in_0;
assign out[24] = in_4 & in_3 & not_in_2 & not_in_1 & not_in_0;
assign out[25] = in_4 & in_3 & not_in_2 & not_in_1 & in_0;
assign out[26] = in_4 & in_3 & not_in_2 & in_1 & not_in_0;
assign out[27] = in_4 & in_3 & not_in_2 & in_1 & in_0;
assign out[28] = in_4 & in_3 & in_2 & not_in_1 & not_in_0;
assign out[29] = in_4 & in_3 & in_2 & not_in_1 & in_0;
assign out[30] = in_4 & in_3 & in_2 & in_1 & not_in_0;
assign out[31] = in_4 & in_3 & in_2 & in_1 & in_0;

endmodule