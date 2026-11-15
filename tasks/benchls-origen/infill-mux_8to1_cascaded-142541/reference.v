module origen_142541 (
    output Z,
    input [7:0] D,
    input [2:0] S,
    input VPWR,
    input VGND,
    input VPB,
    input VNB
);

    wire mux1_out, mux2_out;

    mux4to1 mux1 (
        .Z(mux1_out),
        .D(D[3:0]),
        .S(S[1:0]),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

    mux4to1 mux2 (
        .Z(mux2_out),
        .D(D[7:4]),
        .S(S[1:0]),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

    mux4to1 mux_final (
        .Z(Z),
        .D({2'b00, mux2_out, mux1_out}),
        .S({1'b0, S[2]}),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

endmodule

module mux4to1 (
    output Z,
    input [3:0] D,
    input [1:0] S,
    input VPWR,
    input VGND,
    input VPB,
    input VNB
);
    // Implementation of 4-to-1 multiplexer
    assign Z = S[1] ? (S[0] ? D[3] : D[2]) : (S[0] ? D[1] : D[0]);
endmodule