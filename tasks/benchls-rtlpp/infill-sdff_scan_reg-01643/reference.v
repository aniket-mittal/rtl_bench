module rtlpp_01643 (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    reg Q_reg;
    wire reset;

    assign reset = ~RESET_B;

    always @(posedge CLK or posedge reset)
    begin
        if (reset)
            Q_reg <= 1'b0;
        else if (SCE)
            Q_reg <= SCD;
        else
            Q_reg <= D;
    end

    assign Q = Q_reg;

endmodule