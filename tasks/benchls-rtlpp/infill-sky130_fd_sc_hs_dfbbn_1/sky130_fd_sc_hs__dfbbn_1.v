module sky130_fd_sc_hs__dfbbn_1 (
    Q      ,
    Q_N    ,
    D      ,
    CLK_N  ,
    SET_B  ,
    RESET_B
);

    output Q      ;
    output Q_N    ;
    input  D      ;
    input  CLK_N  ;
    input  SET_B  ;
    input  RESET_B;

    // Supply pins
    supply1 VPWR;
    supply0 VGND;

    // Internal signals
    reg q_int, qn_int;

    [MASKED]

    assign Q = q_int;
    assign Q_N = qn_int;

endmodule