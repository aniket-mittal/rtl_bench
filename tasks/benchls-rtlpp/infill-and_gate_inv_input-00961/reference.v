module rtlpp_00961 (
    output X,
    input  A_N,
    input  B,
    input  C,
    input  VPWR,
    input  VGND,
    input  VPB,
    input  VNB
);
    wire not_a;
    wire and_out;

    // Logic for inverting A_N
    not (not_a, A_N);

    // Logic for AND operation
    and (and_out, not_a, B, C);

    // Output assignment
    assign X = and_out;

endmodule