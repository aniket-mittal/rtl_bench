module origen_148715 (
    input A,
    input B,
    input C,
    input D,
    input VPWR,
    output X
);

    wire intermediate1, intermediate2;

    sky130_fd_sc_hdll__and2b and1 (
        .X(intermediate1),
        .A_N(A),
        .B(B),
        .VPWR(VPWR),
        .VGND(1'b0),
        .VPB(VPWR),
        .VNB(1'b0)
    );

    sky130_fd_sc_hdll__and2b and2 (
        .X(intermediate2),
        .A_N(C),
        .B(D),
        .VPWR(VPWR),
        .VGND(1'b0),
        .VPB(VPWR),
        .VNB(1'b0)
    );

    sky130_fd_sc_hdll__and2b and3 (
        .X(X),
        .A_N(intermediate1),
        .B(intermediate2),
        .VPWR(VPWR),
        .VGND(1'b0),
        .VPB(VPWR),
        .VNB(1'b0)
    );

endmodule

module sky130_fd_sc_hdll__and2b (
    output X,
    input A_N,
    input B,
    input VPWR,
    input VGND,
    input VPB,
    input VNB
);
    assign X = ~A_N & B;
endmodule