module origen_164159(
    input [11:0] A,
    input [11:0] B,
    output [12:0] O
);

wire sig_38, sig_39, sig_40, sig_41, sig_42, sig_43, sig_44, sig_45, sig_46, sig_47, sig_48;
wire sig_58, sig_59, sig_60, sig_61, sig_62, sig_63, sig_69, sig_70, sig_71;
wire sig_74, sig_75, sig_78, sig_79, sig_86, sig_87, sig_88, sig_89, sig_90, sig_91;
wire sig_97, sig_98, sig_99, sig_100, sig_101, sig_102, sig_103;

assign sig_38 = A[0] & B[0];
assign sig_39 = A[0] ^ B[0];
assign sig_40 = A[1] & B[1];
assign sig_41 = A[1] ^ B[1];
assign sig_42 = A[2] & B[2];
assign sig_43 = A[2] ^ B[2];
assign sig_44 = A[3] & B[3];
assign sig_45 = A[3] ^ B[3];
assign sig_46 = A[4] & B[4];
assign sig_47 = A[4] ^ B[4];
assign sig_48 = A[5] & B[5];

assign sig_58 = sig_39;
assign sig_59 = sig_41 ^ sig_58;
assign sig_60 = sig_43 ^ sig_59;
assign sig_61 = sig_45 ^ sig_60;
assign sig_62 = sig_47 ^ sig_61;
assign sig_63 = sig_48 ^ sig_62;

assign sig_69 = sig_42 & sig_58;
assign sig_70 = sig_44 & sig_59;
assign sig_71 = sig_46 & sig_60;

assign sig_74 = A[5];
assign sig_75 = sig_63;
assign sig_78 = sig_69;
assign sig_79 = sig_70;
assign sig_86 = sig_71;
assign sig_87 = A[6];
assign sig_88 = A[7];
assign sig_89 = A[8];
assign sig_90 = A[9];
assign sig_91 = A[10];

assign sig_97 = sig_74;
assign sig_98 = sig_75;
assign sig_99 = sig_78;
assign sig_100 = sig_79;
assign sig_101 = sig_86;
assign sig_102 = sig_87;
assign sig_103 = sig_88 & sig_89 & sig_90 & sig_91;

assign O = {sig_103, sig_102, sig_101, sig_100, sig_99, sig_98, sig_97};

endmodule