module rtlpp_03899 (
    Q      ,
    CLK    ,
    D      ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    reg Q_int;

    [MASKED]

    assign Q = Q_int;

endmodule