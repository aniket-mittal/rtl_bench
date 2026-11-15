module sky130_fd_sc_hs__dfsbp_1 (
    CLK  ,
    D    ,
    Q    ,
    Q_N  ,
    SET_B
);

    input  CLK  ;
    input  D    ;
    output Q    ;
    output Q_N  ;
    input  SET_B;

    supply1 VPWR;
    supply0 VGND;

    // Internal logic
    reg Q_int, Q_N_int;
    [MASKED]

    assign Q = Q_int;
    assign Q_N = Q_N_int;

endmodule