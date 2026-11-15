module origen_018382(
    input [7:0] A,
    input [7:0] B,
    input Comin,
    input Cin,
    output [8:0] S,
    output comover
);

    wire [8:0] Bout;
    wire [8:0] Comout;
    wire [8:0] Cout;

    com_1bit com0(.B(B[0]), .Comin(Comin), .Bout(Bout[0]), .Comout(Comout[0]));
    com_1bit com1(.B(B[1]), .Comin(Comout[0]), .Bout(Bout[1]), .Comout(Comout[1]));
    com_1bit com2(.B(B[2]), .Comin(Comout[1]), .Bout(Bout[2]), .Comout(Comout[2]));
    com_1bit com3(.B(B[3]), .Comin(Comout[2]), .Bout(Bout[3]), .Comout(Comout[3]));
    com_1bit com4(.B(B[4]), .Comin(Comout[3]), .Bout(Bout[4]), .Comout(Comout[4]));
    com_1bit com5(.B(B[5]), .Comin(Comout[4]), .Bout(Bout[5]), .Comout(Comout[5]));
    com_1bit com6(.B(B[6]), .Comin(Comout[5]), .Bout(Bout[6]), .Comout(Comout[6]));
    com_1bit com7(.B(B[7]), .Comin(Comout[6]), .Bout(Bout[7]), .Comout(Comout[7]));
    com_1bit com8(.B(1'b0), .Comin(Comout[7]), .Bout(Bout[8]), .Comout(Comout[8]));

    FA_1bit FA0(.A(A[0]), .B(Bout[0]), .Cin(Cin), .S(S[0]), .Cout(Cout[0]));
    FA_1bit FA1(.A(A[1]), .B(Bout[1]), .Cin(Cout[0]), .S(S[1]), .Cout(Cout[1]));
    FA_1bit FA2(.A(A[2]), .B(Bout[2]), .Cin(Cout[1]), .S(S[2]), .Cout(Cout[2]));
    FA_1bit FA3(.A(A[3]), .B(Bout[3]), .Cin(Cout[2]), .S(S[3]), .Cout(Cout[3]));
    FA_1bit FA4(.A(A[4]), .B(Bout[4]), .Cin(Cout[3]), .S(S[4]), .Cout(Cout[4]));
    FA_1bit FA5(.A(A[5]), .B(Bout[5]), .Cin(Cout[4]), .S(S[5]), .Cout(Cout[5]));
    FA_1bit FA6(.A(A[6]), .B(Bout[6]), .Cin(Cout[5]), .S(S[6]), .Cout(Cout[6]));
    FA_1bit FA7(.A(A[7]), .B(Bout[7]), .Cin(Cout[6]), .S(S[7]), .Cout(Cout[7]));
    FA_1bit FA8(.A(A[7]), .B(Bout[8]), .Cin(Cout[7]), .S(S[8]), .Cout(Cout[8]));

    assign comover = Cout[8];

endmodule

module com_1bit(
    input B,
    input Comin,
    output Bout,
    output Comout
);

    assign Bout = B ^ Comin;
    assign Comout = (B ^ Comin) | Comin;

endmodule

module FA_1bit(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & B) | (Cin & A);

endmodule