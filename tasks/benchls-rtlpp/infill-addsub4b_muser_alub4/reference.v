module AddSub1b_MUSER_ALUb4(A, B, C, Ctrl, Co, S);
    input A;
    input B;
    input C;
    input Ctrl;
    output Co;
    output S;
    
    wire XLXN_4;
    wire XLXN_11;
    wire XLXN_20;
    wire XLXN_21;
    
    assign XLXN_4 = B ^ Ctrl;
    assign XLXN_11 = A ^ XLXN_4;
    assign S = XLXN_11 ^ C;
    assign XLXN_21 = A & XLXN_4;
    assign XLXN_20 = XLXN_11 & C;
    assign Co = XLXN_21 | XLXN_20;
endmodule

module AddSub4b_MUSER_ALUb4(A, B, Ctrl, Co, S);
    input [3:0] A;
    input [3:0] B;
    input Ctrl;
    output Co;
    output [3:0] S;
    
    wire XLXN_12;
    wire XLXN_15;
    wire XLXN_17;
    
    AddSub1b_MUSER_ALUb4  XLXI_2 (.A(A[0]), .B(B[0]), .C(Ctrl), .Ctrl(Ctrl), .Co(XLXN_12), .S(S[0]));
    AddSub1b_MUSER_ALUb4  XLXI_4 (.A(A[1]), .B(B[1]), .C(XLXN_12), .Ctrl(Ctrl), .Co(XLXN_15), .S(S[1]));
    AddSub1b_MUSER_ALUb4  XLXI_5 (.A(A[2]), .B(B[2]), .C(XLXN_15), .Ctrl(Ctrl), .Co(XLXN_17), .S(S[2]));
    AddSub1b_MUSER_ALUb4  XLXI_6 (.A(A[3]), .B(B[3]), .C(XLXN_17), .Ctrl(Ctrl), .Co(Co), .S(S[3]));
endmodule