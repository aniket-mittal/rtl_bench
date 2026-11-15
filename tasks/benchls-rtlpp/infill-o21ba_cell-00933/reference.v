module rtlpp_00933 (
    X   ,
    A1  ,
    A2  ,
    B1_N,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // O21BA logic implementation with power pins
    wire and_out;
    wire not_out;
    wire or_out;

    and (and_out, A1, A2);
    not (not_out, B1_N);
    or (or_out, and_out, not_out);

    assign X = (VPWR & or_out) | (~VPWR & VGND);

endmodule