module origen_081879(
    input S,
    input D0,
    input D1,
    output Y
);
    assign Y = S ? D1 : D0;
endmodule

module mux41(
    input S0,
    input S1,
    input D0,
    input D1,
    input D2,
    input D3,
    output Y
);
    wire w1, w2;
    mux21 m1(.S(S0), .D0(D0), .D1(D1), .Y(w1));
    mux21 m2(.S(S0), .D0(D2), .D1(D3), .Y(w2));
    mux21 m3(.S(S1), .D0(w1), .D1(w2), .Y(Y));
endmodule

module mux81(
    input S0,
    input S1,
    input S2,
    input D0,
    input D1,
    input D2,
    input D3,
    input D4,
    input D5,
    input D6,
    input D7,
    output Y
);
    wire w1, w2;
    mux41 m1(.S0(S0), .S1(S1), .D0(D0), .D1(D1), .D2(D2), .D3(D3), .Y(w1));
    mux41 m2(.S0(S0), .S1(S1), .D0(D4), .D1(D5), .D2(D6), .D3(D7), .Y(w2));
    mux21 m3(.S(S2), .D0(w1), .D1(w2), .Y(Y));
endmodule

module t1mux81(
    input A,
    input B,
    input C,
    output Y
);
    mux81 m(.S0(A), .S1(B), .S2(C), .D0(1'b0), .D1(1'b1), .D2(1'b1), .D3(1'b0), .D4(1'b1), .D5(1'b0), .D6(1'b0), .D7(1'b1), .Y(Y));
endmodule

module t1mux41(
    input A,
    input B,
    input C,
    output Y
);
    mux41 m(.S0(A), .S1(B), .D0(C), .D1(~C), .D2(~C), .D3(C), .Y(Y));
endmodule

module t1mux21(
    input A,
    input B,
    input C,
    output Y
);
    wire w1, w2;
    assign w1 = A ^ B;
    assign w2 = ~(A ^ B);
    mux21 m(.S(C), .D0(w1), .D1(w2), .Y(Y));
endmodule

module t2mux81(
    input A,
    input B,
    input C,
    output Y
);
    mux81 m(.S0(A), .S1(B), .S2(C), .D0(1'b1), .D1(1'b0), .D2(1'b0), .D3(1'b1), .D4(1'b0), .D5(1'b1), .D6(1'b1), .D7(1'b0), .Y(Y));
endmodule

module t2mux41(
    input A,
    input B,
    input C,
    output Y
);
    wire w1, w2;
    assign w1 = A & B;
    assign w2 = A | B;
    mux41 m(.S0(A), .S1(B), .D0(C), .D1(w1), .D2(w2), .D3(~C), .Y(Y));
endmodule

module t2mux21(
    input A,
    input B,
    input C,
    output Y
);
    wire w1, w2;
    assign w1 = ~(A & B);
    assign w2 = ~A;
    mux21 m(.S(C), .D0(w1), .D1(w2), .Y(Y));
endmodule