module rtlpp_00941 (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    wire and_out;
    wire or_out;

    and u_and (and_out, A1, A2, A3, A4);
    or  u_or  (or_out, and_out, B1);
    not u_not (Y, or_out);

endmodule