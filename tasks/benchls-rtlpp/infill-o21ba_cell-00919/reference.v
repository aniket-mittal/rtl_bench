module rtlpp_00919 (
    X   ,
    A1  ,
    A2  ,
    B1_N,
    VPWR,
    VGND
);

    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;
    input  VPWR;
    input  VGND;

    wire and_output;
    wire or_output;

    // Equivalent logic for sky130_fd_sc_hs__o21ba
    assign and_output = A1 & A2;
    assign or_output = and_output | ~B1_N;
    assign X = or_output & VPWR & ~VGND;

endmodule