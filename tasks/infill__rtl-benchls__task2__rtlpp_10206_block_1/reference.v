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

    always @(posedge CLK or posedge SCE) begin
        if(SCE) begin
            Q_internal = SCD;
        end else if (DE) begin
            Q_internal = D;
        end
    end

    always @(Q_internal) begin
        Q_N_internal = ~Q_internal;
    end

    assign Q = Q_internal;
    assign Q_N = Q_N_internal;

endmodule