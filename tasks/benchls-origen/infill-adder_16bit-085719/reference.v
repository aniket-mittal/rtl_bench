module origen_085719(
    input [15:0] A,
    input [15:0] B,
    input CI,
    output [15:0] S,
    output CO,
    output OFL
);

    wire [16:0] sum;
    assign sum = A + B + CI;
    assign S = sum[15:0];
    assign CO = sum[16];
    assign OFL = (A[15] == B[15]) && (S[15] != A[15]);

endmodule

module ADD48(
    input [47:0] A,
    input [47:0] B,
    input CI,
    output [47:0] S,
    output CO,
    output OFL
);

    wire CO1, CO2;
    wire OFL1, OFL2;

    ADD16_HXILINX_ADD48 XLXI_1 (
        .A(A[15:0]),
        .B(B[15:0]),
        .CI(CI),
        .S(S[15:0]),
        .CO(CO1),
        .OFL(OFL1)
    );

    ADD16_HXILINX_ADD48 XLXI_2 (
        .A(A[31:16]),
        .B(B[31:16]),
        .CI(CO1),
        .S(S[31:16]),
        .CO(CO2),
        .OFL(OFL2)
    );

    ADD16_HXILINX_ADD48 XLXI_3 (
        .A(A[47:32]),
        .B(B[47:32]),
        .CI(CO2),
        .S(S[47:32]),
        .CO(CO),
        .OFL(OFL)
    );

endmodule