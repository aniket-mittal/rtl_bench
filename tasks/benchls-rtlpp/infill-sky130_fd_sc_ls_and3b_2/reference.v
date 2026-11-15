module sky130_fd_sc_ls__and3b_2 (
    output X,
    input  A_N,
    input  B,
    input  C
);
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB;
    supply0 VNB;

    wire not_a;
    wire and_out;

    // Logic for inverting A_N
    not (not_a, A_N);

    // Logic for AND operation
    and (and_out, not_a, B, C);

    // Output assignment
    assign X = and_out;

endmodule