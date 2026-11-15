module sky130_fd_sc_ls__dfrtp_1 (
    Q      ,
    CLK    ,
    D      ,
    RESET_B
);

    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;

    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    reg Q_int;

    [MASKED]

    assign Q = Q_int;

endmodule