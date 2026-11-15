module rtlpp_10206 (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    DE  ,
    SCD ,
    SCE ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    output Q   ;
    output Q_N ;
    input  CLK ;
    input  D   ;
    input  DE  ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    reg Q_internal;
    reg Q_N_internal;

    [MASKED]

    always @(Q_internal) begin
        Q_N_internal = ~Q_internal;
    end

    assign Q = Q_internal;
    assign Q_N = Q_N_internal;

endmodule