module origen_132788 (
    input A,
    input B,
    input C,
    input D,
    input VPWR,
    input VGND,
    input VPB,
    input VNB,
    output Y
);

    wire intermediate;

    // Assuming sky130_fd_sc_ms__nand3b is defined elsewhere
    // If not, you may need to define it or include the appropriate library
    sky130_fd_sc_ms__nand3b nand3b_1 (
        .A_N(D),
        .B(A),
        .C(B),
        .Y(intermediate),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

    sky130_fd_sc_ms__nand3b nand3b_2 (
        .A_N(intermediate),
        .B(C),
        .C(1'b1),
        .Y(Y),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

endmodule

// Placeholder module definition for sky130_fd_sc_ms__nand3b
// Replace this with the actual module definition if available
module sky130_fd_sc_ms__nand3b (
    input A_N,
    input B,
    input C,
    output Y,
    input VPWR,
    input VGND,
    input VPB,
    input VNB
);
    assign Y = ~(~A_N & B & C);
endmodule