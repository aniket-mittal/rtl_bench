module INV(I, O);
    input I;
    output O;

    assign O = ~I;
endmodule

module NAND2(I0, I1, O);
    input I0;
    input I1;
    output O;

    assign O = ~(I0 & I1);
endmodule

module RS_NAND_MUSER_D_EN(Rn, Sn, Q, Qn);
    input Rn;
    input Sn;
    output Q;
    output Qn;
    
    wire Q_DUMMY;
    wire Qn_DUMMY;
    
    assign Q = Q_DUMMY;
    assign Qn = Qn_DUMMY;
    
    NAND2  XLXI_1 (.I0(Qn_DUMMY), .I1(Sn), .O(Q_DUMMY));
    NAND2  XLXI_2 (.I0(Rn), .I1(Q_DUMMY), .O(Qn_DUMMY));
endmodule

module RS_EN_MUSER_D_EN(C, R, S, Q, Qn);
    input C;
    input R;
    input S;
    output Q;
    output Qn;
    
    wire XLXN_1;
    wire XLXN_2;
    
    RS_NAND_MUSER_D_EN  RS1 (.Rn(XLXN_2), .Sn(XLXN_1), .Q(Q), .Qn(Qn));
    NAND2  XLXI_2 (.I0(C), .I1(S), .O(XLXN_1));
    NAND2  XLXI_3 (.I0(R), .I1(C), .O(XLXN_2));
endmodule

module D_EN(C, D, Q, Qn);
    input C;
    input D;
    output Q;
    output Qn;
    
    wire XLXN_1;
    
    RS_EN_MUSER_D_EN  RS2 (.C(C), .R(XLXN_1), .S(D), .Q(Q), .Qn(Qn));
    INV  XLXI_2 (.I(D), .O(XLXN_1));
endmodule