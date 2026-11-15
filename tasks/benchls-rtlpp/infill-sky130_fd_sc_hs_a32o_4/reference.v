module sky130_fd_sc_hs__a32o_4 (
    X ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    supply1 VPWR;
    supply0 VGND;

    wire and1_out;
    wire and2_out;

    and and1 (and1_out, A1, A2, A3);
    and and2 (and2_out, B1, B2);
    or  or1  (X, and1_out, and2_out);

endmodule